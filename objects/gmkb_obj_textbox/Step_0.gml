image_xscale = width;
image_yscale = height;

if (active) {
    blink_step ++;
    if (blink_step > blink_delay * 2) {
        blink_step = 0;
    }
    if (gmkb_key_was_pressed()) {
        var new_value = gmkb_get_text();
        draw_set_font(font);
        if (string_width(string_hash_to_newline(gmkb_example_textbox_value_to_screen(new_value))) <= max_text_width) {
            value = new_value;
        }
        else {
            gmkb_set_text(value);
        }
    }
    if (gmkb_return_key_was_pressed() && !rk_new_line) {
        gmkb_hide_keyboard();
    }
    if (gmkb_keyboard_did_hide()) {
        active = false;
        global.active_textbox = -1;
    }
}

