
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