/// @description Insert description here
// You can write your code in this editor
/// @description Highlight objects movement on grid
// You can write your code in this editor
for(var _i = 1;_i <= obj_character.v_movement_speed; _i++){
	
	if((obj_character.v_tile_x + _i) < v_size_x){
		var _index1 = calculate_index_of_tile(obj_character.v_tile_x + _i,obj_character.v_tile_y,v_size_x);
		var _tile1 = v_list_obj_tiles[|_index1];
		_tile1.sprite_index = s_grid_box;
	}
	
	if((obj_character.v_tile_x - _i) >= 0){
		var _index1 = calculate_index_of_tile(obj_character.v_tile_x - _i,obj_character.v_tile_y,v_size_x);
		var _tile1 = v_list_obj_tiles[|_index1];
		_tile1.sprite_index = s_grid_box;
	}
	
	if((obj_character.v_tile_y - _i) >= 0){
		var _index1 = calculate_index_of_tile(obj_character.v_tile_x,obj_character.v_tile_y - _i,v_size_x);
		var _tile1 = v_list_obj_tiles[|_index1];
		_tile1.sprite_index = s_grid_box;
	}
	
	if((obj_character.v_tile_y + _i) <= v_size_y){
		var _index1 = calculate_index_of_tile(obj_character.v_tile_x,obj_character.v_tile_y + _i,v_size_x);
		var _tile1 = v_list_obj_tiles[|_index1];
		_tile1.sprite_index = s_grid_box;
	}
	
}