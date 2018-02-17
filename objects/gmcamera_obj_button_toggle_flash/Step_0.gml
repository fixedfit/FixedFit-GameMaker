event_inherited();

if (camera_flash_is_available()) {
    enabled = true;
}
else {
    enabled = false;
}

if (camera_get_flash() == CAMERA_FLASH_ON) {
    title = "Flash: ON";
}
else {
    title = "Flash: OFF";
}

