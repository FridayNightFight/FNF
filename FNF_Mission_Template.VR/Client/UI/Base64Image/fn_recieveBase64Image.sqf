/*
	Author: Mallen

	Description:
		Recieves data packets of a Base64 image

	Parameter(s):
		0: STRING -	The ID of the Image being recieved
		1: INTEGER - The order of the data being recieved
		2: STRING -	The Image data

	Returns:
		None
*/

params["_id", "_order", "_data"];

if (isNil "fnf_imageRecieveHashMap") then
{
	fnf_imageRecieveHashMap = createHashMap;
};

_currentData = fnf_imageRecieveHashMap getOrDefault [_id, createHashMap];

_currentData set [_order, _data];

fnf_imageRecieveHashMap set [_id, _currentData];
