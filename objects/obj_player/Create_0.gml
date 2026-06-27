spd = 2;
hspd = 0;
vspd = 0;
grav = 0.2;

moving = function(){
	var _right	= keyboard_check(ord("D"));
	var _left	= keyboard_check(ord("A"));
	var _jump	= keyboard_check_pressed(ord("W"));
	
	hspd = (_right - _left)*spd;
	vspd += grav;
	vspd = clamp(vspd, -12, 12);
	
	var _ground = place_meeting(x, y+1, obj_wall);
	if(_ground && _jump){
		vspd -= 6;
	}
}

collision = function(){
	repeat(abs(hspd)){
		if(place_meeting(x + sign(hspd), y, obj_wall)){
			hspd = 0;
			break;
		} else{
			x += sign(hspd);
		}
	}
	
	repeat(abs(vspd)){
		if(place_meeting(x, y + sign(vspd), obj_wall)){
			vspd = 0;
			break;
		} else{
			y += sign(vspd);
		}
	}
}