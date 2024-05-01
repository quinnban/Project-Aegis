/// @description Insert description here
// You can write your code in this editor
v_list_obj_tiles = ds_list_create();
var _sprite = object_get_sprite(obj_grid_square);
place_grid_objects(v_size_x,v_size_y,sprite_get_height(_sprite),sprite_get_width(_sprite));
//instance_create_depth(v_offset_x+16,v_offset_y+8,-100,obj_character);
var _char = instance_create_depth(0,0,-100,obj_character,{
	v_tile_x:10,
	v_tile_y:10,
	v_tile_z:0,
	v_offset_x:v_offset_x,
	v_offset_y:v_offset_y
});

var _cha1r = instance_create_depth(0,0,-100,obj_character,{
	v_tile_x:30,
	v_tile_y:10,
	v_tile_z:0,
	v_offset_x:v_offset_x,
	v_offset_y:v_offset_y
});
//layer_add_instance("instances",_char);

enum DIRECTION {UP,DOWN,LEFT,RIGHT,NONE}