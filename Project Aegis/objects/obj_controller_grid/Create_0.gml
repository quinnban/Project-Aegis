v_list_obj_tiles = ds_list_create();
var _sprite = object_get_sprite(obj_grid_square);
place_grid_objects(v_size_x,v_size_y,sprite_get_height(_sprite),sprite_get_width(_sprite));
var _char = instance_create_depth(0,0,-100,obj_character_base,{
	v_tile_x:0,
	v_tile_y:0,
	v_tile_z:1,
	v_offset_x:v_offset_x,
	v_offset_y:v_offset_y
});
