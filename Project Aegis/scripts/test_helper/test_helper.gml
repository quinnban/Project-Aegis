// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

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