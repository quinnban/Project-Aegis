// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// @function draw_grid();
function draw_grid(){
	var _width = 2;
	draw_set_color(c_white);

	for(var _y = 0; _y < room_height; _y+=32;){
		// mx2 = y2 - y1 + mx1
		var _end_x = room_width - _y + 0;
		// cords start from top left not bottom left
		var _start_y = (room_height-_y);
		draw_line_width(0,_start_y,_end_x,0,_width);
		draw_line_width(room_width,_y,_y,room_height,_width);
	}
	
	
	for(var _x = 0; _x < room_width; _x+=32;) {
		var _end_y = room_width - _x + 0;
		var _end_x = room_height - _x;
		draw_line_width(_x,0,room_width,_end_y,_width);
		draw_line_width(0,_x,(room_height - _x),room_height,_width);
	}
}
