event_inherited();

move_spd = 1.20;
move_dir = 1;

walk = function(){
	var _ground = place_meeting(x, y+1, obj_collision_enemies);
	
	if(_ground){
		hspd = move_dir * move_spd;
	}
	if(place_meeting(x+hspd, y, obj_collision_enemies)){
		move_dir*=-1;
	}
	
	if(!position_meeting(x + (8 * move_dir), y+1, obj_collision_enemies)){
		move_dir*=-1;
	}
}

teleportation = function(){
	if(x < -16){
		x = room_width + 16;
	} else if(x > room_width + 16){
		x = -16;
	}
	
	if(y < -16){
		y = room_height + 16;
	} else if(y > room_height + 16){
		y = -16;
	}
}
