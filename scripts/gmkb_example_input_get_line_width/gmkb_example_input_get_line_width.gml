/// @description  gmkb_example_input_get_line_width(line, from_start_to_pos)
/// @function  gmkb_example_input_get_line_width
/// @param line
/// @param  from_start_to_pos

var total_width = 0;
for (var n = 0; n < argument1; n ++) {
    total_width += char_width[argument0, n];
}
return total_width;
