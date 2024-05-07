/// @description Insert description here
// You can write your code in this editor
draw_self();
var _grid = obj_controller_grid;

if(v_state == PLAYER_STATE.CHOOSING_MOVE){
	//mouse tile
	var _tile_cords = get_x_y_mouse_selected(_grid);
	var _tile_x = _tile_cords[0];
	var _tile_y = _tile_cords[1];
	var _distance = abs(_tile_x - v_current_cord.x) + abs(_tile_y - v_current_cord.y);
	var _check1 = _tile_x == v_current_cord.x && _tile_y == v_current_cord.y;
	var _check2 = _tile_x >= 0 && _tile_y >= 0 && _tile_y < global.size_y && _tile_x < global.size_x;
	var _check3 = _distance <= v_movement_speed;
	
	if(!_check1 && _check2 && _check3){
		if(mouse_check_button_released(mb_any)){
			var _index =calculate_index_of_tile(_tile_x,_tile_y);
			var _obj = _grid.v_tile_array[_index];
			v_target_cord = new Coordinate(_obj.v_current_cord.x,_obj.v_current_cord.y,_obj.v_current_cord.z); 
			unhightlight_tiles_in_movement_range(_grid);
			v_state = PLAYER_STATE.IDLE;
		}
	}	
}


if(v_target_cord.x > -1 && v_target_cord.y > -1){
	if(v_state == PLAYER_STATE.IDLE){
		var _next_tile = find_next_tile_to_move_object_to_x_y(_grid);
		if(_next_tile != undefined) {
			v_next_cord = new Coordinate(_next_tile.v_current_cord.x,_next_tile.v_current_cord.y,_next_tile.v_current_cord.z);
			v_state = PLAYER_STATE.MOVING;
		} else {
			delete v_next_cord;
			delete v_target_cord;
			v_target_cord = new Coordinate(-1,-1,-1); 
			v_next_cord = new Coordinate(-1,-1,-1); 
		}
	}
	
	if(v_state == PLAYER_STATE.MOVING){
		var _pixel_x = v_target_cord.PixelX();
		//the 8 have something to do with the sprite orgin
		var _pixel_y = v_target_cord.PixelY()-8;
		var _dir = point_direction(x,y,_pixel_x,_pixel_y);
		if(point_distance(x,y,_pixel_x,_pixel_y) > 1){
			change_sprite_imagine_moving(_dir);
			x+=lengthdir_x(2,_dir)
			y+=lengthdir_y(2,_dir)
		} else {
			image_xscale =1;
			v_current_cord = new Coordinate(v_next_cord.x,v_next_cord.y,v_next_cord.z); 
			v_state = PLAYER_STATE.IDLE;
			sprite_index = spr_char_base;
		}
	}
}