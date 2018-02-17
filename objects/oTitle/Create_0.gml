//Based on the room, set the title shown at the top
switch(room){
    case rLogin:
        name=master.STR_TITLE;
        break;
    case rHome:
        name=master.STR_HOME;
        break;
    case rCloset:
        name=master.STR_CLOSET;
        break;
    case rAdd:
        name=master.STR_ADD;
        break;
    case rNotifications:
        name=master.STR_NOTIFICATIONS;
        break;
    case rProfile:
        if(global.email==""){
            name=master.STR_PROFILE;
        }else{
            name=global.email;
        }
        break;
}