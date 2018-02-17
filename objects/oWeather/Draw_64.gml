draw_set_font(global.WEATHER_FONT);
draw_set_color(global.TEXT_COLOR);
draw_set_alpha(1);    
if(temperature!="-999"){
    draw_text(x2gui(x),y2gui(y-global.y_offset),temperature);
}else{
	draw_text(x2gui(x),y2gui(y-global.y_offset),master.STR_TEMPERATURE);
}