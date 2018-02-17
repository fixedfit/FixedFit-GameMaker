application_surface_enable(false);

preview_width = 0;
preview_height = 0;
preview_view_height_ratio = 2 / 5;
if (os_device == device_ios_ipad || os_device == device_ios_ipad_retina) {
    preview_view_height_ratio = 2 / 3;
}
preview_x = 0;
preview_y = 0;
preview_alpha = 0;
last_preview_x = 0;
last_preview_y = 0;
last_preview_width = 0;
last_preview_height = 0;
last_picked_sprite = -1;

camera_set_flash(CAMERA_FLASH_ON);
camera_preview_set_scaling_mode(CAMERA_SCALING_MODE_FIT);

