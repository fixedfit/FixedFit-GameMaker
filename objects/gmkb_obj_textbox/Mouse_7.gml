if (!active) {
    with (gmkb_obj_textbox) {
        active = false;
    }
    active = true;
    global.active_textbox = id;
    blink_step = 0;
    gmkb_set_text(value);
    gmkb_show_keyboard_ext(type, rk_type, appearance, capitalize, rk_disabled_until_input, rk_new_line, predictive);
}

