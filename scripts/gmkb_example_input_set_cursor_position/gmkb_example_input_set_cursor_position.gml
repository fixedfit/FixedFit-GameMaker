/// @description  gmkb_example_input_set_cursor_position(pos)
/// @function  gmkb_example_input_set_cursor_position
/// @param pos

if (cursor_position != argument0) {
    cursor_position = argument0;
    cursor_blink_step = 0;
    text_before_cursor = "";
    text_after_cursor = value;
    if (cursor_position > 0) {
        text_before_cursor = gmkb_string_copy(value, 0, cursor_position);
        text_after_cursor = gmkb_string_copy(value, cursor_position, gmkb_string_get_length(value) - cursor_position);
    }
    gmkb_set_text(text_before_cursor);
    gmkb_example_input_refresh_cursor();
}
