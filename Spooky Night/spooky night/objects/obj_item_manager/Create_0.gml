depth = -9999;

global.font = font_add_sprite(spr_main_font, 32, true, 1);

//item constructor
function create_item(_name, _desc, _spr) constructor
	{
		
	name = _name;
	description = _desc;
	sprite = _spr;
	
	
	
	}




//create the items
global.item_list = 
{


	key : new create_item(
	"Key", 
	"opens gates",
	spr_key
	),
	
	
	goldkey : new create_item(
	"Gold Key",
	"opens gold gate",
	spr_goldkey
	),
	
	
	
	
	

}







//create the inventory
inv = array_create(0);

selected_item = -1;


//for drawing and mouse position
sep = 16;


