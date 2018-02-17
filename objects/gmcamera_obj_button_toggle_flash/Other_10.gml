var new_flash = CAMERA_FLASH_ON;
if (camera_get_flash() == CAMERA_FLASH_ON) {
    new_flash = CAMERA_FLASH_OFF;
}
camera_set_flash(new_flash);

