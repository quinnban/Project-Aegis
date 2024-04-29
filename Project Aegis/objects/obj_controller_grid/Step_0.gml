/// @description Insert description here
// You can write your code in this editor


//mouse tile
var _tile_x = calculate_tile_x(mouse_x,mouse_y);
var _tile_y = calculate_tile_y(mouse_x,mouse_y);


if(_tile_x >= 0 && _tile_y >= 0 && _tile_y < v_size_y && _tile_x < v_size_x){
	if(mouse_check_button_released(mb_any)){
		var _index = _tile_y * v_size_x + _tile_x;  
		var _obj = v_list_obj_tiles[|_index];
		obj_character.v_target_x = _obj.x;
		obj_character.v_target_y = _obj.y;
	}
}

if(obj_character.v_target_x > -1 && obj_character.v_target_y > -1){
//char tile
var _char_x = calculate_tile_x(obj_character.x,obj_character.y);
var _char_y = calculate_tile_y(obj_character.x,obj_character.y);
//target tile
var _target_tile_x = calculate_tile_x(obj_character.v_target_x,obj_character.v_target_y);
var _target_tile_y = calculate_tile_y(obj_character.v_target_x,obj_character.v_target_y);

var _distance_y = abs(_char_y -_target_tile_y);
var _distance_x = abs(_char_x - _target_tile_x);
var _direction;  
var _next_tile;

if((_distance_y >= _distance_x)  && _distance_y !=0) {
	if(_char_y - _target_tile_y > 0){
		_direction = DIRECTION.UP;
		_next_tile = v_list_obj_tiles[|((_char_y-1) * v_size_x + _char_x)];
	} else {
		_direction = DIRECTION.DOWN;
		_next_tile = v_list_obj_tiles[|((_char_y+1) * v_size_x + _char_x)];
	}
	} else if (_distance_x > _distance_y) {
		if(_char_x - _target_tile_x > 0){
			_direction = DIRECTION.LEFT;
			_next_tile = v_list_obj_tiles[|((_char_y) * v_size_x + (_char_x-1))];
		} else {
			_direction = DIRECTION.RIGHT;
			_next_tile = v_list_obj_tiles[|((_char_y) * v_size_x + (_char_x+1))];
		}
	} else {
		_direction = DIRECTION.NONE;
	}

	switch(_direction){
		case DIRECTION.UP:
		case DIRECTION.DOWN:
		case DIRECTION.LEFT:
		case DIRECTION.RIGHT:
		obj_character.x=_next_tile.x;	
		obj_character.y=_next_tile.y;
		break;	
	}
}