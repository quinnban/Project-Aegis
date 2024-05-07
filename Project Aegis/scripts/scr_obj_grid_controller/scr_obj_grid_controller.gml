/// @function					place_grid_objects();
/// @description				Test function that draws the grid on the map
function place_grid_objects(){
	for(i =0; i < global.size_y; i++ ;) {
		var _layer = (global.size_x * global.size_y) - (i * global.size_x );
		for(j =0; j < global.size_x; j++ ;) {
			_layer -= 1 ;
			var _obj_id = instance_create_depth(0,0,_layer,obj_grid_square,{
				v_current_cord: new Coordinate(j,i,0) 
				});
			array_push(v_tile_array,_obj_id);
		}
	}
}