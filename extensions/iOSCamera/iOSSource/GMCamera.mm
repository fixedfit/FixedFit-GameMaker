//
//  GMCamera.mm
//  GMCamera
//
//  Created by Benoît Rouleau on 2015-02-22.
//
//

#import "GMCamera.h"
#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
#include <asl.h>
#include <stdio.h>

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

static UIViewController *gmcamera_rootViewController = nil;
static BOOL gmcamera_takingPicture = NO;
static dispatch_queue_t gmcamera_sessionQueue;
static AVCaptureSession *gmcamera_session = nil;
static AVCaptureDevice *gmcamera_videoDevice = nil;
static AVCaptureDeviceInput *gmcamera_videoDeviceInput = nil;
static AVCaptureDeviceInput *gmcamera_audioDeviceInput = nil;
static AVCaptureMovieFileOutput *gmcamera_movieFileOutput = nil;
static AVCaptureStillImageOutput *gmcamera_stillImageOutput = nil;
static AVCaptureInputPort *gmcamera_inputPort = nil;
static int gmcamera_savedVideosCount = 0;
static int gmcamera_savedPicturesCount = 0;
static AVPreviewView *gmcamera_previewView = nil;
static int gmcamera_position = 0;
static int gmcamera_flash = 0;
static int gmcamera_captureWidth = 0;
static int gmcamera_captureHeight = 0;
static BOOL gmcamera_microphoneEnabled = YES;
static UIImagePickerController *gmcamera_imagePickerController;
static BOOL gmcamera_pictureFormatPng = NO;
static int gmcamera_pictureMaxWidth = -1;
static int gmcamera_pictureMaxHeight = -1;


@implementation GMCamera

const int EVENT_OTHER_SOCIAL = 70;
extern int CreateDsMap(int _num, ...);
extern void CreateAsynEventWithDSMap(int dsmapindex, int event_index);

- (void)camera_init {
    //NSLog(@"camera_init");
    gmcamera_rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    gmcamera_sessionQueue = dispatch_queue_create("session queue", DISPATCH_QUEUE_SERIAL);
    
    gmcamera_session = [[AVCaptureSession alloc] init];
    
    AVCaptureMovieFileOutput *movieFileOutput = [[[AVCaptureMovieFileOutput alloc] init] autorelease];
    if ([gmcamera_session canAddOutput:movieFileOutput]) {
        [gmcamera_session addOutput:movieFileOutput];
        gmcamera_movieFileOutput = movieFileOutput;
    }
    
    AVCaptureStillImageOutput *stillImageOutput = [[[AVCaptureStillImageOutput alloc] init] autorelease];
    if ([gmcamera_session canAddOutput:stillImageOutput]) {
        [stillImageOutput setOutputSettings:@{AVVideoCodecKey : AVVideoCodecJPEG}];
        [gmcamera_session addOutput:stillImageOutput];
        gmcamera_stillImageOutput = stillImageOutput;
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(captureSessionDidStart:)
                                                 name:AVCaptureSessionDidStartRunningNotification
                                               object:gmcamera_session];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(captureSessionDidStop:)
                                                 name:AVCaptureSessionDidStopRunningNotification
                                               object:gmcamera_session];
    
    gmcamera_previewView = [[AVPreviewView alloc] initWithFrame:gmcamera_rootViewController.view.frame];
    [gmcamera_previewView setSession:gmcamera_session];
    gmcamera_previewView.hidden = YES;
    [gmcamera_rootViewController.view addSubview:gmcamera_previewView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(orientationDidChange:)
                                                 name:UIApplicationDidChangeStatusBarOrientationNotification
                                               object:nil];
    
    gmcamera_imagePickerController = [[UIImagePickerController alloc] init];
    gmcamera_imagePickerController.delegate = self;
}

- (void)camera_enable:(int)position :(int)quality {
    //NSLog(@"camera_enable");
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
        if (granted) {
            if (gmcamera_microphoneEnabled) {
                [AVCaptureDevice requestAccessForMediaType:AVMediaTypeAudio completionHandler:^(BOOL granted) {
                    if (!granted) {
                        int dsMapIndex = CreateDsMap(3, "type", 0.0, "camera", "event", 0.0, "denied_access", "service", 0.0, "microphone");
                        CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
                    }
                    [self enableCameraPosition:position quality:quality];
                }];
            }
            else {
                [self enableCameraPosition:position quality:quality];
            }
        }
        else {
            int dsMapIndex = CreateDsMap(3, "type", 0.0, "camera", "event", 0.0, "denied_access", "service", 0.0, "camera");
            CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
        }
    }];
}

