
var _x = calculate_pixel_x(v_tile_x,v_tile_y,sprite_width,v_offset_x);
var _y = calculate_pixel_y(v_tile_x,v_tile_y,sprite_height,v_offset_y);

if(v_tile_x <5 && v_tile_y <5){
	v_tile_z = 1;
}


if((v_tile_x >=6  && v_tile_y >=6) &&(v_tile_x <=10 && v_tile_y <= 10)){
	v_tile_z = -1;
	sprite_index = s_grid_box_water;
}

_y-= v_tile_z * 8 ;
x=_x;
y=_y;