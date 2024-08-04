depth = -9999;

global.font = font_add_sprite(spr_main_font, 32, true, 1);


width = 256;
height = 58;

op_border = 8;
op_border_top_side = 36;
op_space_y = 16;
op_space_x = 90;

pos = 0; 
selected_item = 0;



//item constructor
function create_item(_name, _desc, _spr, _effect) constructor
	{
		
	name = _name;
	description = _desc;
	sprite = _spr;
	effect = _effect;
	
	
	}




//create the items
global.item_list = 
{


	key : new create_item(
	"Key", 
	"skibidi L rizz W rizz gyatt holy moley holey mooly",
	spr_key,
	
	function ()
	{
		
		var _used = false;
		
		if instance_exists(obj_gate)
		{
			
			with(obj_gate)
			{
			if distance_to_object(obj_player) < 20 
				{
				instance_destroy();
				_used = true;
				};	
			}
		
		}
		
		
		//get rid of the item
		if _used == true
		{
		array_delete(inv, selected_item, 1);
		}
		
	}
	
	
	
	),
	
	
	goldkey : new create_item(
	"Gold Key",
	"opens gold gate",
	spr_goldkey,
	
	
	),
	
	
	
	
	

}







//create the inventory
inv = array_create(0);

selected_item = -1;


//for drawing and mouse position
sep = 16;

//for making the menu appear and stay on screen
global.draw_inv = false;

//check state of keys
global.key_state = array_create(1);
white_key = false;
gold_key = false;
array_push(global.key_state, white_key, gold_key);

//scrolling stuff
scroll_offset = 0; //Index of the first item to display
max_visible_items = 0;
//animating the arrows
image_index_up = 0;
image_index_down = 0;