- (void)camera_disable {
    //NSLog(@"camera_disable");
    if ([self camera_is_enabled]) {
        dispatch_async(gmcamera_sessionQueue, ^{
            [gmcamera_session stopRunning];
            if (gmcamera_audioDeviceInput != nil) {
                [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategorySoloAmbient error:nil];
            }
        });
    }
}

- (int)camera_is_enabled {
    //NSLog(@"camera_is_enabled");
    if ([gmcamera_session isRunning]) {
        return 1;
    }
    return 0;
}

- (int)camera_exists:(int)position {
    //NSLog(@"camera_exists");
    NSArray *devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    for (AVCaptureDevice *device in devices) {
        if ([device position] == (NSInteger)position) {
            return 1;
        }
    }
    return 0;
}

- (int)camera_get_position {
    //NSLog(@"camera_get_position");
    if (![self camera_is_enabled]) {
        return -1;
    }
    return gmcamera_position;
}

- (int)camera_get_quality {
    //NSLog(@"camera_get_quality");
    if (![self camera_is_enabled]) {
        return -1;
    }
    NSString *sessionPreset = [gmcamera_session sessionPreset];
    if (sessionPreset == AVCaptureSessionPresetHigh) {
        return 0;
    }
    if (sessionPreset == AVCaptureSessionPresetMedium) {
        return 1;
    }
    if (sessionPreset == AVCaptureSessionPresetLow) {
        return 2;
    }
    if (sessionPreset == AVCaptureSessionPresetPhoto) {
        return 3;
    }
    return 4;
}

- (void)camera_take_picture {
    //NSLog(@"camera_take_picture");
    if ([self camera_is_enabled]) {
        dispatch_async(gmcamera_sessionQueue, ^{
            gmcamera_takingPicture = YES;
            
            [[gmcamera_stillImageOutput connectionWithMediaType:AVMediaTypeVideo] setVideoOrientation:[self getCurrentVideoOrientation]];
            
            [gmcamera_stillImageOutput captureStillImageAsynchronouslyFromConnection:[gmcamera_stillImageOutput connectionWithMediaType:AVMediaTypeVideo] completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
                if (error) {
                    NSLog(@"%@", error);
                    int dsMapIndex = CreateDsMap(2, "type", 0.0, "camera", "event", 0.0, "failed_to_take_picture");
                    CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
                }
                else {
                    NSData *imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
                    if (imageData != nil) {
                        NSString *filename = [self saveImage:nil orImageData:imageData];
                        int dsMapIndex = CreateDsMap(3, "type", 0.0, "camera", "event", 0.0, "took_picture", "filename", 0.0, [filename UTF8String]);
                        CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
                    }
                }
                gmcamera_takingPicture = NO;
            }];
        });
    }
}

- (int)camera_is_taking_picture {
    //NSLog(@"camera_is_taking_picture");
    if (gmcamera_takingPicture) {
        return 1;
    }
    return 0;
}

- (int)camera_can_record {
    //NSLog(@"camera_can_record");
    if ([self camera_is_enabled]) {
        AVCaptureConnection *connection = [gmcamera_movieFileOutput connectionWithMediaType:AVMediaTypeVideo];
        if ([connection isActive]) {
            return 1;
        }
    }
    return 0;
}

