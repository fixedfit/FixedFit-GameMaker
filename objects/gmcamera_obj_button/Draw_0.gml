if (!enabled) {
    draw_set_alpha(0.5);
}
if (enabled && pressed) {
    draw_set_color(color_background_pressed);
}
else {
    draw_set_color(color_background);
}
draw_roundrect_ext(x, y, x + width, y + height, border_radius, border_radius, false);
draw_set_font(font);
draw_set_color(color_title);
draw_set_halign(1);
draw_set_valign(1);
draw_text(x + width / 2, y + height / 2, string_hash_to_newline(title));
draw_set_halign(0);
draw_set_valign(0);
draw_set_alpha(1);

