/// @description Insert description here
// You can write your code in this editor
if(v_state = PLAYER_STATE.IDLE){
	v_state = PLAYER_STATE.CHOOSING_MOVE;
	var _instance = obj_controller_grid;
	hightlight_tiles_in__movement_range(_instance);
} else {
	v_state = PLAYER_STATE.IDLE;
	var _instance = obj_controller_grid;
	unhightlight_tiles_in__movement_range(_instance);
}