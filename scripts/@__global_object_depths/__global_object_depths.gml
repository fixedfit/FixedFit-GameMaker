// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = 0; // main
global.__objectDepths[1] = 0; // oTitle
global.__objectDepths[2] = 0; // oAsync
global.__objectDepths[3] = 0; // oWeather
global.__objectDepths[4] = -200; // oBottomDock
global.__objectDepths[5] = 1; // gmcamera_obj_controller
global.__objectDepths[6] = 0; // gmcamera_obj_button
global.__objectDepths[7] = 0; // gmcamera_obj_button_toggle_camera
global.__objectDepths[8] = 0; // gmcamera_obj_button_take_picture
global.__objectDepths[9] = 0; // gmcamera_obj_button_toggle_recording
global.__objectDepths[10] = 0; // gmcamera_obj_button_toggle_preview
global.__objectDepths[11] = 0; // gmcamera_obj_button_switch_camera
global.__objectDepths[12] = 0; // gmcamera_obj_button_toggle_photo
global.__objectDepths[13] = 0; // gmcamera_obj_button_toggle_flash
global.__objectDepths[14] = 0; // gmcamera_obj_button_launch_full_screen
global.__objectDepths[15] = 0; // gmcamera_obj_button_launch_library
global.__objectDepths[16] = -2; // oButton
global.__objectDepths[17] = -12; // oLogin
global.__objectDepths[18] = -12; // oHome
global.__objectDepths[19] = 0; // oCloset
global.__objectDepths[20] = -12; // oAdd
global.__objectDepths[21] = -12; // oNotifications
global.__objectDepths[22] = -12; // oProfile
global.__objectDepths[23] = 0; // oRoomSwitch
global.__objectDepths[24] = 0; // gmkb_obj_example_basic
global.__objectDepths[25] = 0; // gmkb_obj_example_textboxes
global.__objectDepths[26] = 0; // gmkb_obj_textbox
global.__objectDepths[27] = 0; // gmkb_obj_textbox_name
global.__objectDepths[28] = 0; // gmkb_obj_textbox_number
global.__objectDepths[29] = 0; // gmkb_obj_textbox_url
global.__objectDepths[30] = 0; // gmkb_obj_textbox_email
global.__objectDepths[31] = 0; // gmkb_obj_example_advanced
global.__objectDepths[32] = 0; // gmkb_obj_input
global.__objectDepths[33] = 0; // gmkb_obj_input_textarea
global.__objectDepths[34] = 0; // gmkb_obj_input_name
global.__objectDepths[35] = 0; // gmkb_obj_input_description
global.__objectDepths[36] = 0; // obj_smoothview
global.__objectDepths[37] = 0; // oOutfitExample


global.__objectNames[0] = "main";
global.__objectNames[1] = "oTitle";
global.__objectNames[2] = "oAsync";
global.__objectNames[3] = "oWeather";
global.__objectNames[4] = "oBottomDock";
global.__objectNames[5] = "gmcamera_obj_controller";
global.__objectNames[6] = "gmcamera_obj_button";
global.__objectNames[7] = "gmcamera_obj_button_toggle_camera";
global.__objectNames[8] = "gmcamera_obj_button_take_picture";
global.__objectNames[9] = "gmcamera_obj_button_toggle_recording";
global.__objectNames[10] = "gmcamera_obj_button_toggle_preview";
global.__objectNames[11] = "gmcamera_obj_button_switch_camera";
global.__objectNames[12] = "gmcamera_obj_button_toggle_photo";
global.__objectNames[13] = "gmcamera_obj_button_toggle_flash";
global.__objectNames[14] = "gmcamera_obj_button_launch_full_screen";
global.__objectNames[15] = "gmcamera_obj_button_launch_library";
global.__objectNames[16] = "oButton";
global.__objectNames[17] = "oLogin";
global.__objectNames[18] = "oHome";
global.__objectNames[19] = "oCloset";
global.__objectNames[20] = "oAdd";
global.__objectNames[21] = "oNotifications";
global.__objectNames[22] = "oProfile";
global.__objectNames[23] = "oRoomSwitch";
global.__objectNames[24] = "gmkb_obj_example_basic";
global.__objectNames[25] = "gmkb_obj_example_textboxes";
global.__objectNames[26] = "gmkb_obj_textbox";
global.__objectNames[27] = "gmkb_obj_textbox_name";
global.__objectNames[28] = "gmkb_obj_textbox_number";
global.__objectNames[29] = "gmkb_obj_textbox_url";
global.__objectNames[30] = "gmkb_obj_textbox_email";
global.__objectNames[31] = "gmkb_obj_example_advanced";
global.__objectNames[32] = "gmkb_obj_input";
global.__objectNames[33] = "gmkb_obj_input_textarea";
global.__objectNames[34] = "gmkb_obj_input_name";
global.__objectNames[35] = "gmkb_obj_input_description";
global.__objectNames[36] = "obj_smoothview";
global.__objectNames[37] = "oOutfitExample";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	if (objID >= 0) {
		global.__objectID2Depth[ objID ] = global.__objectDepths[i];
	} // end if
} // end for