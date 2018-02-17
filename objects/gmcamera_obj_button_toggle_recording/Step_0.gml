event_inherited();

if (camera_is_enabled() && camera_can_record()) {
    enabled = true;
}
else {
    enabled = false;
}

if (camera_is_recording()) {
    title = "Stop recording";
}
else {
    title = "Start recording";
}

