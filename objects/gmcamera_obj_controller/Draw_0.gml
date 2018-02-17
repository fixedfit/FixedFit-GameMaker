// fill the background with the picked image (if any)
if (last_picked_sprite != -1) {
    var width = sprite_get_width(last_picked_sprite);
    var height = sprite_get_height(last_picked_sprite);
    var scale = max((room_width + 5) / width, (room_height + 5) / height);
    var draw_width = width * scale;
    var draw_height = height * scale;
    var draw_x = round(0 - (draw_width - room_width) / 2);
    var draw_y = round(0 - (draw_height - room_height) / 2);
    draw_sprite_ext(last_picked_sprite, 0, draw_x, draw_y, scale, scale, 0, c_white, 1);
}

// draw the camera status
draw_set_font(gmcamera_font_default);
draw_set_color(c_black);
var status = "disabled";
if (camera_is_enabled()) {
    status = "idle"
    if (camera_is_recording()) {
        status = "recording";
    }
    status += " (" + string(camera_get_width()) + " x " + string(camera_get_height()) + ")";
}
draw_text(32, 12, string_hash_to_newline("Camera status: " + status));

// draw the preview background
if (camera_is_enabled() && camera_preview_is_visible()) {
    draw_set_alpha(preview_alpha * 0.8);
    draw_set_color(c_black)
    draw_rectangle(0, round(room_height - (room_height * preview_view_height_ratio)), room_width, room_height, false);
    draw_set_alpha(1);
}

