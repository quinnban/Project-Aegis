/// @description returns an array [x,y] of which tile the mouse is one
// You can write your code in this editor

function get_x_y_mouse_selected(_grid){
	var _collision_ds_list = ds_list_create();
	var _num = instance_position_list(mouse_x, mouse_y,obj_grid_square, _collision_ds_list, true);
	if(_num > 0) {
		var _test_array = ds_list_to_array(_collision_ds_list);
		var _length = array_length(_test_array);
		// if its more than 4 tiles is likely on the edge of a tile with z -1 
		if(_num > 4) {
			array_sort(_test_array,function(_a,_b){return _b.v_tile_z - _a.v_tile_z});
		} else {
			array_sort(_test_array,function(_a,_b){return _a.v_tile_z - _b.v_tile_z});
		}
		var _my = mouse_y + _test_array[0].v_tile_z * 8;
		var _tile_x = calculate_tile_x_floor(mouse_x,_my,_grid.v_offset_y,_grid.v_offset_x);
		var _tile_y = calculate_tile_y_floor(mouse_x,_my,_grid.v_offset_y,_grid.v_offset_x);
		var _check1 = _tile_x >= 0 && _tile_y >= 0 && _tile_y < _grid.v_size_y && _tile_x < _grid.v_size_x;
		ds_list_destroy(_collision_ds_list);
		if(_check1){
			return [_tile_x,_tile_y];
		} else {
			return[-1,-1];
		}
	}
}

function ds_list_to_array(_list) {
	// Error Checking
	if !ds_exists(_list, ds_type_list) {
		__ds_struct_array_conversion_throw("Not a ds_list");   
	}
	var _listSize = ds_list_size(_list);
	var _array = array_create(_listSize-1,0);
	var _len = _listSize;
	var _i = 0;
	repeat(_len) {
		var _index = _list[| _i];
		
		_array[_i] = _index;
		++_i;
    }
	return _array;
}


