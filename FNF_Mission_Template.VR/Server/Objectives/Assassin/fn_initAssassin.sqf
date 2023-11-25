/*
	Author: Mallen

	Description:
    init a destroy objective including setting up server watch

	Parameter(s):
		0: OBJECT -  The destroy objective module to be processed
    1: SIDE -  The side that the objective is assigned to

	Returns:
		None
*/

params ["_objective", "_side"];

//nothing to setup serverside, move straight to watching

//add objective to objective stack
// [type, objective, task]
fnf_serverObjectives pushBack [false, "ASSASSIN", _side, _objective];
