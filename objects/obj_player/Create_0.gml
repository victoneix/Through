hspd = 0;
vspd = 0;
grav = .3;
place = false;

can_move = 0;
move_dir = 0;
move_spd = 0;
move_spd_max = 2;
acc = .3;
dcc = .3;

jump_max = 2;
jump_count = jump_max;
jump_height = 5;
coyote_time_max = 10;
coyote_time = 0;

x_scale = 1;
y_scale = 1;

moving = function(){
	var _right		= keyboard_check(ord("D"));
	var _left		= keyboard_check(ord("A"));
	var _jump		= keyboard_check_pressed(vk_space);
	var _jump_down	= keyboard_check(vk_space);
	var _move		= _right - _left != 0;
	var _ground		= check_collision(x, y+1);
	
	vspd += grav;
	vspd = clamp(vspd, -6, 6);
	
	if(_move){
		if(!place) sprite_index = spr_player_walk_on;
		else sprite_index = spr_player_walk_off;
		move_dir = point_direction(0, 0, _right - _left, 0);
		move_spd = approach(move_spd, move_spd_max, acc);
	} else{
		if(!place) sprite_index = spr_player_idle_on;
		else sprite_index = spr_player_idle_off;
		move_spd = approach(move_spd, 0, dcc);
	}
	
	can_move = approach(can_move, 0, .4);
	if(can_move <= 0) hspd = lengthdir_x(move_spd, move_dir);
	if(hspd != 0) x_scale = sign(hspd);
	
	if(!_jump_down && vspd < 0){
		vspd = max(vspd, -jump_height / 2)
	}
	
	if(_ground){
		coyote_time = coyote_time_max;
		jump_count = jump_max;
	} else{
		coyote_time--;
		
		if(!place){
			if(vspd > 0){
				sprite_index = spr_player_fail_on;
			} else if(vspd < 0){
				sprite_index = spr_player_jump_on;
			}
		} else{
			if(vspd > 0){
				sprite_index = spr_player_fail_off;
			} else if(vspd < 0){
				sprite_index = spr_player_jump_off;
			}
		}
	}
	
	if(_jump && coyote_time > 0 || _jump && jump_count > 0){
		jump_count--;
		coyote_time = 0;
		vspd = 0;
		vspd -= jump_height;
	}
	
	
	if(!_ground && vspd > 0){
		var _collision_enemy = instance_place(x,y+1,obj_enemies);
		if(_collision_enemy){
			vspd = 0;
			vspd -= jump_height;
			jump_count = jump_max;
			instance_destroy(_collision_enemy.id);
		}
	}
}
check_collision = function(_x, _y) {
	if (place_meeting(_x, _y, obj_collision)) return true;
	if (!place) {	
		if (place_meeting(_x, _y, obj_on)) return true;
	} else {
		if (place_meeting(_x, _y, obj_off)) return true;
	}
	return false; 
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

collision = function(){
	repeat(abs(hspd)){
		if(check_collision(x + sign(hspd), y)){
			hspd = 0;
			break;
		} else {
			x += sign(hspd);
		}
	}
	
	repeat(abs(vspd)){
		if(check_collision(x, y + sign(vspd))){
			vspd = 0;
			break;
		} else {
			y += sign(vspd);
		}
	}
}

approach = function(val1 = 0, val2 = 0, amount = 0){
	if(val1 < val2){
		val1 += amount
		if(val1 > val2)
			return val2;
	} else{
		val1 -= amount
		if(val1 < val2)
			return val2;
	}
	return val1;
}