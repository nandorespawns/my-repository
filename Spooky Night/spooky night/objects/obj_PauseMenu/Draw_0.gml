


//dynamically get width and height of menu
draw_set_font(global.font_main);

if room != rm_title_screen {


if global.menu_open {
	global.draw_pause_menu = ! global.draw_pause_menu;
	show_debug_message(global.draw_pause_menu);
}

if global.draw_pause_menu == true 
{


var _new_w = 0;
for (var i = 0; i < op_length; i++)
	{
		var _op_w = string_width(option[menu_level, i]);
		_new_w = max(_new_w, _op_w);
	}
width = 270;
height = 28;

//center menu
x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 - width/2;
y = camera_get_view_y(view_camera[0]) + 20;



//draw menu background

draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1);


//draw the options

draw_set_valign(fa_top);
draw_set_halign(fa_left);

for (var i = 0; i < op_length; i++)
	{
		var _c= c_white;
		if pos == i {_c = c_yellow};
		draw_text_color(x + op_border_top_side + op_space_x * i, y + op_border , option[menu_level, i], _c, _c, _c, _c, 1);
	}


}else {pos = 0;} 

}


