if (camera_preview_is_visible()) {
    camera_hide_preview();
}
else {
    camera_show_preview(gmcamera_obj_controller.preview_x, gmcamera_obj_controller.preview_y, gmcamera_obj_controller.preview_width, gmcamera_obj_controller.preview_height);
}

