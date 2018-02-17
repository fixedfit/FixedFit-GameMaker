/// @description init_screen();
/// @function init_screen
device_mouse_dbclick_enable(false);
if display_aa > 12 display_reset(8,true);
draw_enable_swf_aa(true);
draw_set_swf_aa_level(1);
base_w = room_width;
base_h = room_height;
var max_w = display_get_width();
var max_h = display_get_height();
var aspect = display_get_width() / display_get_height();
var VIEW_HEIGHT = base_h;
VIEW_WIDTH = VIEW_HEIGHT * aspect;//min(base_w, max_w);
x_dif = VIEW_WIDTH-base_w;
w_r=max_w/VIEW_WIDTH;
//w_r=VIEW_WIDTH/base_w;
w_r=max_w/base_w;
h_r=max_h/base_h;
l_s=min(w_r,h_r);
h_r=1;
d_w=max_w;
v_w=VIEW_WIDTH;
v_h=VIEW_HEIGHT;
d_h=max_h;
__view_set( e__VW.WView, 0, floor(VIEW_WIDTH));
__view_set( e__VW.HView, 0, floor(VIEW_HEIGHT));
__view_set( e__VW.XView, 0, round(-x_dif/2 ));
__view_set( e__VW.WPort, 0, max_w );
__view_set( e__VW.HPort, 0, max_h );
for(var r = room_first;r <= room_last;r+=1){
    room_set_view_enabled(r,true); 
    room_set_view(r,0,true,__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 ),__view_get( e__VW.WView, 0 ),__view_get( e__VW.HView, 0 ),__view_get( e__VW.XPort, 0 ),__view_get( e__VW.YPort, 0 ),__view_get( e__VW.WPort, 0 ),__view_get( e__VW.HPort, 0 ),0,0,0,0,noone);
    room_set_background_colour(r,global.BACKGROUND_COLOR,true);
}
__background_set_colour( global.BACKGROUND_COLOR );
//room_set_view_enabled(room,true);
surface_resize(application_surface, __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ));
//display_set_gui_maximise();
display_set_gui_size(__view_get( e__VW.WView, 0 ),__view_get( e__VW.HView, 0 ));
pressing_button=false;

//scrolling variables
global.x_offset=0;
global.y_offset=0;
global.drag_height=1800;//however long the feed is
global.drag_width=room_width;
global.drag_view_width=master.v_w;
global.drag_view_height=master.v_h;