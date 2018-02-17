draw_set_halign(fa_left);
// draw the background and the border
draw_set_color(bg_color);
if (active) {
    draw_set_color(bg_color_active);
}
draw_roundrect_ext(x, y, x + width, y + height, border_radius, border_radius, false);
draw_set_color(border_color);
if (active) {
    draw_set_color(border_color_active);
}
draw_roundrect_ext(x, y, x + width, y + height, border_radius, border_radius, true);

// draw the text or the placeholder
draw_set_font(font);
draw_set_valign(1);
var text = "";
if (!active && value == "") {
    draw_set_color(placeholder_color);
    text = placeholder;
}
else {
    draw_set_color(text_color);
    text = gmkb_example_textbox_value_to_screen(value);
    if (active && blink_step < blink_delay) {
        text += "|";
    }
}
draw_text(x + padding_h, y + height / 2 - 1, string_hash_to_newline(text));
draw_set_valign(0);

