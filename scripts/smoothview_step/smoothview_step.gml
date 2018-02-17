/// @description smoothview_step()
/// @function smoothview_step
//
// Script:      Handles the movement of the view
// Date:        2017-02-08
// Copyright:   PeliStar

// Initialise the movement by pressing
var mx = device_mouse_x(0);
var my = device_mouse_y(0);
if (device_mouse_check_button_pressed(0,mb_left))
{
    //Start position for dragging
    drag_speed = 0;
    if (horizontal == 1)
        drag = mx;
    else
        drag = my;
}

// Scrolling horizontally
if (horizontal == 1)
{
    if (device_mouse_check_button(0,mb_left))
    {
        //Drag
        drag_speed = (drag - mx) * speed_modifier;
        global.x_offset += drag_speed;
    }

    if (abs(drag_speed) > 0)
    {
        //Drag slow down effect
        global.x_offset += drag_speed;
        if (global.x_offset <= 0 || global.x_offset >= (global.drag_width-global.drag_view_width)) then drag_speed = 0;
        drag_speed += (-drag_speed*smooth);
    }

    //Keep the screen within the room
    global.x_offset = max(0, min(global.x_offset, global.drag_width - global.drag_view_width));
}
else
{
    if (!master.pressing_button&&device_mouse_check_button(0,mb_left))
    {
        //Drag
        if(global.y_offset<0){
            drag_speed = (drag - my) * 1/(min(4,max(4,-global.y_offset)));
        }else if(global.y_offset>global.drag_height-global.drag_view_height){
            drag_speed = (drag - my) * 1/(min(4,max(4,global.y_offset-(global.drag_height-global.drag_view_height))));
        }else{
            drag_speed = (drag - my) * speed_modifier;
        }
        global.y_offset += drag_speed;
        drag=my;
    }else if (abs(drag_speed) > 0)
    {
        //Drag slow down effect
        global.y_offset += drag_speed;
        if (global.y_offset <= 0 || global.y_offset >= (global.drag_height-global.drag_view_height)) then drag_speed = 0;
        drag_speed += (-drag_speed*smooth);
        //Keep the screen within the room
        if(global.y_offset<0){
            global.y_offset*=.8;  
            if(global.y_offset>-1){
                global.y_offset=0;
            }
        }else if(global.y_offset>global.drag_height-global.drag_view_height){
            global.y_offset=global.drag_height-global.drag_view_height+(global.y_offset-(global.drag_height-global.drag_view_height))*.8;
        }
    }else{
        //Keep the screen within the room
        if(global.y_offset<0){
            global.y_offset*=.8;  
            if(global.y_offset>-1){
                global.y_offset=0;
            }
        }else if(global.y_offset>global.drag_height-global.drag_view_height){
            global.y_offset=global.drag_height-global.drag_view_height+(global.y_offset-(global.drag_height-global.drag_view_height))*.8;
        }
    }

    
    //global.y_offset = max(0, min(global.y_offset, global.drag_height - global.drag_view_height));
}

