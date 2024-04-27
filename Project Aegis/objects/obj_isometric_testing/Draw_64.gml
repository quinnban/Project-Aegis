
//Pixel coordinates drawing 
//draw_set_color(c_white);
//draw_rectangle(valueX, valueY, valueX*2, valueY*2, true);

//Isometric drawing 

var _coordinates1 = pixel_coordinates_to_isometric(valueX, valueY)
var _coordinates2 = pixel_coordinates_to_isometric(valueX, valueY-160)
var _coordinates3 = pixel_coordinates_to_isometric(valueX+160, valueY-160)
var _coordinates4 = pixel_coordinates_to_isometric(valueX+160, valueY)


draw_set_color(c_lime);
draw_line(_coordinates1[0], _coordinates1[1], _coordinates2[0], _coordinates2[1]);
draw_set_color(c_gray);
draw_line(_coordinates2[0], _coordinates2[1], _coordinates3[0], _coordinates3[1]);
draw_set_color(c_green);
draw_line(_coordinates3[0], _coordinates3[1], _coordinates4[0], _coordinates4[1]);
draw_set_color(c_silver);
draw_line(_coordinates4[0], _coordinates4[1], _coordinates1[0], _coordinates1[1]);


draw_set_color(c_white);
draw_text(160, 224, string_concat("x1: ", _coordinates1[0], " y1: ", _coordinates1[1], " x2: ", _coordinates2[0], " y2: ", _coordinates2[1]));
draw_text(160, 256, string_concat("x2: ", _coordinates2[0], " y2: ", _coordinates2[1], " x3: ", _coordinates3[0], " y3: ", _coordinates3[1]));
draw_text(160, 288, string_concat("x3: ", _coordinates3[0], " y3: ", _coordinates3[1], " x4: ", _coordinates4[0], " y4: ", _coordinates4[1]));
draw_text(160, 320, string_concat("x4: ", _coordinates4[0], " y4: ", _coordinates4[1], " x1: ", _coordinates1[0], " y1: ", _coordinates1[1]));
