
v_camera_y += (keyboard_check(vk_down) - keyboard_check(vk_up))*4;
v_camera_x += (keyboard_check(vk_right) - keyboard_check(vk_left))*4;

camera_set_view_pos(view_camera[0], v_camera_x, v_camera_y);