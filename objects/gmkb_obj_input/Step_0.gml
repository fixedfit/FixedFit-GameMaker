image_xscale = width;
image_yscale = height;

if (active) {
    cursor_blink_step ++;
    if (cursor_blink_step > cursor_blink_delay * 2) {
        cursor_blink_step = 0;
    }
    if (gmkb_key_was_pressed()) {
        cursor_blink_step = 0;
        var previous_value = value;
        var previous_text_before_cursor = text_before_cursor;
        text_before_cursor = gmkb_get_text();
        value = text_before_cursor + text_after_cursor;
        gmkb_example_input_refresh_text();
        if ((max_length == -1 || gmkb_string_get_length(value) <= max_length) && (multiline || number_of_lines <= 1)) {
            cursor_position = gmkb_string_get_length(text_before_cursor);
            gmkb_example_input_refresh_cursor();
            gmkb_example_input_refresh_view(false);
        }
        else {
            value = previous_value;
            text_before_cursor = previous_text_before_cursor;
            gmkb_set_text(text_before_cursor);
            gmkb_example_input_refresh_text();
        }
    }
    if (gmkb_return_key_was_pressed()) {
        if (!multiline) {
            gmkb_hide_keyboard();
        }
    }
    if (gmkb_keyboard_did_hide()) {
        gmkb_example_input_set_active(false);
    }
    
    // changing the cursor position
    if (pressed) {
        var touch_x = mouse_x;
        var touch_y = mouse_y;
        var pressed_line = 0;
        var start_x = x + padding_h;
        var start_y = y + padding_v;
        if (multiline) {
            var scroll_speed = 0.25;
            if (touch_y < start_y) {
                start_at_line -= scroll_speed;
            }
            if (touch_y > start_y + text_height) {
                start_at_line += scroll_speed;
            }
            gmkb_example_input_refresh_view(true);
            pressed_line = max(min(floor(start_at_line) + floor((touch_y + (start_at_line - floor(start_at_line)) * line_height - start_y) / line_height), number_of_lines - 1), 0);
        }
        var current_line_width = 0;
        var this_char_width = 0;
        for (var n = 0; n <= chars_per_line[pressed_line]; n++) {
            var this_position = false;
            if (n == chars_per_line[pressed_line]) {
                this_position = true;
            }
            else {
                this_char_width = char_width[pressed_line, n];
                this_position = (touch_x - start_x < current_line_width + this_char_width / 2);
                current_line_width += this_char_width;
            }
            if (this_position) {
                var add = 0;
                if (pressed_line > 0 && n == 0) {
                    add = 1;
                }
                gmkb_example_input_set_cursor_position(chars_at_beginning_of_line[pressed_line] + n + add);
                break;
            }
        }
    }
}

// draw to the surface
if (!surface_exists(surface)) {
    surface = surface_create(width, height);
}
if (surface_get_width(surface) != width || surface_get_height(surface) != height) {
    surface_resize(surface, width, height);
}
surface_set_target(surface);
draw_clear_alpha(c_black, 0);
draw_set_color(text_color);
if (value == "" && !active) {
    draw_set_color(placeholder_color);
}
draw_set_font(font);
draw_set_halign(0);
draw_set_valign(1);
var current_line = floor(start_at_line);
var yy = round((line_height / 2) - ((start_at_line - current_line) * line_height));
var count = 0;
while (count < number_of_partially_visible_lines) {
    var xx = 0;
    for (var n = 0; n < chars_per_line[current_line]; n++) {
        var sprite = char_sprite[current_line, n];
        if (sprite != -1) {
            draw_sprite(sprite, 0, padding_h + xx, padding_v + yy - round(sprite_get_height(sprite) / 2));
        }
        else {
            draw_text(padding_h + xx, padding_v + yy, string_hash_to_newline(char[current_line, n]));
        }
        xx += char_width[current_line, n];
    }
    if (current_line == cursor_on_line && active && cursor_blink_step < cursor_blink_delay) {
        var x1 = padding_h + gmkb_example_input_get_line_width(current_line, cursor_line_position);
        var y1 = padding_v + yy - round(cursor_height / 2);
        var x2 = x1 + 3;
        var y2 = y1 + cursor_height;
        draw_set_color(text_color);
        draw_rectangle(x1, y1, x2, y2, false);
        draw_set_color(text_color);
    }
    current_line ++;
    yy += line_height;
    count ++;
}
draw_set_valign(0);
surface_reset_target();

