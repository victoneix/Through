if(image_index != 0){
	snd_open_min--;
	if(snd_open_min > 0){
		audio_play_sound(snd_open, 0, 0);
	}
}