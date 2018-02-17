/// @description  gmkb_example_input_refresh_cursor()
/// @function  gmkb_example_input_refresh_cursor

var chars_count = 0;
for (var n = 0; n < number_of_lines; n++) {
    chars_count += chars_per_line[n];
    if (cursor_position <= chars_count) {
        cursor_on_line = n;
        cursor_line_position = cursor_position;
        if (n > 0) {
            cursor_line_position -= chars_at_beginning_of_line[n];
        }
        break;
    }
}
