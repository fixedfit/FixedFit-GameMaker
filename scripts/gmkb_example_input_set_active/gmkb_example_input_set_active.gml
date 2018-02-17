/// @description  gmkb_example_input_set_active(set_active)
/// @function  gmkb_example_input_set_active
/// @param set_active

var set_active = argument[0];

if (set_active) {
    with (gmkb_obj_input) {
        gmkb_example_input_set_active(false);
    }
    active = true;
    global.active_input = id;
    cursor_position = -1;
    gmkb_example_input_set_cursor_position(gmkb_string_get_length(value));
    gmkb_show_keyboard_ext(type, rk_type, appearance, capitalize, rk_disabled_until_input, rk_new_line, predictive);
}
else {
    active = false;
    global.active_input = -1;
    cursor_position = 0;
}
gmkb_example_input_refresh_text();
