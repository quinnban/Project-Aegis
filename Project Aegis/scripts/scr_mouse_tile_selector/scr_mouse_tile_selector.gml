/// @function					get_x_y_mouse_selected(_grid);
/// @param {Asset.GMObject}		_grid obj_grid_controller
/// @description				return [x,y] of grid of where the mouse is. return [-1,-1] if not on tile
/// @return	{Array<Real>}
function get_x_y_mouse_selected(_grid){
	var _collision_ds_list = ds_list_create();
	var _num = instance_position_list(mouse_x, mouse_y,obj_grid_square, _collision_ds_list, true);
	if(_num > 0) {
		var _test_array = ds_list_to_array(_collision_ds_list);
		var _length = array_length(_test_array);
		// if its more than 4 tiles is likely on the edge of a tile with z -1 
		if(_num > 4) {
			array_sort(_test_array,function(_a,_b){return _b.v_current_cord.z - _a.v_current_cord.z});
		} else {
			array_sort(_test_array,function(_a,_b){return _a.v_current_cord.z - _b.v_current_cord.z});
		}
		//FIXME MAYBE CHANGE THIS
		var _my = mouse_y + _test_array[0].v_current_cord.z * 8;
		var _tile_x = calculate_tile_x_floor(mouse_x,_my);
		var _tile_y = calculate_tile_y_floor(mouse_x,_my);
		var _check1 = _tile_x >= 0 && _tile_y >= 0 && _tile_y < global.size_y && _tile_x < global.size_x;
		ds_list_destroy(_collision_ds_list);
		if(_check1){
			return [_tile_x,_tile_y];
		}
	}
	return[-1,-1];
}


/// @function					ds_list_to_array(_list);
/// @param {Id.DsList}			_list ds list
/// @description				transforms a ds list into an array
/// @return	{Array}
function ds_list_to_array(_list) {
	// Error Checking
	if !ds_exists(_list, ds_type_list) {
		__ds_struct_array_conversion_throw("Not a ds_list");   
	}
	var _list_size = ds_list_size(_list);
	var _array = array_create(_list_size-1,0);
	var _len = _list_size;
	var _i = 0;
	repeat(_len) {
		var _index = _list[| _i];
		
		_array[_i] = _index;
		++_i;
    }
	return _array;
}


