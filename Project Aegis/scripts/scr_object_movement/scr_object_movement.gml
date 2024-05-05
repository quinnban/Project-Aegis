
/// @function					find_next_tile_to_move_object_to_x_y(_character,_grid){
/// @param {Id.Instance}		_character obj_character
/// @param {Asset.GMObject}		_grid obj_grid_controller
/// @description				returns obj_grid_square or undefined 
/// @return	{Asset.GMObject}
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
