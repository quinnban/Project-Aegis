/// @description Insert description here
// You can write your code in this editor
enum PLAYER_STATE {
	MOVING,IDLE,CHOOSING_MOVE
}

v_state = PLAYER_STATE.IDLE;
image_speed = 0.25;

var _x = calculate_pixel_x(v_tile_x,v_tile_y,sprite_height,sprite_width);
var _y = calculate_pixel_y(v_tile_x,v_tile_y,sprite_height,sprite_width);

_y-= v_tile_z * 8 ;
x=_x;
y=_y;