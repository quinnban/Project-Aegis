/// @function                 isometricToPixelCoordinates(x, y);
/// @param {x}  _x						Isometric x coordinate
/// @param {y}  _y						Isometric y coordinate
/// @description              Convert from Isometric coordinates to Pixel Coordinates

function isometric_to_pixel_coordinates(_x, _y){
	var _coordinates
	 _coordinates[0] = (0.5 * _x) - _y;
	 _coordinates[1] = (0.5 * _x) + _y;
	return _coordinates;
}

function pixel_coordinates_to_isometric(_x, _y){
	var _coordinates
	 _coordinates[0] = _x + (_y*-1);
	 _coordinates[1] = -0.5 * ((_y*-1) - _x);
	return _coordinates;
}