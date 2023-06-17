/*
	Author: Mallen

	Description:
		Starts up spectator enviroment for players in spectator slots

	Parameter(s):
		0: ARRAY -  Array of FNF modules

	Returns:
		None
*/

params["_modules"]

// Start spectator interface rendering
("FNF_spectatorUI" call BIS_fnc_rscLayer) cutRsc ["spectatorSideNumbers", "PLAIN"];
