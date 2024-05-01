/// @description Highlight objects movement on grid
// You can write your code in this editor


var _char = global.cur_char;

if(_char != undefined){
	for(var _i = 0; _i <= _char.v_movement_speed; _i++;) {
		//_i = y counter
		for(var _j = 0; _j <= _i; _j++; ){
			// _j = x
			// total needs to = radius i 
			var _difference = _i - _j
			var _x_right = _char.v_tile_x + _difference;
			var _x_left = _char.v_tile_x - _difference;
			var _y_up = _char.v_tile_y + _j;
			var _y_down = _char.v_tile_y - _j;
		
			if(_y_up < v_size_y && _x_right < v_size_x ){
				var _index1 = calculate_index_of_tile(_x_right,_y_up,v_size_x);
				var _tile1 = v_list_obj_tiles[|_index1];
				_tile1.sprite_index = s_grid_box;
			}
		
			if(_y_up < v_size_y && _x_left >= 0 ){
				var _index1 = calculate_index_of_tile(_x_left,_y_up,v_size_x);
				var _tile1 = v_list_obj_tiles[|_index1];
				_tile1.sprite_index = s_grid_box;
			}
		
			if(_y_down >= 0 && _x_right < v_size_x ){
				var _index1 = calculate_index_of_tile(_x_right,_y_down,v_size_x);
				var _tile1 = v_list_obj_tiles[|_index1];
				_tile1.sprite_index = s_grid_box;
			}
		
			if(_y_down >=0  && _x_left >= 0 ){
				var _index1 = calculate_index_of_tile(_x_left,_y_down,v_size_x);
				var _tile1 = v_list_obj_tiles[|_index1];
				_tile1.sprite_index = s_grid_box;
			}
		
		}	
	}
}