/// @description smoothview_can_press(drag_speed, limit)
/// @function smoothview_can_press
/// @param drag_speed
/// @param  limit
//
// Script:      Checks whether you may click on a moving button
//              Used to prevent clicking while dragging
// Date:        2017-02-08
// Copyright:   PeliStar
//
// Arguments:
// argument0:   The drag speed of the controller object
// argument1:   Limit value of pressing

return (abs(argument0) <= argument1);
