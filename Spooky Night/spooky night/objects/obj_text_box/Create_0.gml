depth = -9999;

//textbox parameters

textbox_width = 223;
textbox_height = 40;
border = 8;
line_sep = 12;
line_width = textbox_width - border*2;
txtb_spr = spr_text_box;
txtb_img = 0;
txtb_img_spd = 1/30;




//the text

page = 0;
page_number = 0;
text[0] = "this is a closet how exciting wow";
text[1] = "dude this is a closet isnt this fucking amazing";
text[2] = "short";
text[3] = "the quick brown fox jumped over the laxy dog and shot him in his hind legs";

text_length[0] = string_length(text[0]);
draw_char = 0;
text_spd = 1;

setup = false; 