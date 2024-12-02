/*
	Author: Mallen

	Description:
		starts text box's and light info for players new to 4.3.0 to explain mission review system

	Parameter(s):
		None

	Returns:
		None
*/
[{time > 1},{
	"New to 4.3.0!" hintC ["Hi there! We have a new update to the FNF framework that may require some explanation!", "When you enter spectator from dying this round, and in the future, in the top right you will see a mission review button, this will allow you to leave a rating for the mission as well as some text to explain your thoughts", "When a review is saved you can edit it at any point, it will also stay accounted for through disconnects, all the reviews are finalised when the mission is ended!"];
	hintC_EH1 = findDisplay 72 displayAddEventHandler ["Unload", {
	_this spawn {
	hintSilent "";
	_this select 0 displayRemoveEventHandler ["Unload", hintC_EH1];
	};
	}];
},[]] call CBA_fnc_waitUntilAndExecute;
