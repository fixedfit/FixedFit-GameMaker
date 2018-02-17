var path = argument0;
var file = file_text_open_read(path);
var str = file_text_read_string(file);
file_text_close(file);
str = string_delete(str, 1, string_pos("temp", str)+5);
str = string_copy(str,1,string_pos(",",str)-1);
return (9/5)*(real(str) - 273) + 32;