- (void)camera_start_recording {
    //NSLog(@"camera_start_recording");
    if ([self camera_is_enabled] && [self camera_can_record] && [self camera_is_recording] == 0) {
        dispatch_async(gmcamera_sessionQueue, ^{
            [[gmcamera_movieFileOutput connectionWithMediaType:AVMediaTypeVideo] setVideoOrientation:[self getCurrentVideoOrientation]];
            NSString *filename;
            NSString *filePath;
            BOOL ok = false;
            while (!ok) {
                filename = [NSString stringWithFormat:@"video%d.mov", gmcamera_savedVideosCount];
                gmcamera_savedVideosCount++;
                filePath = [self getFilePath:filename];
                if (![[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
                    ok = true;
                }
            }
            [gmcamera_movieFileOutput startRecordingToOutputFileURL:[NSURL fileURLWithPath:filePath] recordingDelegate:self];
        });
    }
}

- (void)camera_stop_recording {
    //NSLog(@"camera_stop_recording");
    if ([self camera_is_recording] == 1) {
        dispatch_async(gmcamera_sessionQueue, ^{
            [gmcamera_movieFileOutput stopRecording];
        });
    }
}

- (int)camera_is_recording {
    //NSLog(@"camera_is_recording");
    if (![self camera_is_enabled]) {
        return 0;
    }
    if ([gmcamera_movieFileOutput isRecording]) {
        return 1;
    }
    return 0;
}

- (void)camera_show_preview:(int)x :(int)y :(int)width :(int)height {
    //NSLog(@"camera_show_preview");
    gmcamera_previewView.frame = CGRectMake(x, y, width, height);
    gmcamera_previewView.hidden = NO;
}

- (void)camera_hide_preview {
    //NSLog(@"camera_hide_preview");
    gmcamera_previewView.hidden = YES;
}

- (int)camera_preview_is_visible {
    //NSLog(@"camera_preview_is_visible");
    if (gmcamera_previewView.hidden) {
        return 0;
    }
    return 1;
}

- (void)camera_preview_set_scaling_mode:(int)scalingMode {
    //NSLog(@"camera_preview_set_scaling_mode");
    NSString *gravity;
    switch (scalingMode) {
        case 0: gravity = AVLayerVideoGravityResizeAspect; break;
        case 1: gravity = AVLayerVideoGravityResizeAspectFill; break;
        case 2: gravity = AVLayerVideoGravityResize; break;
        default: gravity = AVLayerVideoGravityResizeAspect; break;
    }
    [gmcamera_previewView setVideoGravity:gravity];
}

- (void)camera_preview_set_alpha:(double)alpha {
    //NSLog(@"camera_preview_set_alpha");
    [gmcamera_previewView setAlpha:alpha];
}

- (int)camera_get_width {
    //NSLog(@"camera_get_width");
    return gmcamera_captureWidth;
}

- (int)camera_get_height {
    //NSLog(@"camera_get_height");
    return gmcamera_captureHeight;
}

- (void)camera_set_flash:(int)flash {
    //NSLog(@"camera_set_flash");
    gmcamera_flash = flash;
    if ([self camera_is_enabled]) {
        [self setFlashMode:(AVCaptureFlashMode)gmcamera_flash];
    }
}

- (int)camera_get_flash {
    //NSLog(@"camera_get_flash");
    if (![self camera_is_enabled]) {
        return gmcamera_flash;
    }
    return (int)gmcamera_videoDevice.flashMode;
}

- (int)camera_flash_is_available {
    //NSLog(@"camera_flash_is_available");
    if (![self camera_is_enabled]) {
        return 0;
    }
    if ([gmcamera_videoDevice hasFlash] && gmcamera_videoDevice.flashAvailable) {
        return 1;
    }
    return 0;
}

- (void)camera_launch_full_screen:(int)position {
    //NSLog(@"camera_launch_full_screen");
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
        if (granted) {
            dispatch_async(dispatch_get_main_queue(), ^{
                gmcamera_imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
                if (position == 2) {
                    gmcamera_imagePickerController.cameraDevice = UIImagePickerControllerCameraDeviceFront;
                }
                else {
                    gmcamera_imagePickerController.cameraDevice = UIImagePickerControllerCameraDeviceRear;
                }
                [gmcamera_rootViewController presentViewController:gmcamera_imagePickerController animated:YES completion:NULL];
            });
        }
        else {
            int dsMapIndex = CreateDsMap(3, "type", 0.0, "camera", "event", 0.0, "denied_access", "service", 0.0, "camera");
            CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
        }
    }];
}

- (void)camera_launch_library {
    //NSLog(@"camera_launch_library");
    gmcamera_imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [gmcamera_rootViewController presentViewController:gmcamera_imagePickerController animated:YES completion:NULL];
}

- (void)camera_save_picture_to_library:(NSString *)filename {
    //NSLog(@"camera_save_picture_to_library");
    [self saveFileToLibrary:filename isVideo:NO];
}

