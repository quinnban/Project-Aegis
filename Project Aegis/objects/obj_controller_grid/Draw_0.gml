/// @description Draw Grid
// You can write your code in this editor

draw_set_colour(c_white);
draw_set_alpha(1);

var _mx = (mouse_x - v_offset_x);
var _my = (mouse_y - v_offset_y);
var _tile_x = floor((_my + (_mx/2))/16);
var _tile_y = floor((_my - (_mx/2))/16);

