/// @description Insert description here
// You can write your code in this editor
v_list_obj_tiles = ds_list_create();
var _sprite = object_get_sprite(obj_grid_square);
place_grid_objects(v_offset_y,v_offset_x,sprite_get_height(_sprite),sprite_get_width(_sprite));
