/// @description Insert description here
// You can write your code in this editor
draw_self();
var _grid = obj_controller_grid;

if(v_state == PLAYER_STATE.CHOOSING_MOVE){
	//mouse tile
	var _tile_x = calculate_tile_x_floor(mouse_x,mouse_y,_grid.v_offset_y,_grid.v_offset_x);
	var _tile_y = calculate_tile_y_floor(mouse_x,mouse_y,_grid.v_offset_y,_grid.v_offset_x);
	var _distance = abs(_tile_x - v_tile_x) + abs(_tile_y - v_tile_y);
	var _check1 = _tile_x == v_tile_x && _tile_y == v_tile_y;
	var _check2 = _tile_x >= 0 && _tile_y >= 0 && _tile_y < obj_controller_grid.v_size_y && _tile_x < obj_controller_grid.v_size_x;
	var _check3 = _distance <= v_movement_speed;
	
	if(!_check1 && _check2 && _check3){
		if(mouse_check_button_released(mb_any)){
			var _index = _tile_y * obj_controller_grid.v_size_x + _tile_x;  
			var _obj = obj_controller_grid.v_list_obj_tiles[|_index];
			v_target_x = _obj.v_tile_x;
			v_target_y = _obj.v_tile_y;
			v_target_z = _obj.v_tile_z;
			with(obj_controller_grid){
				event_perform(ev_other, ev_user1);
			}
			global.cur_char = undefined;
			v_state = PLAYER_STATE.IDLE;
		}
	}	
}


if(v_target_x > -1 && v_target_y > -1){
	if(v_state == PLAYER_STATE.IDLE){
		var _next_tile = find_next_tile_to_move_object_to_x_y(self,_grid);
		if(_next_tile != undefined) {
			v_next_x =  _next_tile.v_tile_x;
			v_next_y = _next_tile.v_tile_y;
			v_next_z = _next_tile.v_tile_z;
			v_state = PLAYER_STATE.MOVING;
		} else {
			v_next_x =  -1;
			v_next_y = -1;
			v_target_x = -1;
			v_target_y = -1;
		}
	}
	
	if(v_state == PLAYER_STATE.MOVING){
		var _direction = find_direction_for_object_next_tile_x_y(self,_grid);
		if(_direction = DIRECTION.NONE){
			v_tile_x = v_next_x;
			v_tile_y = v_next_y;
			v_state = PLAYER_STATE.IDLE;
		}
		move_object_to_tile_step(self,_direction);
	}
}