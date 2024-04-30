var _instance_number = instance_number(obj_parent_depth);
var _depth_grid = ds_depth_grid;

ds_grid_resize(_depth_grid, 2, _instance_number);

var _i = 0;
with (obj_parent_depth) {
		var _isometric_coordinates = pixel_coordinates_to_isometric(x, y);
		_depth_grid[# 0, _i] = id;
		_depth_grid[# 1, _i] = _isometric_coordinates[1];
		_i++
}

ds_grid_sort(_depth_grid, 1, true);

var _j = 0;
var _instance;
repeat (_instance_number) {
	_instance = _depth_grid[# 0, _j];
	with (_instance) {
		event_perform(ev_draw, 0);
	}
	_j++;
}