- (void)camera_save_video_to_library:(NSString *)filename {
    //NSLog(@"camera_save_video_to_library");
    [self saveFileToLibrary:filename isVideo:YES];
}

- (NSString *)camera_process_picture:(NSString *)filename :(int)format :(int)maxWidth :(int)maxHeight {
    //NSLog(@"camera_process_picture");
    UIImage *image = [UIImage imageWithContentsOfFile:[self getFilePath:filename]];
    if (image == nil) {
        return @"";
    }
    BOOL toPng = (format == 1 ? YES : NO);
    return [self saveImage:image orImageData:nil toPng:toPng withMaxWidth:maxWidth andMaxHeight:maxHeight];
}

- (void)camera_set_picture_format:(int)format {
    //NSLog(@"camera_set_picture_format");
    gmcamera_pictureFormatPng = NO;
    if (format == 1) {
        gmcamera_pictureFormatPng = YES;
    }
}

- (void)camera_set_picture_max_dimensions:(int)width :(int)height {
    //NSLog(@"camera_set_picture_max_dimensions");
    gmcamera_pictureMaxWidth = width;
    gmcamera_pictureMaxHeight = height;
}

- (void)camera_microphone_enable:(int)enableMicrophone {
    //NSLog(@"camera_microphone_enable");
    gmcamera_microphoneEnabled = (enableMicrophone ? YES : NO);
}

- (void)camera_idle_timer_enable:(int)enableIdleTimer {
    //NSLog(@"camera_idle_timer_enable");
    [UIApplication sharedApplication].idleTimerDisabled = (enableIdleTimer ? NO : YES);
}

- (void)enableCameraPosition:(int)position quality:(int)quality {
    dispatch_async(gmcamera_sessionQueue, ^{
        [gmcamera_session beginConfiguration];
        
        // set the capture device (position)
        NSArray *devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
        for (AVCaptureDevice *device in devices) {
            if ([device position] == (NSInteger)position) {
                gmcamera_videoDevice = device;
                break;
            }
        }
        if (gmcamera_videoDevice == nil) {
            gmcamera_videoDevice = [devices firstObject];
        }
        gmcamera_position = (int)[gmcamera_videoDevice position];
        
        // set the session preset (quality)
        NSString *preset;
        switch (quality) {
            case 0: preset = AVCaptureSessionPresetHigh; break;
            case 1: preset = AVCaptureSessionPresetMedium; break;
            case 2: preset = AVCaptureSessionPresetLow; break;
            case 3: preset = AVCaptureSessionPresetPhoto; break;
            default: preset = AVCaptureSessionPresetHigh; break;
        }
        if ([gmcamera_session canSetSessionPreset:preset]) {
            [gmcamera_session setSessionPreset:preset];
        }
        
        // remove the current video device input from the session, if any
        if (gmcamera_videoDeviceInput != nil) {
            [gmcamera_session removeInput:gmcamera_videoDeviceInput];
            [[NSNotificationCenter defaultCenter] removeObserver:self name:AVCaptureInputPortFormatDescriptionDidChangeNotification object:gmcamera_inputPort];
        }
        
        // get the capture device input for the video device and add it to the session
        NSError *error = nil;
        gmcamera_videoDeviceInput = [AVCaptureDeviceInput deviceInputWithDevice:gmcamera_videoDevice error:&error];
        if (error) {
            NSLog(@"%@", error);
        }
        if ([gmcamera_session canAddInput:gmcamera_videoDeviceInput]) {
            [gmcamera_session addInput:gmcamera_videoDeviceInput];
        }
        
        // set flash, stabilization, etc.
        [self setFlashMode:(AVCaptureFlashMode)gmcamera_flash];
        AVCaptureConnection *connection = [gmcamera_movieFileOutput connectionWithMediaType:AVMediaTypeVideo];
        if ([connection isVideoStabilizationSupported]) {
            if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")) {
                [connection setPreferredVideoStabilizationMode:AVCaptureVideoStabilizationModeAuto];
            }
            else {
                [connection setEnablesVideoStabilizationWhenAvailable:YES];
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self refreshPreviewOrientation];
        });
        
        // watch for input port format changes to refresh the camera width and height
        gmcamera_inputPort = [[gmcamera_videoDeviceInput ports] firstObject];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(inputPortFormatDescriptionDidChange:)
                                                     name:AVCaptureInputPortFormatDescriptionDidChangeNotification
                                                   object:gmcamera_inputPort];
        
        // if the microphone is enabled
        if (gmcamera_microphoneEnabled) {
            // set the audio session to "play and record"
            [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord
                                             withOptions:AVAudioSessionCategoryOptionDefaultToSpeaker
                                                   error:nil];
            // add an audio device input to the session if none is set up
            if (gmcamera_audioDeviceInput == nil) {
                NSError *error = nil;
                AVCaptureDevice *audioDevice = [[AVCaptureDevice devicesWithMediaType:AVMediaTypeAudio] firstObject];
                gmcamera_audioDeviceInput = [AVCaptureDeviceInput deviceInputWithDevice:audioDevice error:&error];
                if (error) {
                    NSLog(@"%@", error);
                }
                if ([gmcamera_session canAddInput:gmcamera_audioDeviceInput]) {
                    [gmcamera_session addInput:gmcamera_audioDeviceInput];
                }
            }
        }
        
        // if an audio device input has been set up and we're not using the microphone anymore, remove it
        if (gmcamera_audioDeviceInput != nil && !gmcamera_microphoneEnabled) {
            [gmcamera_session removeInput:gmcamera_audioDeviceInput];
        }
        
        [gmcamera_session commitConfiguration];
        
        if (!gmcamera_session.running) {
            [gmcamera_session startRunning];
        }
    });
}

