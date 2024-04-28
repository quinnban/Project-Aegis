// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// @function draw_grid();
function draw_grid(){
	var _width = 1;
	draw_set_color(c_white);
	draw_set_alpha(0.5);

	for(var _y = 0; _y < room_height; _y+=62;){
		// mx2 = y2 - y1 + mx1
		var _end_x = room_width - _y + 0;
		// cords start from top left not bottom left
		var _start_y = (room_height-_y);
		draw_line_width(0,_start_y,_end_x,0,_width);
		draw_line_width(room_width,_y,_y,room_height,_width);
	}
	
	
	for(var _x = 0; _x < room_width; _x+=62;) {
		var _end_y = room_width - _x + 0;
		var _end_x = room_height - _x;
		draw_line_width(_x,0,room_width,_end_y,_width);
		draw_line_width(0,_x,(room_height - _x),room_height,_width);
	}
}

function place_grid_objects(_offset_y,_offset_x,_tile_height,_tile_width){
	for(i =0; i < 5; i++ ;) {
		var _layer = 100 - (i*10);
		for(j =0; j < 5; j++ ;) {
			_layer -= 10 ;
			// x= x*0.5w + y*-0.5w
			// y = x*0.25h + y*0.25h
			var _x = (j * (_tile_width*0.5)) + (i * - (_tile_width * 0.5));
			var _y = (j * (_tile_height * 0.25)) +  (i * (_tile_height * 0.25));
			var _obj_id = instance_create_depth(_x+_offset_x,_y+_offset_y,_layer,obj_grid_square);
			ds_list_add(v_list_obj_tiles,_obj_id);
		}
	}
}

function mouse_x_y_to_grid_x_y(_x,_y){
	//stackoverflow matries math here only works for 32x32
	var _tile_x = floor((1/512) * ((_x * 16) + (_y * 16) - (150 * 16)));
	var _tile_y = floor((1/512) * ((_x * 16) + (_y * 16) + (150 * 16)));
	return [_tile_x,_tile_y];
}
		

