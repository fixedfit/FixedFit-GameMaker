// refresh the preview dimensions and position
preview_width = display_get_width() / 2;
preview_height = round(display_get_height() / 2 * preview_view_height_ratio);
preview_x = 0;
preview_y = display_get_height() / 2 - preview_height;
if (camera_is_enabled() && camera_preview_is_visible() && 
     (last_preview_x != preview_x || last_preview_y != preview_y ||
     last_preview_width != preview_width || last_preview_height != preview_height)) {
    camera_show_preview(preview_x, preview_y, preview_width, preview_height);
}
last_preview_x = preview_x;
last_preview_y = preview_y;
last_preview_width = preview_width;
last_preview_height = preview_height;

