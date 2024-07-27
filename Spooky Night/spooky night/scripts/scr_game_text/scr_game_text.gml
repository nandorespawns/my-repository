/// #param text_id
function scr_game_text(_text_id){

switch(_text_id){
	
	case "decor 0":
		scr_text("");
			
		break;
		
	
	case "closet":
	
		scr_text("");
		scr_text("hi im closet 1");
		scr_text("more text haha more text haha");
		scr_text("ligma bals??? ligma??");
			scr_option("Yeah", "closet - yes");
			
			scr_option("nah", "closet - no");
		
		break;
			case "closet - yes":
				scr_text("okay ligem up brah"); 
				item_add(global.item_list.key);
				global.key_state[0] = true;
				show_debug_message(global.key_state[0]);
			//make it so i cannot get infinit key
			// think pre key state, post key state
				break;
				
			case "closet - no":
				scr_text("mann what the hell mann what the hell");
				break;
				
	case "closet post key":
		scr_text("");
		scr_text("leave som ligma bal for the rest of us");
		break;
	
	case "decor 1":
		scr_text("");
		scr_text("nothing interesting");
		break;
	
	
	
	}

}