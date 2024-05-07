
if(v_current_cord.x <=5 && v_current_cord.y <=5){
	v_current_cord.z = 1;
}


if((v_current_cord.x >=6  && v_current_cord.y >=6) && (v_current_cord.x <=10 && v_current_cord.y <= 10)){
	v_current_cord.z = -1;
	sprite_index = spr_grid_box_water;
}

x= v_current_cord.PixelX();
y= v_current_cord.PixelY();