/// @description Insert description here
// You can write your code in this editor



var _x = calculate_pixel_x(v_tile_x,v_tile_y,sprite_height,sprite_width);
var _y = calculate_pixel_y(v_tile_x,v_tile_y,sprite_height,sprite_width);

//if(v_tile_x <=5 && v_tile_y <=5){
//	v_tile_z = 1;
//}

_y-= v_tile_z * 8 ;
x=_x;
y=_y;