- (void)setFlashMode:(AVCaptureFlashMode)flashMode {
    if ([gmcamera_videoDevice hasFlash] && gmcamera_videoDevice.flashAvailable && [gmcamera_videoDevice isFlashModeSupported:flashMode]) {
        NSError *error = nil;
        if ([gmcamera_videoDevice lockForConfiguration:&error]) {
            [gmcamera_videoDevice setFlashMode:flashMode];
            [gmcamera_videoDevice unlockForConfiguration];
        }
        else {
            NSLog(@"%@", error);
        }
    }
}

- (NSString *)saveImage:(UIImage *)image orImageData:(NSData *)imageData {
    return [self saveImage:image orImageData:imageData toPng:gmcamera_pictureFormatPng withMaxWidth:gmcamera_pictureMaxWidth andMaxHeight:gmcamera_pictureMaxHeight];
}

- (NSString *)saveImage:(UIImage *)image orImageData:(NSData *)imageData toPng:(BOOL)toPng withMaxWidth:(int)maxWidth andMaxHeight:(int)maxHeight {
    if (image == nil && imageData == nil) {
        return nil;
    }
    if (imageData == nil || toPng || maxWidth != -1 || maxHeight != -1) {
        if (image == nil) {
            image = [UIImage imageWithData:imageData];
        }
        if (maxWidth != -1 || maxHeight != -1) {
            image = [self processImage:image withMaxWidth:maxWidth andMaxHeight:maxHeight];
        }
        if (toPng) {
            imageData = UIImagePNGRepresentation(image);
        }
        else {
            imageData = UIImageJPEGRepresentation(image, 1.0);
        }
    }
    NSString *filename;
    NSString *filePath;
    BOOL ok = false;
    while (!ok) {
        if (toPng) {
            filename = [NSString stringWithFormat:@"picture%d.png", gmcamera_savedPicturesCount];
        }
        else {
            filename = [NSString stringWithFormat:@"picture%d.jpg", gmcamera_savedPicturesCount];
        }
        gmcamera_savedPicturesCount++;
        filePath = [self getFilePath:filename];
        if (![[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
            ok = true;
        }
    }
    [imageData writeToFile:filePath atomically:YES];
    return filename;
}

- (void)saveFileToLibrary:(NSString *)filename isVideo:(BOOL)isVideo {
    NSURL *fileURL = [NSURL fileURLWithPath:[self getFilePath:filename]];
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")) {
        // iOS 8+
        dispatch_async(gmcamera_sessionQueue, ^{
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                if (status == PHAuthorizationStatusAuthorized) {
                    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
                        if (isVideo) {
                            [PHAssetChangeRequest creationRequestForAssetFromVideoAtFileURL:fileURL];
                        }
                        else {
                            [PHAssetChangeRequest creationRequestForAssetFromImageAtFileURL:fileURL];
                        }
                    } completionHandler:^(BOOL success, NSError *error) {
                        if (success) {
                            int dsMapIndex = CreateDsMap(3, "type", 0.0, "camera", "event", 0.0, "saved", "filename", 0.0, [filename UTF8String]);
                            CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
                        }
                        else {
                            int dsMapIndex = CreateDsMap(3, "type", 0.0, "camera", "event", 0.0, "failed_to_save", "filename", 0.0, [filename UTF8String]);
                            CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
                        }
                    }];
                }
                else {
                    int dsMapIndex = CreateDsMap(3, "type", 0.0, "camera", "event", 0.0, "denied_access", "service", 0.0, "library");
                    CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
                }
            }];
        });
    }
    else {
        // iOS 7
        UIImage *image = nil;
        if (!isVideo) {
            image = [UIImage imageWithContentsOfFile:[self getFilePath:filename]];
            if (image == nil) {
                return;
            }
        }
        void (^myCompletionBlock)(NSURL *, NSError *) = ^void(NSURL *assetURL, NSError *error) {
            if (error == nil) {
                int dsMapIndex = CreateDsMap(3, "type", 0.0, "camera", "event", 0.0, "saved", "filename", 0.0, [filename UTF8String]);
                CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
            }
            else if (error.code == ALAssetsLibraryAccessUserDeniedError) {
                int dsMapIndex = CreateDsMap(3, "type", 0.0, "camera", "event", 0.0, "denied_access", "service", 0.0, "library");
                CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
            }
            else {
                int dsMapIndex = CreateDsMap(3, "type", 0.0, "camera", "event", 0.0, "failed_to_save", "filename", 0.0, [filename UTF8String]);
                CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
            }
        };
        if (isVideo) {
            [[[ALAssetsLibrary alloc] init] writeVideoAtPathToSavedPhotosAlbum:fileURL completionBlock:myCompletionBlock];
        }
        else {
            [[[ALAssetsLibrary alloc] init] writeImageToSavedPhotosAlbum:[image CGImage] orientation:(ALAssetOrientation)[image imageOrientation] completionBlock:myCompletionBlock];
        }
    }
}

