global.offset_x = v_offset_x;
global.offset_y = v_offset_y;
global.size_y = v_size_y;
global.size_x = v_size_x;
var _sprite = object_get_sprite(obj_grid_square);
global.tile_width = sprite_get_height(_sprite);
global.tile_height = sprite_get_height(_sprite);

v_tile_array = [];
place_grid_objects();

var _char = instance_create_depth(0,0,-100,obj_character_base,{
	v_current_cord : new Coordinate(0,0,1) 
});
