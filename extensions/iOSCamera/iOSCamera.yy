{
    "id": "1dfafbfb-bfa5-41ff-876c-1c73d4c51da3",
    "modelName": "GMExtension",
    "mvc": "1.0",
    "name": "iOSCamera",
    "IncludedResources": [
        "Sprites\\Camera_Example\\gmcamera_spr_pixel",
        "Sounds\\Camera_Example\\gmcamera_snd_shutter",
        "Sounds\\Camera_Example\\gmcamera_snd_record",
        "Fonts\\Camera_Example\\gmcamera_font_default",
        "Objects\\Camera_Example\\gmcamera_obj_controller",
        "Objects\\Camera_Example\\gmcamera_obj_button",
        "Objects\\Camera_Example\\gmcamera_obj_button_toggle_camera",
        "Objects\\Camera_Example\\gmcamera_obj_button_take_picture",
        "Objects\\Camera_Example\\gmcamera_obj_button_toggle_recording",
        "Objects\\Camera_Example\\gmcamera_obj_button_toggle_preview",
        "Objects\\Camera_Example\\gmcamera_obj_button_switch_camera",
        "Objects\\Camera_Example\\gmcamera_obj_button_toggle_photo",
        "Objects\\Camera_Example\\gmcamera_obj_button_toggle_flash",
        "Objects\\Camera_Example\\gmcamera_obj_button_launch_full_screen",
        "Objects\\Camera_Example\\gmcamera_obj_button_launch_library",
        "Rooms\\Camera_Example\\gmcamera_room_example_phone",
        "Rooms\\Camera_Example\\gmcamera_room_example_tablet"
    ],
    "androidPermissions": [
        
    ],
    "androidProps": true,
    "androidactivityinject": "",
    "androidclassname": "GMCamera",
    "androidinject": "",
    "androidmanifestinject": "",
    "androidsourcedir": "",
    "author": "",
    "classname": "GMCamera",
    "copyToTargets": 644907118,
    "date": "2018-58-15 07:02:56",
    "description": "",
    "extensionName": "",
    "files": [
        {
            "id": "4bc50e2b-b72a-4d55-9fc8-67bb677e2d9e",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                {
                    "id": "1b38e211-ff91-40c9-b8fe-446c36c42c19",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "CAMERA_POSITION_BACK",
                    "hidden": false,
                    "value": "1"
                },
                {
                    "id": "b9b0f75c-cd26-4b44-8121-18911ea4f0e4",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "CAMERA_POSITION_FRONT",
                    "hidden": false,
                    "value": "2"
                },
                {
                    "id": "a9da32c1-d211-4747-9ea9-d3fee80a6e10",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "CAMERA_POSITION_UNSPECIFIED",
                    "hidden": false,
                    "value": "0"
                },
                {
                    "id": "60790ee7-6600-4bb1-9e17-13899ae17ae7",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "CAMERA_QUALITY_HIGH",
                    "hidden": false,
                    "value": "0"
                },
                {
                    "id": "25ac49ff-6694-48e0-b3a8-a3f4322a5486",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "CAMERA_QUALITY_MEDIUM",
                    "hidden": false,
                    "value": "1"
                },
                {
                    "id": "79369df1-a8ac-4369-a1d8-a57142735b17",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "CAMERA_QUALITY_LOW",
                    "hidden": false,
                    "value": "2"
                },
                {
                    "id": "828c139a-f4ac-403d-9e16-0d06b7377e52",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "CAMERA_QUALITY_PHOTO",
                    "hidden": false,
                    "value": "3"
                },
                {
                    "id": "4a1f4720-0561-41f0-adfd-b41bbf9a2fcc",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "CAMERA_QUALITY_OTHER",
                    "hidden": false,
                    "value": "4"
                },
                {
                    "id": "e34fd188-ad44-44a9-b750-d6a8cbca4f85",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "CAMERA_FLASH_OFF",
                    "hidden": false,
                    "value": "0"
                },
                {
                    "id": "37d52fb7-796b-43c3-a719-7aa342885585",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "CAMERA_FLASH_ON",
                    "hidden": false,
                    "value": "1"
                },
                {
                    "id": "38d300ad-7c6e-441d-b1af-c1024517a455",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "CAMERA_FLASH_AUTO",
                    "hidden": false,
                    "value": "2"
                },
                {
                    "id": "d2f86c39-4048-4177-a291-dc1f0598b879",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "CAMERA_SCALING_MODE_FIT",
                    "hidden": false,
                    "value": "0"
                },
                {
                    "id": "149dc5c4-0f6a-4dd7-951a-4e6c074fc50f",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "CAMERA_SCALING_MODE_FILL",
                    "hidden": false,
                    "value": "1"
                },
                {
                    "id": "f380d899-81f7-414e-a167-3eec48b96a41",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "CAMERA_SCALING_MODE_STRETCH",
                    "hidden": false,
                    "value": "2"
                },
                {
                    "id": "98aa9408-0030-4da9-8a11-0f33a8744197",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "CAMERA_FORMAT_JPEG",
                    "hidden": false,
                    "value": "0"
                },
                {
                    "id": "087ed697-c780-4506-8ae0-390d1242e48d",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "CAMERA_FORMAT_PNG",
                    "hidden": false,
                    "value": "1"
                }
            ],
            "copyToTargets": 33554436,
            "filename": "iOSCamera.ext",
            "final": "",
            "functions": [
                {
                    "id": "8afc75b1-50d0-4fb2-8c2f-f69b73aa3cf4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "camera_init",
                    "help": "camera_init()",
                    "hidden": false,
                    "kind": 11,
                    "name": "camera_init",
                    "returnType": 2
                },
                {
                    "id": "152797ee-01bb-4f8c-9c04-e8aeeb86c8eb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "camera_enable",
                    "help": "camera_enable(position, quality)",
                    "hidden": false,
                    "kind": 11,
                    "name": "camera_enable",
                    "returnType": 2
                },
                {
                    "id": "71b7a963-e49a-4aab-874a-464e4d0e3cda",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "camera_disable",
                    "help": "camera_disable()",
                    "hidden": false,
                    "kind": 11,
                    "name": "camera_disable",
                    "returnType": 2
                },
                {
                    "id": "0a012bd7-7f96-418b-990e-416c05288cd0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "camera_is_enabled",
                    "help": "camera_is_enabled()",
                    "hidden": false,
                    "kind": 11,
                    "name": "camera_is_enabled",
                    "returnType": 2
                },
                {
                    "id": "d6c2f4ad-f6c5-4283-97e4-c945d40381ac",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "camera_exists",
                    "help": "camera_exists(position)",
                    "hidden": false,
                    "kind": 11,
                    "name": "camera_exists",
                    "returnType": 2
                },
                {
                    "id": "051275db-744b-4b58-b9b1-127a09223a08",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "camera_get_position",
                    "help": "camera_get_position()",
                    "hidden": false,
                    "kind": 11,
                    "name": "camera_get_position",
                    "returnType": 2
                },
                {
                    "id": "e3fef785-1098-448e-b64e-6b95e312dd42",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "camera_get_quality",
                    "help": "camera_get_quality()",
                    "hidden": false,
                    "kind": 11,
                    "name": "camera_get_quality",
                    "returnType": 2
                },
                {
                    "id": "b2cd1f2c-8feb-4f70-9bda-cec37fb6a5cd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "camera_take_picture",
                    "help": "camera_take_picture()",
                    "hidden": false,
                    "kind": 11,
                    "name": "camera_take_picture",
                    "returnType": 2
                },
                {
                    "id": "888207d3-e7d2-4f62-942d-9e8ef7dfb82a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "camera_is_taking_picture",
                    "help": "camera_is_taking_picture()",
                    "hidden": false,
                    "kind": 11,
                    "name": "camera_is_taking_picture",
                    "returnType": 2
                },
                {
                    "id": "54495698-1572-4ac1-a6a9-5f13d2b31380",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "camera_can_record",
                    "help": "camera_can_record()",
                    "hidden": false,
                    "kind": 11,
                    "name": "camera_can_record",
                    "returnType": 2
                },
                {
                    "id": "f9224d48-af13-4df0-bbe6-109456791d22",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "camera_start_recording",
                    "help": "camera_start_recording()",
                    "hidden": false,
                    "kind": 11,
                    "name": "camera_start_recording",
                    "returnType": 2
                },
                {
                    "id": "8b7ba103-8461-489f-840a-fa930064647c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "camera_stop_recording",
                    "help": "camera_stop_recording()",
                    "hidden": false,
                    "kind": 11,
                    "name": "camera_stop_recording",
                    "returnType": 2
                },
                {
                    "id": "0e9d4a7c-7c88-4d8e-9198-0ab53b63a1c6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "camera_is_recording",
                    "help": "camera_is_recording()",
                    "hidden": false,
                    "kind": 11,
                    "name": "camera_is_recording",
                    "returnType": 2
                },
                {
                    "id": "9a071a01-4969-4650-96d5-923473e7df23",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 4,
                    "args": [
                        2,
                        2,
                        2,
                        2
                    ],
                    "externalName": "camera_show_preview",
                    "help": "camera_show_preview(x, y, width, height)",
                    "hidden": false,
                    "kind": 11,
                    "name": "camera_show_preview",
                    "returnType": 2
                },
                {
                    "id": "29d2bcb6-8601-4e60-8efa-52d39c05bce1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "camera_hide_preview",
                    "help": "camera_hide_preview()",
                    "hidden": false,
                    "kind": 11,
                    "name": "camera_hide_preview",
                    "returnType": 2
                },
                {
                    "id": "2b665bd1-7c41-4973-bcd3-39d738b2b2ed",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "camera_preview_is_visible",
                    "help": "camera_preview_is_visible()",
                    "hidden": false,
                    "kind": 11,
                    "name": "camera_preview_is_visible",
                    "returnType": 2
                },
                {
                    "id": "07a42c7e-7ab2-4126-b34c-d81b3a027941",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "camera_preview_set_scaling_mode",
                    "help": "camera_preview_set_scaling_mode(scaling_mode)",
                    "hidden": false,
                    "kind": 11,
                    "name": "camera_preview_set_scaling_mode",
                    "returnType": 2
                },
                {
                    "id": "45f8be8c-94ba-41c7-8836-4493840d7f63",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "camera_preview_set_alpha",
                    "help": "camera_preview_set_alpha(alpha)",
                    "hidden": false,
                    "kind": 11,
                    "name": "camera_preview_set_alpha",
                    "returnType": 2
                },
                {
                    "id": "d801ebbc-5d4f-460b-bf7e-7f7d5c598c42",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "camera_get_width",
                    "help": "camera_get_width()",
                    "hidden": false,
                    "kind": 11,
                    "name": "camera_get_width",
                    "returnType": 2
                },
                {
                    "id": "69132ec7-9b45-4322-b165-261138621cb3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "camera_get_height",
                    "help": "camera_get_height()",
                    "hidden": false,
                    "kind": 11,
                    "name": "camera_get_height",
                    "returnType": 2
                },
                {
                    "id": "b7662a76-b7ef-4b8e-ae3b-6ca8b2afb38b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "camera_set_flash",
                    "help": "camera_set_flash(flash)",
                    "hidden": false,
                    "kind": 11,
                    "name": "camera_set_flash",
                    "returnType": 2
                },
                {
                    "id": "ea5eba75-31f3-485b-b47e-bac3b7f87659",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "camera_get_flash",
                    "help": "camera_get_flash()",
                    "hidden": false,
                    "kind": 11,
                    "name": "camera_get_flash",
                    "returnType": 2
                },
                {
                    "id": "fa0f8006-4804-44a9-b168-d7ee01604cd9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "camera_flash_is_available",
                    "help": "camera_flash_is_available()",
                    "hidden": false,
                    "kind": 11,
                    "name": "camera_flash_is_available",
                    "returnType": 2
                },
                {
                    "id": "f144b785-bc29-4308-abcd-01c1c800608b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "camera_launch_full_screen",
                    "help": "camera_launch_full_screen(position)",
                    "hidden": false,
                    "kind": 11,
                    "name": "camera_launch_full_screen",
                    "returnType": 2
                },
                {
                    "id": "74724678-670e-41d4-9c8f-ac216b9aea59",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "camera_launch_library",
                    "help": "camera_launch_library()",
                    "hidden": false,
                    "kind": 11,
                    "name": "camera_launch_library",
                    "returnType": 2
                },
                {
                    "id": "230492b4-4e25-4bbf-8d7f-1e856694bf16",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "camera_save_picture_to_library",
                    "help": "camera_save_picture_to_library(filename)",
                    "hidden": false,
                    "kind": 11,
                    "name": "camera_save_picture_to_library",
                    "returnType": 2
                },
                {
                    "id": "0b02ed68-220c-4f2e-84eb-021116717cda",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "camera_save_video_to_library",
                    "help": "camera_save_video_to_library(filename)",
                    "hidden": false,
                    "kind": 11,
                    "name": "camera_save_video_to_library",
                    "returnType": 2
                },
                {
                    "id": "2e036e5b-7b75-48b5-a1a2-6f643b862d88",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 4,
                    "args": [
                        1,
                        2,
                        2,
                        2
                    ],
                    "externalName": "camera_process_picture",
                    "help": "camera_process_picture(filename, format, max_width, max_height)",
                    "hidden": false,
                    "kind": 11,
                    "name": "camera_process_picture",
                    "returnType": 1
                },
                {
                    "id": "3f62044d-e2c5-4fcb-a387-193773fa6900",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "camera_set_picture_format",
                    "help": "camera_set_picture_format(format)",
                    "hidden": false,
                    "kind": 11,
                    "name": "camera_set_picture_format",
                    "returnType": 2
                },
                {
                    "id": "3a00f107-d458-4769-a365-ff5819837562",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "camera_set_picture_max_dimensions",
                    "help": "camera_set_picture_max_dimensions(width, height)",
                    "hidden": false,
                    "kind": 11,
                    "name": "camera_set_picture_max_dimensions",
                    "returnType": 2
                },
                {
                    "id": "fb50ffb7-b430-411a-b949-57a1bc0a09e2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "camera_microphone_enable",
                    "help": "camera_microphone_enable(enable)",
                    "hidden": false,
                    "kind": 11,
                    "name": "camera_microphone_enable",
                    "returnType": 2
                },
                {
                    "id": "89fae148-8211-4e89-b74b-0d6dd9d5086f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "camera_idle_timer_enable",
                    "help": "camera_idle_timer_enable(enable)",
                    "hidden": false,
                    "kind": 11,
                    "name": "camera_idle_timer_enable",
                    "returnType": 2
                }
            ],
            "init": "camera_init",
            "kind": 4,
            "order": [
                
            ],
            "origname": "extensions\\Camera.ext",
            "uncompress": false
        },
        {
            "id": "5c575a20-7f6c-4446-b5fe-fe9f1f4c512e",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 0,
            "filename": "gmcamera_doc.html",
            "final": "",
            "functions": [
                
            ],
            "init": "",
            "kind": 4,
            "order": [
                
            ],
            "origname": "extensions\\gmcamera_doc.html",
            "uncompress": false
        }
    ],
    "gradleinject": "",
    "helpfile": "",
    "installdir": "",
    "iosProps": true,
    "iosSystemFrameworkEntries": [
        {
            "id": "6f744a69-d1bd-44ad-b556-5b23c7575401",
            "modelName": "GMExtensionFrameworkEntry",
            "mvc": "1.0",
            "frameworkName": "AVFoundation.framework",
            "weakReference": false
        },
        {
            "id": "09d1510f-3701-4840-b106-a772a85c012a",
            "modelName": "GMExtensionFrameworkEntry",
            "mvc": "1.0",
            "frameworkName": "AssetsLibrary.framework",
            "weakReference": false
        },
        {
            "id": "c7e2405a-8882-40ec-a70f-7f23638a7bd4",
            "modelName": "GMExtensionFrameworkEntry",
            "mvc": "1.0",
            "frameworkName": "Photos.framework",
            "weakReference": true
        },
        {
            "id": "8ef3e3ef-9010-4324-a3c4-02e7ca4d49b2",
            "modelName": "GMExtensionFrameworkEntry",
            "mvc": "1.0",
            "frameworkName": "UIKit.framework",
            "weakReference": false
        }
    ],
    "iosThirdPartyFrameworkEntries": [
        
    ],
    "iosplistinject": "<key>NSCameraUsageDescription<\/key>\\u000d\\u000a<string>The camera is used to allow the user to take pictures and record videos which can then be modified using the app.<\/string>\\u000d\\u000a<key>NSMicrophoneUsageDescription<\/key><string>The microphone is used to record audio during video recording.<\/string>\\u000d\\u000a<key>NSPhotoLibraryUsageDescription<\/key>\\u000d\\u000a<string>The photo library is used to save pictures and videos recorded by the user.<\/string>",
    "license": "Free to use, also for commercial games.",
    "maccompilerflags": "",
    "maclinkerflags": "",
    "macsourcedir": "",
    "packageID": "com.benetonsoftware.gmcamera",
    "productID": "",
    "sourcedir": "",
    "version": "0.9.0"
}