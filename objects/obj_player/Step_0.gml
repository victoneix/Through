moving();
teleportation();
death_player();

var _spike_on = place_meeting(x,y,obj_spike_on);
var _spike_off = place_meeting(x,y,obj_spike_off);
var _spike = place_meeting(x,y,obj_spike);

if(!place_meeting(x, y, obj_off) && !place_meeting(x,y,obj_on)){
	if(!_spike_on && !_spike_off && !_spike){
		if(keyboard_check_pressed(vk_enter)){
			audio_play_sound(snd_swetch, 0, 0);
			place =! place
		}
	}
}

var _spike_on = place_meeting(x,y,obj_spike_on);
var _spike_off = place_meeting(x,y,obj_spike_off);
var _spike = place_meeting(x,y,obj_spike);

if(death_p){
	len--;
	if(len > 0){
		audio_play_sound(snd_death_p, 0, 0);
	}
}

if(place && _spike_off){
	death_p = true;
} 

if(!place && _spike_on){
	death_p = true;
}

if(instance_place(x+hspd,y,obj_enemy)){
	death_p = true;
}

if(instance_place(x,y,obj_spike)){
	death_p = true;
}