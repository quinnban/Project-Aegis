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
				_tile1.sprite_index = spr_grid_box_hightlight;
			}
		
			if(_y_up < _grid.v_size_y && _x_left >= 0 ){
				var _index1 = calculate_index_of_tile(_x_left,_y_up,_grid.v_size_x);
				var _tile1 = _grid.v_list_obj_tiles[|_index1];
				_tile1.sprite_index = spr_grid_box_hightlight;
			}
		
			if(_y_down >= 0 && _x_right < _grid.v_size_x ){
				var _index1 = calculate_index_of_tile(_x_right,_y_down,_grid.v_size_x);
				var _tile1 = _grid.v_list_obj_tiles[|_index1];
				_tile1.sprite_index = spr_grid_box_hightlight;
			}
		
			if(_y_down >=0  && _x_left >= 0 ){
				var _index1 = calculate_index_of_tile(_x_left,_y_down,_grid.v_size_x);
				var _tile1 = _grid.v_list_obj_tiles[|_index1];
				_tile1.sprite_index = spr_grid_box_hightlight;
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
				_tile1.sprite_index = spr_grid_box;
			}
		
			if(_y_up < _grid.v_size_y && _x_left >= 0 ){
				var _index1 = calculate_index_of_tile(_x_left,_y_up,_grid.v_size_x);
				var _tile1 = _grid.v_list_obj_tiles[|_index1];
				_tile1.sprite_index = spr_grid_box;
			}
		
			if(_y_down >= 0 && _x_right < _grid.v_size_x ){
				var _index1 = calculate_index_of_tile(_x_right,_y_down,_grid.v_size_x);
				var _tile1 = _grid.v_list_obj_tiles[|_index1];
				_tile1.sprite_index = spr_grid_box;
			}
		
			if(_y_down >=0  && _x_left >= 0 ){
				var _index1 = calculate_index_of_tile(_x_left,_y_down,_grid.v_size_x);
				var _tile1 = _grid.v_list_obj_tiles[|_index1];
				_tile1.sprite_index = spr_grid_box;
			}
		
		}	
	}
}
	
/// @function					change_sprite_imagine_moving(_dir);
/// @param {Real}				_deg	direction in degs
/// @description				changes the charcter sprite base of direction they are going
function change_sprite_imagine_moving(_deg){
	var _dir = round(((_deg-45)%360)/90);
	draw_text(100,50,string(" Deg: {0}",_dir));
	switch(_dir){
		case 0:
		sprite_index = spr_char_walk_horizonal;
		break;
		case 1:
		sprite_index = spr_char_walk_up;
		break;
		case 2:
		image_xscale =-1;
		sprite_index = spr_char_walk_horizonal;
		break;
		case 3:
		sprite_index = spr_char_walk_down;
		break;
		default:
		sprite_index = spr_char_base;
	}
}
	
	
/// @function					find_next_tile_to_move_object_to_x_y(_character,_grid){
/// @param {Asset.GMObject}		_grid obj_grid_controller
/// @description				returns obj_grid_square or undefined must be run in character context
/// @return	{Asset.GMObject}
function find_next_tile_to_move_object_to_x_y(_grid){
	var _distance_x = abs(v_tile_x -v_target_x);
	var _distance_y = abs(v_tile_y -v_target_y);
	
	if((_distance_y >= _distance_x)  && _distance_y !=0) {
		if(v_tile_y - v_target_y > 0){
			return _grid.v_list_obj_tiles[|((v_tile_y -1) * _grid.v_size_x + v_tile_x)];
		} else {
			return _grid.v_list_obj_tiles[|((v_tile_y +1) *_grid. v_size_x + v_tile_x)];
		}
	} else if (_distance_x > _distance_y) {
		if(v_tile_x - v_target_x > 0){
			return _grid.v_list_obj_tiles[|((v_tile_y) * _grid.v_size_x + (v_tile_x-1))];
		} else {
			return _grid.v_list_obj_tiles[|((v_tile_y) * _grid.v_size_x + (v_tile_x+1))];
		}
	} else {
		return undefined;
	}
}
