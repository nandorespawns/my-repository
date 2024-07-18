//room saving
function save_room()
{
	
	var _itemNum = instance_number(obj_item_overworld);
	var _gateNum = instance_number(obj_gate);
	
	var _roomStruct = 
	{
		
		itemNum : _itemNum,
		itemData : array_create(_itemNum),
		
		
		gateNum : _gateNum,
		gateData : array_create(_gateNum),
	
	}
	
	//Get the data from the different saveable objects
		
		//item
		for (var i = 0; i < _itemNum; i++)
		{
			
			var _inst = instance_find(obj_item_overworld, i);
			
			_roomStruct.itemData[i] =
				{
					
				x : _inst.x,
				y : _inst.y,
				item : _inst.item,
				
				}
		}
		
		//gates
		for (var i = 0; i < _gateNum; i++)
		{
			var _inst = instance_find(obj_gate, i);
			_roomStruct.gateData[i] = 
				{
				x : _inst.x,
				y : _inst.y,
					
				}
			
			
		}
			
			
		
	
	//Store the room specific struct in global.levelData's variable meant for that level
	if room == rm_bed_room {global.levelData.level_1 = _roomStruct;};
	if room == rm_living_room {global.levelData.level_2 = _roomStruct;};
	
}


function load_room()
{
	
	var _roomStruct = 0;
	
	//Get the correct struct for the room youre in
	if room == rm_bed_room {_roomStruct = global.levelData.level_1;};
	if room == rm_living_room {_roomStruct = global.levelData.level_2;};
	
	//EXIT if _roomStruct isnt a struct
	if !is_struct(_roomStruct) {exit;};
	
	//key - get rid of default room editor keys
	//create new keys with all the data we've previously saved
	if instance_exists(obj_item_overworld) {instance_destroy(obj_item_overworld);};
	for (var i = 0; i < _roomStruct.itemNum; i++) 
		{
			with (instance_create_depth(_roomStruct.itemData[i].x, _roomStruct.itemData[i].y, layer, obj_item_overworld))
				{
					item = _roomStruct.itemData[i].item;	
				}
		}
	
	//gate- get rid of default room editor gates
	//create new gates with data previously used, gates destroyed wont reappear.
	if instance_exists(obj_gate) {instance_destroy(obj_gate);};
	for (var i = 0; i < _roomStruct.gateNum; i++)
		{
			instance_create_depth(_roomStruct.gateData[i].x, _roomStruct.gateData[i].y, layer, obj_gate);	
		}
	
}