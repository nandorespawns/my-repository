draw_set_font(global.font);
//makes it so the inventory wont open if player somehow goes back to main menu
if room != rm_title_screen {
	


if global.draw_inv == true && global.draw_pause_menu == true
{
	

//menu dimensinos
var _menu_width = width;
var _menu_height = height;
var _menu_x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 - width/2;
var _menu_y = camera_get_view_y(view_camera[0]) + 150;
var _sep = sep; //Space between items
max_visible_items = floor(_menu_height / _sep); // Calculate visible items dynamically
//draw menu background
draw_sprite_ext(sprite_index, image_index, _menu_x, _menu_y, _menu_width/sprite_width, _menu_height/sprite_height, 0, c_white, 1);


//item Stuff below

for (var i = scroll_offset; i < min(array_length(inv), scroll_offset + max_visible_items); i++)
{
	var _xx = _menu_x + 15; //Offset from menu x
	var _yy = _menu_y + 10; //Offset from menu y
	var _col = c_white; //Default color



	//Calculate item position
	var _item_y = _yy + _sep * (i - scroll_offset);
	
	
	// Icon
    draw_sprite(inv[i].sprite, 0, _xx, _item_y);

    // Get selected color
    if (selected_item == i) {
        _col = c_yellow;
    }
    draw_set_color(_col);

    // Name
    draw_text(_xx + 16, _item_y, inv[i].name);

    // Description (only if selected)
    if (selected_item == i){ 
		var _desc_text = inv[i].description;
        draw_text_ext(160, _yy, _desc_text, 12, 80);
    }

    // Reset back to white
    draw_set_color(c_white);

}

//drawing scrolling indicators
if (scroll_offset > 0) {
	//draw up arrow
	draw_sprite(spr_menu_arrow_up, image_index_up, 90, 160);
	
	//advance to the next frame
	image_index_up += 0.08; 
	if (image_index_up >= sprite_get_number(spr_menu_arrow_up)) {
		image_index_up = 0;		
	}
	
}
if (scroll_offset < array_length(inv) - max_visible_items) {
	//draw down arrow
	draw_sprite(spr_menu_arrow_down, image_index_down, 90, 195);
	
	//advance to the next frame
	image_index_down += 0.08; 
	if (image_index_down >= sprite_get_number(spr_menu_arrow_down)) {
		image_index_down = 0;		
	}
}






} else {global.draw_inv = false; obj_PauseMenu.menu_movement = 1;}

}