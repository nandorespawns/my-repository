
if interactable == true{
if (
	instance_place(x + 0, y + 5, obj_player) && 
	keyboard_check_pressed(vk_space) && 
	!instance_exists(obj_text_box) && 
	obj_player.able_to_textbox = true
	)
{
	
	create_textbox(text_id);	
}
}
	

	
if text_change == true {
	
	if global.key_state[0] == true{
		text_id = text_id2
	}
		
}



