event_inherited();

if (camera_is_enabled()) {
    enabled = true;
}
else {
    enabled = false;
}

if (camera_can_record()) {
    title = "Switch to photo camera";
}
else {
    title = "Switch to video camera";
}

