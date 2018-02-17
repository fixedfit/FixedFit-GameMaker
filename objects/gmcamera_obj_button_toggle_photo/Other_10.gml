var new_quality = CAMERA_QUALITY_HIGH;
if (camera_can_record()) {
    new_quality = CAMERA_QUALITY_PHOTO;
}
camera_enable(camera_get_position(), new_quality);

