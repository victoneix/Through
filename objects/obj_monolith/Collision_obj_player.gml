if(image_index == 0){
	image_index = 1;
	with(obj_locked_door){
		if(pressured == other.pressured) image_index = 1;
	}
}