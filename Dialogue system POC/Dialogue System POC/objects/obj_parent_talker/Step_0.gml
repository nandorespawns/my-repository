if (place_meeting(x,y, obj_player)) {
	//if i havent already created my textbox, make one:
	if (keyboard_check_pressed(vk_space)) {
		if (myTextbox == noone) {
		myTextbox = instance_create_layer(x,y, "Text", obj_textbox);
		myTextbox.text = myText;
		myTextbox.creator = self;
		myTextbox.name = myName;
		}
	}
} else {
	if (myTextbox != noone) {
	instance_destroy(myTextbox);
	myTextbox = noone;
	}
}