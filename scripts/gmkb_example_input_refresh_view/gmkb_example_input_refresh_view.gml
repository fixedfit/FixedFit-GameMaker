/// @description  gmkb_example_input_refresh_view(just_validate)
/// @function  gmkb_example_input_refresh_view
/// @param just_validate
// just_validate: do not calculate start_at_line using the cursor position, just validate
//  the current start_at_line value

var just_validate = argument[0];

start_at_line_min = 0;
start_at_line_max = number_of_lines - number_of_visible_lines;
if (!just_validate) {
    if (active) {
        if (cursor_on_line < start_at_line) {
            start_at_line = cursor_on_line;
        }
        else if (cursor_on_line > start_at_line + number_of_visible_lines - 1) {
            start_at_line = cursor_on_line - number_of_visible_lines + 1;
        }
    }
    else {
        start_at_line = 0;
    }
}
start_at_line = max(min(start_at_line, start_at_line_max), start_at_line_min);
