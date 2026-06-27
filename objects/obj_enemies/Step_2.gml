repeat(abs(hspd)){
	if(place_meeting(x + sign(hspd), y, obj_collision_enemies)){
		hspd = 0;
		break;
	} else {
		x += sign(hspd);
	}	
}
	
repeat(abs(vspd)){
	if(place_meeting(x, y + sign(vspd), obj_collision_enemies)){
		vspd = 0;
		break;
	} else {
		y += sign(vspd);
	}
}