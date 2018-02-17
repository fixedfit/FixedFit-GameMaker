event_inherited();

if (camera_is_enabled()) {
    enabled = true;
}
else {
    enabled = false;
}

if (camera_get_position() == CAMERA_POSITION_BACK) {
    title = "Switch to front camera";
}
else {
    title = "Switch to back camera";
}

