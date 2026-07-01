if(!global.transition){
	global.transition = true;
}

if(global.transition){
	layer_sequence_create("Start", 0, 0, sq_start);
}

audio_play_sound(snd_reloading, 0, 0);