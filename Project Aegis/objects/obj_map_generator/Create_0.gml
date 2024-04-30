

starting_x_offset = 150;
starting_y_offset = 32;


map_width = 3;
map_height = 3;

room_map = ds_grid_create(map_width, map_height);

for (var i = 0; i < map_width; i += 1) {
	 for (var j = 0; j < map_height; j += 1) {
		var _instance = instance_create_depth(starting_x_offset, starting_y_offset, 0, obj_map_tile); 
		with(_instance)	{
				starting_column = i;
				starting_row = j;
				event_perform(ev_other, ev_user0)
		}
		 ds_grid_add(room_map, i, j, _instance);
	 }
}

