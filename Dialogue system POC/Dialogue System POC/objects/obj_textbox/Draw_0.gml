//draw textbox
draw_sprite(spr_box, 0, x, y);

//set font
draw_set_font (fnt_text);

//increment character counter every frame
if (charCount < string_length(text[page])){ 
charCount +=0.5;
}

//copy part of the text
textPart = string_copy(text[page], 1, charCount); 

//draw the name
draw_set_color(c_yellow);
draw_set_halign(fa_center);
draw_text(x + (boxWidth/2),y + yBuffer, name);
draw_set_halign(fa_left);


//draw part of the text
draw_set_color(c_white);
draw_text_ext(x + xBuffer, y+stringHeight + yBuffer, textPart, stringHeight, boxWidth - (2*xBuffer));




