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

function place_grid_objects(_size_x,_size_y,_offset_y,_offset_x,_tile_height,_tile_width){
	for(i =0; i < _size_y; i++ ;) {
		var _layer = (_size_x*_size_y) - (i*_size_x);
		for(j =0; j < _size_x; j++ ;) {
			_layer -= 1 ;
			// x= x*0.5w + y*-0.5w
			// y = x*0.25h + y*0.25h
			var _x = (j * (_tile_width*0.5)) + (i * - (_tile_width * 0.5));
			var _y = (j * (_tile_height * 0.25)) +  (i * (_tile_height * 0.25));
			var _obj_id = instance_create_depth(_x+_offset_x,_y+_offset_y,_layer,obj_grid_square);
			ds_list_add(v_list_obj_tiles,_obj_id);
		}
	}
}

function calculate_tile_x(_pixel_x,_pixel_y){
	return  floor(((_pixel_y -v_offset_y) + ((_pixel_x - v_offset_x)/2))/16);
}

function calculate_tile_y(_pixel_x,_pixel_y){
	return  floor(((_pixel_y -v_offset_y) - ((_pixel_x - v_offset_x)/2))/16);
}
		

