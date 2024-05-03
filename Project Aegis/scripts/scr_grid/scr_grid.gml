// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function place_grid_objects(_size_x,_size_y,_tile_height,_tile_width){
	for(i =0; i < _size_y; i++ ;) {
		var _layer = (_size_x*_size_y) - (i*_size_x);
		for(j =0; j < _size_x; j++ ;) {
			_layer -= 1 ;
			var _x = calculate_pixel_x(j,i,_tile_height,_tile_width);
			var _y = calculate_pixel_y(j,i,_tile_height,_tile_width);
			var _obj_id = instance_create_depth(0,0,_layer,obj_grid_square,{
				v_tile_x:j,
				v_tile_y:i,
				v_tile_z:0,
				v_offset_x:v_offset_x,
				v_offset_y:v_offset_y
				});
			ds_list_add(v_list_obj_tiles,_obj_id);
		}
	}
}

function calculate_pixel_x(_tile_x,_tile_y,_tile_height,_tile_width){
	// x= x*0.5w + y*-0.5w
	return ((_tile_x * (_tile_width*0.5)) + (_tile_y * - (_tile_width * 0.5))) + v_offset_x;
}

function calculate_pixel_y(_tile_x,_tile_y,_tile_height,_tile_width){
	// y = x*0.25h + y*0.25h
	return  ((_tile_x * (_tile_height * 0.25)) + (_tile_y * (_tile_height * 0.25))) + v_offset_y ;
}

function calculate_tile_x_floor(_pixel_x,_pixel_y,_v_offset_y,_v_offset_x){
	return floor(calculate_tile_x(_pixel_x,_pixel_y,_v_offset_y,_v_offset_x));
}

function calculate_tile_y_floor(_pixel_x,_pixel_y,_v_offset_y,_v_offset_x){
	return floor(calculate_tile_y(_pixel_x,_pixel_y,_v_offset_y,_v_offset_x));
}

function calculate_tile_x(_pixel_x,_pixel_y,_v_offset_y,_v_offset_x){
	return ((_pixel_y - _v_offset_y) + ((_pixel_x - _v_offset_x)/2))/16;
}

function calculate_tile_y(_pixel_x,_pixel_y,_v_offset_y,_v_offset_x){
	return ((_pixel_y - _v_offset_y) - ((_pixel_x - _v_offset_x)/2))/16;
}

function find_next_tile_to_move_object_to_x_y(_character,_grid){
	var _distance_x = abs(_character.v_tile_x -_character.v_target_x);
	var _distance_y = abs(_character.v_tile_y -_character.v_target_y);
	
	if((_distance_y >= _distance_x)  && _distance_y !=0) {
		if(_character.v_tile_y - _character.v_target_y > 0){
			return _grid.v_list_obj_tiles[|((_character.v_tile_y -1) * _grid.v_size_x + _character.v_tile_x)];
		} else {
			return _grid.v_list_obj_tiles[|((_character.v_tile_y +1) *_grid. v_size_x + _character.v_tile_x)];
		}
	} else if (_distance_x > _distance_y) {
		if(_character.v_tile_x - _character.v_target_x > 0){
			return _grid.v_list_obj_tiles[|((_character.v_tile_y) * _grid.v_size_x + (_character.v_tile_x-1))];
		} else {
			return _grid.v_list_obj_tiles[|((_character.v_tile_y) * _grid.v_size_x + (_character.v_tile_x+1))];
		}
	} else {
		return undefined;
	}
}

function find_direction_for_object_next_tile_x_y(_character,_grid){
	var _char_x = calculate_tile_x(_character.x,_character.y,_grid.v_offset_y,_grid.v_offset_x);
	var _char_y = calculate_tile_y(_character.x,_character.y,_grid.v_offset_y,_grid.v_offset_x);
	var _distance_y = abs(_char_y -_character.v_next_y);
	var _distance_x = abs(_char_x - _character.v_next_x);
	
	if((_distance_y >= _distance_x)  && _distance_y !=0) {
		if(_char_y - _character.v_next_y > 0){
			_character.sprite_index = s_char_walk_up;
			return DIRECTION.UP;
		} else {
			_character.sprite_index = s_char_walk_down;
			return DIRECTION.DOWN;
		}
	} else if (_distance_x > _distance_y) {
		if(_char_x - _character.v_next_x > 0){
			_character.image_xscale =-1
			_character.sprite_index = s_char_walk_horizonal;
			return DIRECTION.LEFT;
		} else {
			_character.image_xscale =1
			_character.sprite_index = s_char_walk_horizonal;
			return DIRECTION.RIGHT;
		}
	} else {
		_character.image_xscale =1
		_character.sprite_index = s_char_base;
		return DIRECTION.NONE;
	}
}

function move_object_to_tile_step(_character,_direction){
		var _x_pixel_distance = 32 * _character.v_speed;
		var _y_pixel_distance = 16 * _character.v_speed;
		
		//_y_pixel_distance+= abs(_character.v_tile_z - _character.v_target_z) * 8 * _character.v_speed
		
		switch(_direction){
			case DIRECTION.UP:
			_character.x+=_x_pixel_distance;
			_character.y-=_y_pixel_distance;
			break;
			case DIRECTION.DOWN:
			_character.x-=_x_pixel_distance;
			_character.y+=_y_pixel_distance;
			break;
			case DIRECTION.LEFT:
			_character.x-=_x_pixel_distance;
			_character.y-=_y_pixel_distance;
			break;
			case DIRECTION.RIGHT:
			_character.x+= _x_pixel_distance;	
			_character.y+=_y_pixel_distance;
			break;	
		}
}

function calculate_index_of_tile(_x,_y,_size_x){
	return _y * _size_x + _x; 
}


