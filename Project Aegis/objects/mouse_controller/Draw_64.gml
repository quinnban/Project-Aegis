/// @description Insert description here
// You can write your code in this editor

draw_text(200,15,string("M x: {0}",mouse_x));
draw_text(200,0,string("M y: {0}",mouse_y));

var _instance = obj_controller_grid;

var _num = instance_position_list(mouse_x, mouse_y,obj_grid_square, _collision_ds_list, true);
draw_text(200,90,string("Colsions : {0}",_num));

var _x_y = get_x_y_mouse_selected(_instance);

if(_x_y[0] >= 0 and _x_y[1] >=0){
	draw_text(200,45,string(" FLx: {0}",_tile_x));
	draw_text(200,30,string(" FLy: {0}",_tile_y));
}