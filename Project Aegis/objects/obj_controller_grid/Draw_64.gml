/// @description Insert description here
// You can write your code in this editor
draw_text(200,15,string("M x: {0}",mouse_x));
draw_text(200,0,string("M y: {0}",mouse_y));

var _mx = (mouse_x - v_offset_x);
var _my = (mouse_y - v_offset_y);
var _tile_x = floor((_my + (_mx/2))/16);
var _tile_y = floor((_my - (_mx/2))/16);

if(_tile_x >= 0 && _tile_y >= 0 && _tile_y < v_size_y && _tile_x < v_size_x){
	draw_text(200,45,string("G x: {0}",_tile_x));
	draw_text(200,30,string("G y: {0}",_tile_y));
}