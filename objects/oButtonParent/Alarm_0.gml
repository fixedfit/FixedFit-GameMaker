//Where the actions of each button being pressed occur
if(can_press){
    switch(object_index){
        case oLogin:
            with(gmkb_obj_input){
				switch(text_id){
					case 0:
						global.email=value;
						break;
					case 1:
						global.password=value;
						break;
				}
			}
            //login
			//verify
			//room switch
			room_switch(rHome);
            break;
        case oHome:
            room_switch(rHome);
            break; 
        case oCloset:
            room_switch(rCloset);
            break;
        case oAdd:
            room_switch(rAdd);        
            with(master){
                if(os_type==os_ios){
                    if(!image_loaded){
                        camera_launch_library();
                        text="opening library";
                    }
                }
            }
            break;
        case oNotifications:
            room_switch(rNotifications);
            break;
        case oProfile:
            room_switch(rProfile);
            break;
    }
}