// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Coordinate(_x, _y,_z) constructor {
	x = _x;
	y = _y;
	z = _z;
	
	static PixelX = function()
    {
       return calculate_pixel_x(x,y);
    }
	
	static PixelY = function()
    {
       return calculate_pixel_y(x,y,z);
    }
}