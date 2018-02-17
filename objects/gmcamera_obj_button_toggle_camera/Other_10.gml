if (camera_is_enabled()) {
    camera_disable();
}
else {
    camera_enable(CAMERA_POSITION_BACK, CAMERA_QUALITY_PHOTO);
}

