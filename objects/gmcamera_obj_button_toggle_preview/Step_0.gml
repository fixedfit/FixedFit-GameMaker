event_inherited();

if (camera_is_enabled()) {
    enabled = true;
}
else {
    enabled = false;
}

if (camera_preview_is_visible()) {
    title = "Hide preview";
}
else {
    title = "Show preview";
}

