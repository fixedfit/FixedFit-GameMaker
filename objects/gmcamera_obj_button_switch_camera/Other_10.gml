var new_position = CAMERA_POSITION_FRONT;
if (camera_get_position() == CAMERA_POSITION_FRONT) {
    new_position = CAMERA_POSITION_BACK;
}
camera_enable(new_position, camera_get_quality());

