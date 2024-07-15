//if place_meeting(x, y, obj_player) && keyboard_check_pressed(vk_space){
//	create_textbox(text_id);
//}

//if position_meeting(mouse_x, mouse_y, id) && mouse_check_button_pressed(mb_left)
//	{
//		create_textbox(text_id);
//	}

if instance_place(x + 0, y + 5, obj_player) && keyboard_check_pressed(vk_space) && !instance_exists(obj_text_box)
{
	
	create_textbox(text_id);	
}