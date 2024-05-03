/// @function					calculate_pixel_x(_tile_x,_tile_y,_tile_width,_offset_x)
/// @param {real}  _tile_x		x on grid
/// @param {real}  _tile_y		y on grid
/// @param {real}  _tile_width	Sprite width
/// @param {real}  _offset_x	starting x offset in pixels
/// @description				Calculate the x in pixels given a grid [x,y] and offset
function calculate_pixel_x(_tile_x,_tile_y,_tile_width,_offset_x){
	// x= x*0.5w + y*-0.5w
	return ((_tile_x * (_tile_width*0.5)) + (_tile_y * - (_tile_width * 0.5))) + _offset_x;
}

/// @function					calculate_pixel_y(_tile_x,_tile_y,_tile_height,_offset_y)
/// @param {real}  _tile_x		x on grid
/// @param {real}  _tile_y		y on grid
/// @param {real}  _tile_height	Sprite height
/// @param {real}  _offset_y	starting y offset in pixels
/// @description				Calculate the y in pixels given a grid [x,y] and offset
function calculate_pixel_y(_tile_x,_tile_y,_tile_height,_offset_y){
	// y = x*0.25h + y*0.25h
	return  ((_tile_x * (_tile_height * 0.25)) + (_tile_y * (_tile_height * 0.25))) + _offset_y ;
}

/// @function					calculate_tile_x_floor(_pixel_x,_pixel_y,_offset_y,_offset_x)
/// @param {real}  _pixel_x		x on grid
/// @param {real}  _pixel_y		y on grid
/// @param {real}  _offset_y	starting y offset in pixels
/// @param {real}  _offset_x	starting x offset in pixels
/// @description				Calculate the rounded down x on grid  given and [x,y] in pixels
function calculate_tile_x_floor(_pixel_x,_pixel_y,_offset_y,_offset_x){
	return floor(calculate_tile_x(_pixel_x,_pixel_y,_offset_y,_offset_x));
}

/// @function					calculate_tile_y_floor(_pixel_x,_pixel_y,_offset_y,_offset_x)
/// @param {real}  _pixel_x		x on grid
/// @param {real}  _pixel_y		y on grid
/// @param {real}  _offset_y	starting y offset in pixels
/// @param {real}  _offset_x	starting x offset in pixels
/// @description				Calculate the rounded down y on grid  given and [x,y] in pixels
function calculate_tile_y_floor(_pixel_x,_pixel_y,_offset_y,_offset_x){
	return floor(calculate_tile_y(_pixel_x,_pixel_y,_offset_y,_offset_x));
}

/// @function					calculate_tile_x(_pixel_x,_pixel_y,_offset_y,_offset_x)
/// @param {real}  _pixel_x		x on grid
/// @param {real}  _pixel_y		y on grid
/// @param {real}  _offset_y	starting y offset in pixels
/// @param {real}  _offset_x	starting x offset in pixels
/// @description				Calculate the x on grid  given and [x,y] in pixels
function calculate_tile_x(_pixel_x,_pixel_y,_offset_y,_offset_x){
	//(deltaY + deltaX/2)/16 I dont remember if 16 is 0.5h or 0.5w
	return ((_pixel_y - _offset_y) + ((_pixel_x - _offset_x)/2))/16;
}

/// @function					calculate_tile_y(_pixel_x,_pixel_y,_v_offset_y,_v_offset_x)
/// @param {real}  _pixel_x		x on grid
/// @param {real}  _pixel_y		y on grid
/// @param {real}  _offset_y	starting y offset in pixels
/// @param {real}  _offset_x	starting x offset in pixels
/// @description				Calculate the y on grid  given and [x,y] in pixels
function calculate_tile_y(_pixel_x,_pixel_y,_v_offset_y,_v_offset_x){
	//(deltaY - deltaX/2)/16 I dont remember if 16 is 0.5h or 0.5w
	return ((_pixel_y - _v_offset_y) - ((_pixel_x - _v_offset_x)/2))/16;
}

/// @function				calculate_index_of_tile(_x,_y,_size_x)
/// @param {real}  _x		x on grid
/// @param {real}  _y		y on grid
/// @param {real}  _size_x	size of grid in x direction
/// @description			Calculate the index of tile base on 1D array
function calculate_index_of_tile(_x,_y,_size_x){
	return _y * _size_x + _x; 
}


