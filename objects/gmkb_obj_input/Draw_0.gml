// draw the background
draw_set_color(bg_color);
if (active) {
    draw_set_color(bg_color_active);
}
draw_roundrect_ext(x, y, x + width, y + height, border_radius, border_radius, false);

// draw the text
if (surface_exists(surface)) {
    draw_surface(surface, x, y);
}

// draw the border
draw_set_color(border_color);
if (active) {
    draw_set_color(border_color_active);
}
draw_roundrect_ext(x, y, x + width, y + height, border_radius, border_radius, true);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

