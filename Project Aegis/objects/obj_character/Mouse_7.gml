/// @description Insert description here
// You can write your code in this editor
if(v_state = PLAYER_STATE.IDLE){
	v_state = PLAYER_STATE.CHOOSING_MOVE;
	var _instance = obj_controller_grid;
	with(_instance){
	 event_perform(ev_other, ev_user0)
	}
} else {
	v_state = PLAYER_STATE.IDLE;
	var _instance = obj_controller_grid;
	with(_instance){
	 event_perform(ev_other, ev_user1)
	}
}