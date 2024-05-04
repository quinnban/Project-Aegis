/// @description Insert description here
// You can write your code in this editor
draw_self();
var _grid = obj_controller_grid;

if(v_state == PLAYER_STATE.CHOOSING_MOVE){
	//mouse tile
	var _tile_cords = get_x_y_mouse_selected(_grid);
	var _tile_x = _tile_cords[0];
	var _tile_y = _tile_cords[1];
	var _distance = abs(_tile_x - v_tile_x) + abs(_tile_y - v_tile_y);
	var _check1 = _tile_x == v_tile_x && _tile_y == v_tile_y;
	var _check2 = _tile_x >= 0 && _tile_y >= 0 && _tile_y < _grid.v_size_y && _tile_x < _grid.v_size_x;
	var _check3 = _distance <= v_movement_speed;
	
	if(!_check1 && _check2 && _check3){
		if(mouse_check_button_released(mb_any)){
			var _index =calculate_index_of_tile(_tile_x,_tile_y,_grid.v_size_x);
			var _obj = _grid.v_list_obj_tiles[|_index];
			v_target_x = _obj.v_tile_x;
			v_target_y = _obj.v_tile_y;
			v_target_z = _obj.v_tile_z;
			unhightlight_tiles_in__movement_range(_grid);
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
		var _pixel_x = calculate_pixel_x(v_next_x,v_next_y,32,v_offset_x);
		//the 8 have something to do with the sprite orgin
		var _pixel_y = calculate_pixel_y(v_next_x,v_next_y,v_next_z,32,v_offset_y)-8;
		var _dir = point_direction(x,y,_pixel_x,_pixel_y);
		if(point_distance(x,y,_pixel_x,_pixel_y) > 1){
			change_sprite_imagine_moving(_dir);
			x+=lengthdir_x(2,_dir)
			y+=lengthdir_y(2,_dir)
		} else {
			v_tile_x = v_next_x;
			v_tile_y = v_next_y;
			v_state = PLAYER_STATE.IDLE;
			sprite_index = s_char_base;
		}
	}
}