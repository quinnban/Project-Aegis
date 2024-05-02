/// @description Insert description here
// You can write your code in this editor

draw_text(200,15,string("M x: {0}",mouse_x));
draw_text(200,0,string("M y: {0}",mouse_y));

var _instance = obj_controller_grid;
var _collision_ds_grid = ds_list_create();

var _num = instance_position_list(mouse_x, mouse_y,obj_grid_square, _collision_ds_grid, true);
draw_text(200,60,string("Colsions : {0}",_num));

if(_num > 0){
	draw_text(200,75,string("obj : {0}",_collision_ds_grid[|0]));
	var _mx = (mouse_x - _instance.v_offset_x);
	var _my = (mouse_y - _instance.v_offset_y);
	var _tile_x = floor((_my + (_mx/2))/16);
	var _tile_y = floor((_my - (_mx/2))/16);
	
	draw_text(200,45,string("G x: {0}",_tile_x));
	draw_text(200,30,string("G y: {0}",_tile_y));
}


ds_list_destroy(_collision_ds_grid);
