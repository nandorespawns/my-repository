

hover += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);

if (hover > optionCount-1) hover = 0;
if (hover <0) hover = optionCount-1;

if (keyboard_check_pressed(vk_enter))
{
	if (array_length(options[hover]) == 2)
	{
		var _func = options[hover][1];
		if (_func != -1 ) _func();
		
	}
	instance_destroy();
	
}



