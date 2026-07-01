with(obj_player){
	if(check_collision(x,y+1) && place_meeting(x,y,obj_door)){
		room_goto(obj_door.next_level);
	}
}