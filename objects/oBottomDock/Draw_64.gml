draw_set_alpha(.8);
draw_set_color(global.BOTTOM_BAR_COLOR);
draw_rectangle(x1,y1,x2,y2,false);
draw_set_color(global.BOTTOM_HL_COLOR);
switch(room){
    case rHome:
        draw_rectangle(0,y1,dis,y2,false);
        break;
    case rCloset:
        draw_rectangle(dis,y1,dis*2,y2,false);
        break;
    case rNotifications:
        draw_rectangle(dis*3,y1,dis*4,y2,false);
        break;
    case rProfile:
        draw_rectangle(dis*4,y1,dis*5,y2,false);
        break;
}
draw_set_alpha(1);