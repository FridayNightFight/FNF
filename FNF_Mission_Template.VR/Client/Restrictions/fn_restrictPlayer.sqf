/*
	Author: Mallen

	Description:
		Restricts the player from using standard in game mechanics

	Parameter(s):
		0: MODULE -  The FNF init module

	Returns:
		None
*/

params["_initModule"];

//disable global, and typing in side
0 enableChannel false;
1 enableChannel [false, true];
6 enableChannel false;

// disable AI contact reports
player setspeaker "NoVoice";
showSubtitles false;
enableSentences false;
enableRadio true;
player disableConversation true;

//set terrain grid to standardised values
if (getTerrainGrid > 25) then
{
    setTerrainGrid 25;
};

_viewDistance = _initModule getVariable ["fnf_viewDistance", 1000];

[{
  params["_viewDistance"];
  systemChat str(_viewDistance);

  if (!alive player) exitWith {};

  if (viewDistance > _viewDistance) then
  {
    setViewDistance _viewDistance;
  };

  if (getTerrainGrid > 25) then
  {
    setTerrainGrid 25;
  };

  if !(commandingMenu isEqualTo "") then {showCommandingMenu ""};
} , 0.5, _viewDistance] call CBA_fnc_addPerFrameHandler;
