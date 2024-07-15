/// #param text_id
function scr_game_text(_text_id){

switch(_text_id){
	
	case "npc 0":
		scr_text("");
		scr_text("...");
		scr_text("....");
		scr_text("fok");
			
		break;
		
	
	case "npc 1":
		scr_text("");
		scr_text("hi im closet 1");
		scr_text("more text haha more text haha");
		scr_text("ligma bals??? ligma??");
			scr_option("Yeah", "npc 1 - yes");
			scr_option("nah", "npc 1 - no");
		
		break;
			case "npc 1 - yes":
				scr_text("okay ligem up brah");
				break;
				
			case "npc 1 - no":
				scr_text("mann what the hell mann what the hell");
				break;
	
	
	}

}