- (UIImage *)processImage:(UIImage *)image withMaxWidth:(int)maxWidth andMaxHeight:(int)maxHeight {
    UIImage *finalImage = image;
    float width = image.size.width;
    float height = image.size.height;
    float ratio = width / height;
    if (maxWidth <= 0) {
        maxWidth = width;
    }
    if (maxHeight <= 0) {
        maxHeight = height;
    }
    float maxRatio = maxWidth / maxHeight;
    if (height > maxHeight || width > maxWidth) {
        if (ratio < maxRatio) {
            ratio = maxHeight / height;
            width = ratio * width;
            height = maxHeight;
        }
        else if (ratio > maxRatio) {
            ratio = maxWidth / width;
            width = maxWidth;
            height = ratio * height;
        }
        else {
            width = maxWidth;
            height = maxHeight;
        }
        CGRect rect = CGRectMake(0.0, 0.0, width, height);
        UIGraphicsBeginImageContextWithOptions(rect.size, YES, 1.0);
        [image drawInRect:rect];
        finalImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    return finalImage;
}

- (void)refreshPreviewOrientation {
    UIInterfaceOrientation interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    AVCaptureVideoOrientation videoOrientation = [[(AVCaptureVideoPreviewLayer *)[gmcamera_previewView layer] connection] videoOrientation];
    if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
        videoOrientation = AVCaptureVideoOrientationLandscapeLeft;
    }
    else if (interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        videoOrientation = AVCaptureVideoOrientationLandscapeRight;
    }
    else if (interfaceOrientation == UIInterfaceOrientationPortrait) {
        videoOrientation = AVCaptureVideoOrientationPortrait;
    }
    else if (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        videoOrientation = AVCaptureVideoOrientationPortraitUpsideDown;
    }
    [[(AVCaptureVideoPreviewLayer *)[gmcamera_previewView layer] connection] setVideoOrientation:videoOrientation];
}

