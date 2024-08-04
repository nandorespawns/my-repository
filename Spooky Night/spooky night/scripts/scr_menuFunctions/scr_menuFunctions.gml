
function menu(_x,_y, _options, _description = -1)
{
	
	with (instance_create_depth(_x, _y, -9999, obj_menu))
	{
		options = _options;
		description = _description;
		optionCount = array_length(_options)
		hovermarker = "* ";
		
		//set up size
		
		margin = 8;
		draw_set_font(global.font_main);
		
		width = 1;
		if (_description != -1) width = max(width,string_width(_description));
		for (var i = 0; i < optionCount; i++)
		{
			width = max(width, string_width(_options[i][0]));	
		}
		width += string_width(hovermarker);
		
		heightLine = 17;
		height = heightLine * (optionCount + !(description == -1));
		
		widthFull = width + margin * 2;
		heightFull = height + margin * 2;
		
		
		
		
		
	}
	
	
}






//this code makes it so items will appear in the menu and will not draw outside of its boundaries
//if (_item_y >= _menu_y && _item_y <= _menu_y + _menu_height - _sep) {
	//	//icon
	//	draw_sprite(inv[i].sprite, 0, _xx, _item_y);
		
	//	//get selected color
	//	if selected_item == i {_col = c_yellow; };
	//	draw_set_color(_col);
	
	//	//name
	//	draw_text(_xx + 16, _yy + _sep*i, inv[i].name );

	//	//description
	//	//if selected_item == i{
	//	//draw_text_ext( _xx, _yy + _sep*array_length(inv), inv[i].description, 12, 80);
	//	//}

	//	//reset back to white
	//	draw_set_color(c_white);
	//}