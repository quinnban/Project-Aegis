/// @description Insert description here
// You can write your code in this editor
enum PLAYER_STATE {
	MOVING,IDLE,CHOOSING_MOVE
}

v_state = PLAYER_STATE.IDLE;
image_speed = 0.25;

v_target_cord = new Coordinate(-1,-1,-1); 
v_next_cord = new Coordinate(-1,-1,-1) ;

x=v_current_cord.PixelX();
y=v_current_cord.PixelY()-8;