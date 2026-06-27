spd = 2;
hspd = 0;
vspd = 0;
grav = 0.2;
place = false;

moving = function(){
	var _right	= keyboard_check(ord("D"));
	var _left	= keyboard_check(ord("A"));
	var _jump	= keyboard_check_pressed(ord("W"));
	
	hspd = (_right - _left)*spd;
	vspd += grav;
	vspd = clamp(vspd, -12, 12);
	
	var _ground = checar_colisao(x, y+1);
	if(_ground && _jump){
		vspd -= 6;
	}
}
checar_colisao = function(_x, _y) {
	if (place_meeting(_x, _y, obj_collision)) return true;
	if (!place) {	
		if (place_meeting(_x, _y, obj_mall)) return true;
	} else {
		if (place_meeting(_x, _y, obj_nall)) return true;
	}
	return false; 
}

collision = function(){
	repeat(abs(hspd)){
		if(checar_colisao(x + sign(hspd), y)){
			hspd = 0;
			break;
		} else {
			x += sign(hspd);
		}
	}
	
	repeat(abs(vspd)){
		if(checar_colisao(x, y + sign(vspd))){
			vspd = 0;
			break;
		} else {
			y += sign(vspd);
		}
	}
}