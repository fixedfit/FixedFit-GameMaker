//
//  GMCamera.h
//  GMCamera
//
//  Created by Benoît Rouleau on 2015-02-22.
//
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface GMCamera : NSObject <AVCaptureFileOutputRecordingDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

- (void)camera_init;
- (void)camera_enable:(int)position :(int)quality;
- (void)camera_disable;
- (int)camera_is_enabled;
- (int)camera_exists:(int)position;
- (int)camera_get_position;
- (int)camera_get_quality;
- (void)camera_take_picture;
- (int)camera_is_taking_picture;
- (int)camera_can_record;
- (void)camera_start_recording;
- (void)camera_stop_recording;
- (int)camera_is_recording;
- (void)camera_show_preview:(int)x :(int)y :(int)width :(int)height;
- (void)camera_hide_preview;
- (int)camera_preview_is_visible;
- (void)camera_preview_set_scaling_mode:(int)scalingMode;
- (void)camera_preview_set_alpha:(double)alpha;
- (int)camera_get_width;
- (int)camera_get_height;
- (void)camera_set_flash:(int)flash;
- (int)camera_get_flash;
- (int)camera_flash_is_available;
- (void)camera_launch_full_screen:(int)position;
- (void)camera_launch_library;
- (void)camera_save_picture_to_library:(NSString *)filename;
- (void)camera_save_video_to_library:(NSString *)filename;
- (NSString *)camera_process_picture:(NSString *)filename :(int)format :(int)maxWidth :(int)maxHeight;
- (void)camera_set_picture_format:(int)format;
- (void)camera_set_picture_max_dimensions:(int)width :(int)height;
- (void)camera_microphone_enable:(int)enableMicrophone;
- (void)camera_idle_timer_enable:(int)enableIdleTimer;

- (void)enableCameraPosition:(int)position quality:(int)quality;
- (void)setFlashMode:(AVCaptureFlashMode)flashMode;
- (NSString *)saveImage:(UIImage *)image orImageData:(NSData *)imageData;
- (NSString *)saveImage:(UIImage *)image orImageData:(NSData *)imageData toPng:(BOOL)toPng withMaxWidth:(int)maxWidth andMaxHeight:(int)maxHeight;
- (void)saveFileToLibrary:(NSString *)filename isVideo:(BOOL)isVideo;
- (UIImage *)processImage:(UIImage *)image withMaxWidth:(int)maxWidth andMaxHeight:(int)maxHeight;
- (void)refreshPreviewOrientation;
- (AVCaptureVideoOrientation)getCurrentVideoOrientation;
- (NSString *)getFilePath:(NSString *)filename;

@end


@interface AVPreviewView : UIView

- (AVCaptureSession *)session;
- (void)setSession:(AVCaptureSession *)session;
- (NSString *)videoGravity;
- (void)setVideoGravity:(NSString *)gravity;

@property (nonatomic, assign) AVCaptureSession *session;

@end