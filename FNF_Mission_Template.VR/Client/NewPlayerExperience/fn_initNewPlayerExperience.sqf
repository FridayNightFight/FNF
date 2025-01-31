/*
	Author: Mallen

	Description:
		Checks if a player is new to FNF and if they are start new player experience

	Parameter(s):
		None

	Returns:
		None
*/

_frameworkVersion = loadFile "Version.txt";

_frameworkVersionSplit = _frameworkVersion splitString ".";

//if version is a dev version simply dont do anything and leave
if (count _frameworkVersionSplit > 3) exitWith {};

//check what version has been played last
_lastPlayedVersion = profileNamespace getVariable ["fnf_latestVersionPlayed", "FAILED TO FIND"];

if (_lastPlayedVersion isEqualTo "FAILED TO FIND") then
{
	//if no version found its a new player and we should start new player experience
	call FNF_ClientSide_fnc_newToFNF;
	profileNamespace setVariable ["fnf_latestVersionPlayed", _frameworkVersion];
} else {
	_lastPlayedVersionSplit = _lastPlayedVersion splitString ".";

	//check in x.x.x format if frmaework version is more up to date than last played
	if (parseNumber (_frameworkVersionSplit select 0) > parseNumber (_lastPlayedVersionSplit select 0)) then
	{
		profileNamespace setVariable ["fnf_latestVersionPlayed", _frameworkVersion];
	};
	if (parseNumber (_frameworkVersionSplit select 0) isEqualTo parseNumber (_lastPlayedVersionSplit select 0)) then
	{
		if (parseNumber (_frameworkVersionSplit select 1) > parseNumber (_lastPlayedVersionSplit select 1)) then
		{
			if (parseNumber (_frameworkVersionSplit select 1) > 2) then
			{
				call FNF_ClientSide_fnc_newToMRS;
			};
			profileNamespace setVariable ["fnf_latestVersionPlayed", _frameworkVersion];
		};
		if (parseNumber (_frameworkVersionSplit select 1) isEqualTo parseNumber (_lastPlayedVersionSplit select 1)) then
		{
			if (parseNumber (_frameworkVersionSplit select 2) > parseNumber (_lastPlayedVersionSplit select 2)) then
			{
				profileNamespace setVariable ["fnf_latestVersionPlayed", _frameworkVersion];
			};
		};
	};
};
