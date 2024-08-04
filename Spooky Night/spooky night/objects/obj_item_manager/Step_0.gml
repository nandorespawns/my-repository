if room != rm_title_screen {
	


if global.draw_inv == true && global.draw_pause_menu == true
{
	
max_visible_items = floor(height / sep); //maximum number of visible items in the menu


//get selected item
if (array_length(inv) > 0){
	if (keyboard_check_pressed(vk_up)){
		if (selected_item > 0) {
			selected_item--;
		}
	} else if (keyboard_check_pressed(vk_down)){
		if (selected_item < array_length(inv) - 1) {
			selected_item++;
		}
	} 

// ensure selection is within bounds
	if (selected_item < 0) {
			selected_item = 0;	
	} else if (selected_item >= array_length(inv)) {
			selected_item = array_length(inv) - 1;	
	}
	
	//Scrolling up
	if (keyboard_check_pressed(vk_up) && scroll_offset > 0) {
		scroll_offset--;
	}
	//scrolling down
	if (keyboard_check_pressed(vk_down) && scroll_offset < array_length(inv) - max_visible_items){
		scroll_offset++;	
	}

}

} else {selected_item = 0;}

}
