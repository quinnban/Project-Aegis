/// @function					hightlight_tiles_in__movement_range(_grid);
/// @param {Asset.GMObject}		_grid	obj_grid_controller
/// @description				can only be run in obj_character context, hightlights tiles in v_movement_speed range
function hightlight_tiles_in__movement_range(_grid){
	for(var _i = 0; _i <= v_movement_speed; _i++;) {
	//_i = y counter
		for(var _j = 0; _j <= _i; _j++; ){
			// _j = x
			// total needs to = radius i 
			var _difference = _i - _j
			var _x_right = v_tile_x + _difference;
			var _x_left = v_tile_x - _difference;
			var _y_up = v_tile_y + _j;
			var _y_down = v_tile_y - _j;
		
			if(_y_up < _grid.v_size_y && _x_right < _grid.v_size_x ){
				var _index1 = calculate_index_of_tile(_x_right,_y_up,_grid.v_size_x);
				var _tile1 = _grid.v_list_obj_tiles[|_index1];
				_tile1.sprite_index = s_grid_box_hightlight;
			}
		
			if(_y_up < _grid.v_size_y && _x_left >= 0 ){
				var _index1 = calculate_index_of_tile(_x_left,_y_up,_grid.v_size_x);
				var _tile1 = _grid.v_list_obj_tiles[|_index1];
				_tile1.sprite_index = s_grid_box_hightlight;
			}
		
			if(_y_down >= 0 && _x_right < _grid.v_size_x ){
				var _index1 = calculate_index_of_tile(_x_right,_y_down,_grid.v_size_x);
				var _tile1 = _grid.v_list_obj_tiles[|_index1];
				_tile1.sprite_index = s_grid_box_hightlight;
			}
		
			if(_y_down >=0  && _x_left >= 0 ){
				var _index1 = calculate_index_of_tile(_x_left,_y_down,_grid.v_size_x);
				var _tile1 = _grid.v_list_obj_tiles[|_index1];
				_tile1.sprite_index = s_grid_box_hightlight;
			}
		}	
	}
}

/// @function					unhightlight_tiles_in__movement_range(_grid);
/// @param {Asset.GMObject}		_grid	obj_grid_controller
/// @description				can only be run in obj_character context, unhightlights tiles in v_movement_speed range
function unhightlight_tiles_in__movement_range(_grid){
	for(var _i = 0; _i <= v_movement_speed; _i++;) {
		//_i = y counter
		for(var _j = 0; _j <= _i; _j++; ){
			// _j = x
			// total needs to = radius i 
			var _difference = _i - _j
			var _x_right = v_tile_x + _difference;
			var _x_left = v_tile_x - _difference;
			var _y_up = v_tile_y + _j;
			var _y_down = v_tile_y - _j;
		
			if(_y_up < _grid.v_size_y && _x_right < _grid.v_size_x ){
				var _index1 = calculate_index_of_tile(_x_right,_y_up,_grid.v_size_x);
				var _tile1 = _grid.v_list_obj_tiles[|_index1];
				_tile1.sprite_index = s_grid_box;
			}
		
			if(_y_up < _grid.v_size_y && _x_left >= 0 ){
				var _index1 = calculate_index_of_tile(_x_left,_y_up,_grid.v_size_x);
				var _tile1 = _grid.v_list_obj_tiles[|_index1];
				_tile1.sprite_index = s_grid_box;
			}
		
			if(_y_down >= 0 && _x_right < _grid.v_size_x ){
				var _index1 = calculate_index_of_tile(_x_right,_y_down,_grid.v_size_x);
				var _tile1 = _grid.v_list_obj_tiles[|_index1];
				_tile1.sprite_index = s_grid_box;
			}
		
			if(_y_down >=0  && _x_left >= 0 ){
				var _index1 = calculate_index_of_tile(_x_left,_y_down,_grid.v_size_x);
				var _tile1 = _grid.v_list_obj_tiles[|_index1];
				_tile1.sprite_index = s_grid_box;
			}
		
		}	
	}
}
	
/// @function					change_sprite_imagine_moving(_dir);
/// @param {Real}				_deg	direction in degs
/// @description				changes the charcter sprite base of direction they are going
function change_sprite_imagine_moving(_deg){
	var _dir = round(_deg/90)
	switch(_dir){
		case 1:
		image_xscale =-1
		sprite_index = s_char_walk_horizonal;
		break;
		case 2:
		sprite_index = s_char_walk_up;
		break;
		case 3:
		sprite_index = s_char_walk_horizonal;
		break;
		case 4:
		sprite_index = s_char_walk_down;
		break;
		default:
		sprite_index = s_char_walk_down;
	}
}