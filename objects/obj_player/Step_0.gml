moving();
teleportation();
if(!place_meeting(x, y, obj_off) && !place_meeting(x,y,obj_on)){
	if(keyboard_check_pressed(vk_enter)) place =! place;
}

var _spike_on = place_meeting(x,y,obj_spike_on);
var _spike_off = place_meeting(x,y,obj_spike_off);

if(place && _spike_off){
	x = xstart;
	y = ystart;
} 

if(!place && _spike_on){
	x = xstart;
	y = ystart;
}

if(place_meeting(x,y,obj_enemy)){
	x = xstart;
	y = ystart;
}

//show_debug_message(hspd);
//show_debug_message(vspd);