//get inputs
if global.draw_pause_menu == true 
{

if menu_movement = 1 {
left_key = keyboard_check_pressed(vk_left);
right_key = keyboard_check_pressed(vk_right);
accept_key = keyboard_check_pressed(vk_space);


//store number of options in current menu
op_length = array_length(option[menu_level])

//move through the menu

pos += right_key - left_key;
if pos >= op_length {pos = 0};
if pos < 0 {pos = op_length - 1};

//using the options

if accept_key
{
	var _sml = menu_level;
	
switch(menu_level)
	{
		
	//item menu
	case 0:
	switch(pos)
		{
		//open inv
		case 0:	
				global.draw_inv = ! global.draw_inv;
				show_debug_message(global.draw_inv);
				if (global.draw_inv == true) {menu_movement = 0;}
		break; 
		//settings
		case 1: menu_level = 1; break;
		//quit game
		case 2: game_end(); break;
		} 
	break;
	
	//settings menu
	case 1:
		switch(pos)
		{
			//window size
			case 0: break;
			//brightness
			case 1: break;
			//controls
			case 2: break;
			
		}
	}
	
	//sets position back
	if _sml != menu_level {pos = 0};
	
	//correct option length
	op_length = array_length(option[menu_level])
}

}
}