var type = async_load[? "type"];
if (type == "camera") {
    var event = async_load[? "event"];
    if (event == "denied_access") {
        var service = async_load[? "service"];
        var service_setting = "";
        if (service == "camera") {
            service_setting = "Camera";
        }
        else if (service == "microphone") {
            service_setting = "Microphone";
        }
        else if (service == "library") {
            service_setting = "Photos";
        }
        show_message("This app needs access to your " + service + ". Please go to Settings > Privacy > " + service_setting + " and turn it on.");
    }
    if (event == "enabled") {
        // start fading the preview
        preview_alpha = 0;
        camera_preview_set_alpha(preview_alpha);
        camera_show_preview(preview_x, preview_y, preview_width, preview_height);
        alarm[0] = 1;
    }
    if (event == "disabled") {
        camera_hide_preview();
    }
    if (event == "took_picture") {
        audio_play_sound(gmcamera_snd_shutter, 0, false);
        var filename = async_load[? "filename"];
        camera_save_picture_to_library(filename);
    }
    if (event == "failed_to_take_picture") {
        show_message("Failed to take a picture.");
    }
    if (event == "finished_recording") {
        var filename = async_load[? "filename"];
        camera_save_video_to_library(filename);
    }
    if (event == "failed_to_finish_recording") {
        show_message("Failed to finish recording.");
    }
    if (event == "saved") {
        var filename = async_load[? "filename"];
        show_message(filename + " was successfully added to your library.");
    }
    if (event == "failed_to_save") {
        var filename = async_load[? "filename"];
        show_message("Sorry, there was an error adding " + filename + " to the library.");
    }
    if (event == "picked") {
        var filename = async_load[? "filename"];
        var processed_filename = camera_process_picture(filename, CAMERA_FORMAT_PNG, 200, 200);
        last_picked_sprite = sprite_add(processed_filename, 0, false, false, 0, 0);
    }
    if (event == "dismissed") {
        // full screen camera or library was dismissed
    }
}

