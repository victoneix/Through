moving();
if(!place_meeting(x, y, obj_mall) && !place_meeting(x,y,obj_nall)){
	if(keyboard_check_pressed(ord("R"))) place =! place;
}
image_index = place;