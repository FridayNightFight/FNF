/*
	Author: Mallen

	Description:
    init a destroy objective including setting up local watch, local task control, local ordering enforcement, and breifing data

	Parameter(s):
		0: OBJECT -  The destroy objective module to be processed
    1: BOOLEAN -  Whether the objective is for the player, if not treat breifing and task control differently

	Returns:
		Boolean
*/

params ["_objective", "_forPlayer"];

_syncedObjects = synchronizedObjects _objective;

