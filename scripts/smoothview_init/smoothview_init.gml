/// @description smoothview_init(horizontal, speedmodifier, smoothness, limit)
/// @function smoothview_init
/// @param horizontal
/// @param  speedmodifier
/// @param  smoothness
/// @param  limit
//
// Script:      Initialises the smoothview
// Date:        2017-02-08
// Copyright:   PeliStar
//
// Arguments:
// argument0:   Horizontal (1) or Vertical (0)
// argument1:   Speed of the view while swiping (default: 0.33)
// argument2:   Friction causes to slow down (default: 0.08)
// argument3:   Limit value used for clicking (default: 2)

// Initialise variables
drag_speed = 0;
horizontal = argument0;
speed_modifier = argument1;
smooth = argument2;
limit = argument3;

// Set drag direction
if (horizontal == 1)
    drag = mouse_y;
else
    drag = mouse_x;
