/// @description Insert description here
// You can write your code in this editor


//mouse tile
var _tile_x = calculate_tile_x_floor(mouse_x,mouse_y,v_offset_y,v_size_x);
var _tile_y = calculate_tile_y_floor(mouse_x,mouse_y,v_offset_y,v_size_x);

vy += (keyboard_check(vk_down) - keyboard_check(vk_up))*4;
vx += (keyboard_check(vk_right) - keyboard_check(vk_left))*4;

camera_set_view_pos(view_camera[0], vx, vy);


//if(_tile_x >= 0 && _tile_y >= 0 && _tile_y < v_size_y && _tile_x < v_size_x){
//	if(mouse_check_button_released(mb_any)){
//		var _index = _tile_y * v_size_x + _tile_x;  
//		var _obj = v_list_obj_tiles[|_index];
//		obj_character.v_target_x = _obj.v_tile_x;
//		obj_character.v_target_y = _obj.v_tile_y;
//		obj_character.v_target_z = _obj.v_tile_z;
//	}
//}

//if(obj_character.v_target_x > -1 && obj_character.v_target_y > -1){
	
//	if(obj_character.v_state = PLAYER_STATE.IDLE){
//		var _next_tile = find_next_tile_to_move_object_to_x_y(obj_character);
//		if(_next_tile != undefined) {
//			obj_character.v_next_x =  _next_tile.v_tile_x;
//			obj_character.v_next_y = _next_tile.v_tile_y;
//			obj_character.v_next_z = _next_tile.v_tile_z;
//			obj_character.v_state = PLAYER_STATE.MOVING;
//		} else {
//			obj_character.v_next_x =  -1;
//			obj_character.v_next_y = -1;
//			obj_character.v_target_x = -1;
//			obj_character.v_target_y = -1;
//		}
//	}
	
//	if(obj_character.v_state = PLAYER_STATE.MOVING){
//		var _direction = find_direction_for_object_next_tile_x_y(obj_character);
//		if(_direction = DIRECTION.NONE){
//			obj_character.v_tile_x = obj_character.v_next_x;
//			obj_character.v_tile_y = obj_character.v_next_y;
//			obj_character.v_state = PLAYER_STATE.IDLE;
//		}
//		move_object_to_tile_step(obj_character,_direction);
//	}
//}