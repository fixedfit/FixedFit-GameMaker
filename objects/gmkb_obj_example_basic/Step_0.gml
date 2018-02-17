if (gmkb_text_did_change()) {
    text = gmkb_get_text();
}
if (!gmkb_keyboard_is_visible()) {
    gmkb_show_keyboard();
}

