// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// @function draw_grid();
function draw_grid(){
	var _width = 1;
	draw_set_color(c_white);
	draw_set_alpha(0.5);

	for(var _y = 0; _y < room_height; _y+=62;){
		// mx2 = y2 - y1 + mx1
		var _end_x = room_width - _y + 0;
		// cords start from top left not bottom left
		var _start_y = (room_height-_y);
		draw_line_width(0,_start_y,_end_x,0,_width);
		draw_line_width(room_width,_y,_y,room_height,_width);
	}
	
	
	for(var _x = 0; _x < room_width; _x+=62;) {
		var _end_y = room_width - _x + 0;
		var _end_x = room_height - _x;
		draw_line_width(_x,0,room_width,_end_y,_width);
		draw_line_width(0,_x,(room_height - _x),room_height,_width);
	}
}

function place_grid_objects(_size_x,_size_y,_tile_height,_tile_width){
	for(i =0; i < _size_y; i++ ;) {
		var _layer = (_size_x*_size_y) - (i*_size_x);
		for(j =0; j < _size_x; j++ ;) {
			_layer -= 1 ;
			var _x = calculate_pixel_x(j,i,_tile_height,_tile_width)
			var _y = calculate_pixel_y(j,i,_tile_height,_tile_width)
			var _obj_id = instance_create_depth(_x,_y,_layer,obj_grid_square);
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

function calculate_tile_x_floor(_pixel_x,_pixel_y){
	return floor(calculate_tile_x(_pixel_x,_pixel_y));
}

function calculate_tile_y_floor(_pixel_x,_pixel_y){
	return floor(calculate_tile_y(_pixel_x,_pixel_y));
}


function calculate_tile_x(_pixel_x,_pixel_y){
	return ((_pixel_y - v_offset_y) + ((_pixel_x - v_offset_x)/2))/16;
}

function calculate_tile_y(_pixel_x,_pixel_y){
	return ((_pixel_y - v_offset_y) - ((_pixel_x - v_offset_x)/2))/16;
}

function find_next_tile_to_move_object_to(_character){
	var _char_x = calculate_tile_x_floor(_character.x,_character.y);
	var _char_y = calculate_tile_y_floor(_character.x,_character.y);
	var _target_tile_x = calculate_tile_x_floor(_character.v_target_x,_character.v_target_y);
	var _target_tile_y = calculate_tile_y_floor(_character.v_target_x,_character.v_target_y);
	var _distance_y = abs(_char_y -_target_tile_y);
	var _distance_x = abs(_char_x - _target_tile_x);
	
	if((_distance_y >= _distance_x)  && _distance_y !=0) {
		if(_char_y - _target_tile_y > 0){
			return v_list_obj_tiles[|((_char_y-1) * v_size_x + _char_x)];
		} else {
			return v_list_obj_tiles[|((_char_y+1) * v_size_x + _char_x)];
		}
	} else if (_distance_x > _distance_y) {
		if(_char_x - _target_tile_x > 0){
			return v_list_obj_tiles[|((_char_y) * v_size_x + (_char_x-1))];
		} else {
			return v_list_obj_tiles[|((_char_y) * v_size_x + (_char_x+1))];
		}
	} else {
		return undefined;
	}
}

function find_direction_for_object_next_tile(_character){
	//FIXME calculate_tile uses rounding so this doesnt work well if we move anything less that a tile at a time
	var _char_x = calculate_tile_x(_character.x,_character.y);
	var _char_y = calculate_tile_y(_character.x,_character.y);
	var _target_tile_x = calculate_tile_x(_character.v_next_x,_character.v_next_y);
	var _target_tile_y = calculate_tile_y(_character.v_next_x,_character.v_next_y);
	var _distance_y = abs(_char_y -_target_tile_y);
	var _distance_x = abs(_char_x - _target_tile_x);
	
	if((_distance_y >= _distance_x)  && _distance_y !=0) {
		if(_char_y - _target_tile_y > 0){
			_character.sprite_index = s_char_walk_up;
			return DIRECTION.UP;
		} else {
			_character.sprite_index = s_char_walk_down;
			return DIRECTION.DOWN;
		}
	} else if (_distance_x > _distance_y) {
		if(_char_x - _target_tile_x > 0){
			_character.sprite_index = s_char_walk_horizonal;
			return DIRECTION.LEFT;
		} else {
			_character.sprite_index = s_char_walk_horizonal;
			return DIRECTION.RIGHT;
		}
	} else {
		_character.sprite_index = s_char_base;
		return DIRECTION.NONE;
	}
}

function move_object_to_tile_step(_character,_direction){
		var _x_pixel_distance = 32 * _character.v_speed;
		var _y_pixel_distance = 16 * _character.v_speed;
		
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

		

