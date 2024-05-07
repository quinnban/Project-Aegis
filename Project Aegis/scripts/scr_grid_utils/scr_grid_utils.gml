/// @function					calculate_pixel_x(_tile_x,_tile_y)
/// @param {real}  _tile_x		x on grid
/// @param {real}  _tile_y		y on grid
/// @description				Calculate the x in pixels given a grid [x,y] 
function calculate_pixel_x(_tile_x,_tile_y){
	// x= x*0.5w + y*-0.5w
	return ((_tile_x * (global.tile_width*0.5)) + (_tile_y * - (global.tile_width * 0.5))) + global.offset_x;
}

/// @function					calculate_pixel_y(_tile_x,_tile_y)
/// @param {real}  _tile_x		x on grid
/// @param {real}  _tile_y		y on grid
/// @param {real}  _tile_z		z on grid
/// @description				Calculate the y in pixels given a grid [x,y]
function calculate_pixel_y(_tile_x,_tile_y,_tile_z){
	// y = x*0.25h + y*0.25h - z*0.25h
	return  ((_tile_x * (global.tile_height * 0.25)) + (_tile_y * (global.tile_height * 0.25))) - (_tile_z * (global.tile_height * 0.25)) + global.offset_y ;
}

/// @function					calculate_tile_x_floor(_pixel_x,_pixel_y)
/// @param {real}  _pixel_x		x on grid
/// @param {real}  _pixel_y		y on grid
/// @description				Calculate the rounded down x on grid  given and [x,y] in pixels
function calculate_tile_x_floor(_pixel_x,_pixel_y){
	return floor(calculate_tile_x(_pixel_x,_pixel_y));
}

/// @function					calculate_tile_y_floor(_pixel_x,_pixel_y)
/// @param {real}  _pixel_x		x on grid
/// @param {real}  _pixel_y		y on grid
/// @description				Calculate the rounded down y on grid  given and [x,y] in pixels
function calculate_tile_y_floor(_pixel_x,_pixel_y){
	return floor(calculate_tile_y(_pixel_x,_pixel_y));
}

/// @function					calculate_tile_x(_pixel_x,_pixel_y)
/// @param {real}  _pixel_x		x on grid
/// @param {real}  _pixel_y		y on grid
/// @description				Calculate the x on grid  given and [x,y] in pixels
function calculate_tile_x(_pixel_x,_pixel_y){
	//(deltaY + deltaX/2)/16 I dont remember if 16 is 0.5h or 0.5w
	return ((_pixel_y - global.offset_y) + ((_pixel_x - global.offset_x)/2))/16;
}

/// @function					calculate_tile_y(_pixel_x,_pixel_y)
/// @param {real}  _pixel_x		x on grid
/// @param {real}  _pixel_y		y on grid
/// @description				Calculate the y on grid  given and [x,y] in pixels
function calculate_tile_y(_pixel_x,_pixel_y){
	//(deltaY - deltaX/2)/16 I dont remember if 16 is 0.5h or 0.5w
	return ((_pixel_y - global.offset_y) - ((_pixel_x - global.offset_x)/2))/16;
}

/// @function				calculate_index_of_tile(_x,_y)
/// @param {real}  _x		x on grid
/// @param {real}  _y		y on grid
/// @description			Calculate the index of tile base on 1D array
function calculate_index_of_tile(_x,_y){
	return _y * global.size_x + _x; 
}


