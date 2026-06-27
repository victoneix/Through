moving();
teleportation();
if(!place_meeting(x, y, obj_off) && !place_meeting(x,y,obj_on)){
	if(keyboard_check_pressed(vk_enter)) place =! place;
}

//show_debug_message(hspd);
//show_debug_message(vspd);