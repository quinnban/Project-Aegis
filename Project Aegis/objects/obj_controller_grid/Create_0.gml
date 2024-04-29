/// @description Insert description here
// You can write your code in this editor
v_list_obj_tiles = ds_list_create();
var _sprite = object_get_sprite(obj_grid_square);
place_grid_objects(v_size_x,v_size_y,v_offset_y,v_offset_x,sprite_get_height(_sprite),sprite_get_width(_sprite));
instance_create_depth(v_offset_x,v_offset_y,-100,obj_character);

enum DIRECTION {UP,DOWN,LEFT,RIGHT,NONE}