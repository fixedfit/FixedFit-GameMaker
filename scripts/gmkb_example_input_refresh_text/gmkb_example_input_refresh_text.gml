/// @description  gmkb_example_input_refresh_text()
/// @function  gmkb_example_input_refresh_text

var text = value;
if (value == "" && !active) {
    text = placeholder;
}
text_width = width - 2 * padding_h;
text_height = height - 2 * padding_v;
char = 0;
char_width = 0;
char_sprite = 0;
emoji_font_size = font_get_size(font);
if (os_type == os_ios) {
    emoji_font_size = round(emoji_font_size * 0.75);
}
var list = gmkb_string_get_chars(text, font, emoji_font_size, text_width, word_wrap);
number_of_lines = ds_list_size(list);
number_of_visible_lines = text_height / line_height;
number_of_partially_visible_lines = min(ceil(number_of_visible_lines), number_of_lines);
var chars_count = 0;
for (var n = 0; n < ds_list_size(list); n++) {
    var line_characters = ds_list_find_value(list, n);
    chars_per_line[n] = ds_list_size(line_characters);
    for (var m = 0; m < ds_list_size(line_characters); m++) {
        var map = ds_list_find_value(line_characters, m);
        char[n, m] = ds_map_find_value(map, "character");
        char_width[n, m] = ds_map_find_value(map, "width");
        char_sprite[n, m] = ds_map_find_value(map, "sprite");
        ds_map_destroy(map);
    }
    ds_list_destroy(line_characters);
    chars_at_beginning_of_line[n] = chars_count;
    chars_count += chars_per_line[n];
}
ds_list_destroy(list);
gmkb_example_input_refresh_cursor();
gmkb_example_input_refresh_view(false);