- (AVCaptureVideoOrientation)getCurrentVideoOrientation {
    UIDeviceOrientation deviceOrientation = [[UIDevice currentDevice] orientation];
    AVCaptureVideoOrientation videoOrientation = [[(AVCaptureVideoPreviewLayer *)[gmcamera_previewView layer] connection] videoOrientation];
    if (deviceOrientation == UIDeviceOrientationLandscapeLeft) {
        videoOrientation = AVCaptureVideoOrientationLandscapeRight;
    }
    else if (deviceOrientation == UIDeviceOrientationLandscapeRight) {
        videoOrientation = AVCaptureVideoOrientationLandscapeLeft;
    }
    else if (deviceOrientation == UIDeviceOrientationPortrait) {
        videoOrientation = AVCaptureVideoOrientationPortrait;
    }
    else if (deviceOrientation == UIDeviceOrientationPortraitUpsideDown) {
        videoOrientation = AVCaptureVideoOrientationPortraitUpsideDown;
    }
    return videoOrientation;
}

- (NSString *)getFilePath:(NSString *)filename {
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return [docPath stringByAppendingPathComponent:filename];
}

- (void)captureOutput:(AVCaptureFileOutput *)captureOutput didFinishRecordingToOutputFileAtURL:(NSURL *)outputFileURL fromConnections:(NSArray *)connections error:(NSError *)error {
    //NSLog(@"captureOutput didFinishRecordingToOutputFileAtURL");
    if (error) {
        NSLog(@"%@", error);
    }
    if ([[NSFileManager defaultManager] fileExistsAtPath:[outputFileURL path]]) {
        int dsMapIndex = CreateDsMap(3, "type", 0.0, "camera", "event", 0.0, "finished_recording", "filename", 0.0, [[outputFileURL lastPathComponent] UTF8String]);
        CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
    }
    else {
        int dsMapIndex = CreateDsMap(2, "type", 0.0, "camera", "event", 0.0, "failed_to_finish_recording");
        CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
    }
}

- (void)captureSessionDidStart:(NSNotification *)notification {
    //NSLog(@"captureSessionDidStart");
    int dsMapIndex = CreateDsMap(2, "type", 0.0, "camera", "event", 0.0, "enabled");
    CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
}

- (void)captureSessionDidStop:(NSNotification *)notification {
    //NSLog(@"captureSessionDidStop");
    int dsMapIndex = CreateDsMap(2, "type", 0.0, "camera", "event", 0.0, "disabled");
    CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
}

- (void)orientationDidChange:(NSNotification *)notification {
    //NSLog(@"orientationDidChange");
    if ([self camera_is_enabled]) {
        [self refreshPreviewOrientation];
    }
}

- (void)inputPortFormatDescriptionDidChange:(NSNotification *)notification {
    //NSLog(@"inputPortFormatDescriptionDidChange");
    AVCaptureInputPort *port = [[gmcamera_videoDeviceInput ports] firstObject];
    CMFormatDescriptionRef formatDescription = port.formatDescription;
    if (formatDescription) {
        CMVideoDimensions dimensions = CMVideoFormatDescriptionGetDimensions(formatDescription);
        gmcamera_captureWidth = (int)dimensions.width;
        gmcamera_captureHeight = (int)dimensions.height;
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    if(image != nil) {
        NSString *filename = [self saveImage:image orImageData:nil];
        NSString *event = @"picked";
        if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
            event = @"took_picture";
        }
        int dsMapIndex = CreateDsMap(3, "type", 0.0, "camera", "event", 0.0, [event UTF8String], "filename", 0.0, [filename UTF8String]);
        CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
    }
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
    int dsMapIndex = CreateDsMap(2, "type", 0.0, "camera", "event", 0.0, "dismissed");
    CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
}

@end


@implementation AVPreviewView

+ (Class)layerClass {
    return [AVCaptureVideoPreviewLayer class];
}

- (AVCaptureSession *)session {
    return [(AVCaptureVideoPreviewLayer *)[self layer] session];
}

- (void)setSession:(AVCaptureSession *)session {
    [(AVCaptureVideoPreviewLayer *)[self layer] setSession:session];
}

- (NSString *)videoGravity {
    return [(AVCaptureVideoPreviewLayer *)[self layer] videoGravity];
}

- (void)setVideoGravity:(NSString *)gravity {
    [(AVCaptureVideoPreviewLayer *)[self layer] setVideoGravity:gravity];
}

@end
