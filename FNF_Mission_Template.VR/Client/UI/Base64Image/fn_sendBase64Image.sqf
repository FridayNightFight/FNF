/*
	Author: Mallen

	Description:
		Sends a Base64 image to be shown on a players screen

	Parameter(s):
		0: STRING -	The image to send in Base64
		1: ANY - Reciever of the Image

	Returns:
		None
*/

params ["_imageString", "_reciever"];

_dataPacketLength = 500;
_dataPacketDelay = 0.001;

//split string into smaller data packets
_splitDataArray = [];

_stringLength = count _imageString;

systemChat ("Sending packets of length: " + str(_dataPacketLength));
systemChat ("Sending packets with delay of: " + str(_dataPacketDelay));
systemChat ("Splitting data into " + str(_stringLength / _dataPacketLength) + " Packets...");

for [{_i = 0}, {_i < (_stringLength / _dataPacketLength)}, { _i = _i + 1 }] do
{
	_dataPacket = _imageString select [(_i * _dataPacketLength), _dataPacketLength];
	_splitDataArray pushBack _dataPacket;
};

//create a unique ID to give the image to ensure it is recieved correctly
_networkId = clientOwner;
_systemTime = systemTimeUTC;
_systemTimeString = "";
{
	_systemTimeString = _systemTimeString + str(_x);
} forEach _systemTime;

_id = str(_networkId) + _systemTimeString;

//setup global counter for sending process
if (isNil "fnf_sendBase64ImageCounter") then
{
	fnf_sendBase64ImageCounter = createHashMap;
};

//send data packets every x seconds to not cause massive lag spikes
[{
	(_this select 0) params ["_id", "_splitDataArray", "_reciever"];

	_count = fnf_sendBase64ImageCounter getOrDefault [_id, 0];

	systemChat ("Sending packet " + str(_count) + " of " + str(count _splitDataArray));

	if (_count isEqualTo (count _splitDataArray)) then
	{
		[_id, _count] remoteExec ["FNF_ClientSide_fnc_showBase64Image", _reciever, false];
		systemChat ("Sending Complete!");
		[(_this select 1)] call CBA_fnc_removePerFrameHandler;
	} else {
		[_id, _count, (_splitDataArray select _count)] remoteExec ["FNF_ClientSide_fnc_recieveBase64Image", _reciever, false];
		fnf_sendBase64ImageCounter set [_id, (_count + 1)];
	};
}, _dataPacketDelay, [_id, _splitDataArray, _reciever]] call CBA_fnc_addPerFrameHandler;

