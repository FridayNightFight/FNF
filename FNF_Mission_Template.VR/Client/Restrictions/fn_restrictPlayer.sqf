/*
	Author: Mallen

	Description:
		Restricts the player from using standard in game mechanics

	Parameter(s):
		None

	Returns:
		None
*/

//disable global, and typing in side
0 enableChannel false;
1 enableChannel [false, true];

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

//set view distance to specified in Config.sqf
//setViewDistance fnf_viewDistance;
