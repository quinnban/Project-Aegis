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

function place_grid_objects(){
var TILE_WIDTH = 32;
var TILE_WIDTH_HALF = 16;

	for(i =0; i < 2; i++ ;) {
		var _offset = 0;
		for(j =0; j < 3; j++ ;) {
			_offset += 8;
			var _x = ((j - i) * TILE_WIDTH_HALF);
			var _y = ((j +i) * TILE_WIDTH_HALF);
			instance_create_depth(_x+150,_y+150,j,obj_grid_square);
		}
	}
}

function place_grid_objects_1(){
var TILE_WIDTH = 32;
var TILE_WIDTH_HALF = 16;
	for(i =0; i < 5; i++ ;) {
		var _offset = 100 - (i*10);
		for(j =0; j < 5; j++ ;) {
			_offset -= 10 ;
			var _x = (j * 16) + (i * - 16);
			var _y = (j * 8) +  (i * 8);
			instance_create_depth(_x+150,_y+150,_offset,obj_grid_square);
		}
	}
}
		

