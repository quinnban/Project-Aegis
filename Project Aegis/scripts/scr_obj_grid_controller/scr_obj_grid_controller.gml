
/// @function					place_grid_objects(_size_x,_size_y,_tile_height,_tile_width);
/// @param {real}  _size_x		Size in x direction of map
/// @param {real}  _size_y		Size in y direction of map
/// @param {real}  _tile_height	Sprite height
/// @param {real}  _tile_width	Sprite width
/// @description				Test function that draws the grid on the map
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