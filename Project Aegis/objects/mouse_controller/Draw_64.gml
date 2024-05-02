/// @description Insert description here
// You can write your code in this editor

draw_text(200,15,string("M x: {0}",mouse_x));
draw_text(200,0,string("M y: {0}",mouse_y));

var _instance = obj_controller_grid;
var _collision_ds_list = ds_list_create();

var _num = instance_position_list(mouse_x, mouse_y,obj_grid_square, _collision_ds_list, true);
draw_text(200,90,string("Colsions : {0}",_num));


if(_num > 0) {
	var _test_array = ds_list_to_array(_collision_ds_list);
	var _length = array_length(_test_array);
	if(_num > 4) {
		array_sort(_test_array,function(_a,_b){return _b.v_tile_z - _a.v_tile_z});
	} else {
		array_sort(_test_array,function(_a,_b){return _a.v_tile_z - _b.v_tile_z});
	}
	
	var _mx = (mouse_x - _instance.v_offset_x);
	var _my = (mouse_y - _instance.v_offset_y) + _test_array[0].v_tile_z * 8;
	var _tile_x = floor((_my + (_mx/2))/16);
	var _tile_y = floor((_my - (_mx/2))/16);
	var _check1 = _tile_x >= 0 && _tile_y >= 0 && _tile_y < _instance.v_size_y && _tile_x < _instance.v_size_x;
	if(_check1){
		draw_text(200,45,string(" FLx: {0}",_tile_x));
		draw_text(200,30,string(" FLy: {0}",_tile_y));
		var _index = calculate_index_of_tile(_tile_x,_tile_y,_instance.v_size_x);
		_instance.v_list_obj_tiles[|_index].sprite_index = s_grid_box_selected;
	}

}

ds_list_destroy(_collision_ds_list);
