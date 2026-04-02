//get all currently used kit files for processing
fnf_allFNFCompositions = "getText (_x >> 'editorCategory') == 'fnf_Kits'" configClasses (configfile >> "Cfg3DEN" >> "Compositions");

add3DENEventHandler ["OnMissionSave", {
	[
		"Save Composition and move on to next composition?",
		"Save Composition?",
		[
			"Yes",
			{
				0 spawn
				{
					private _compositionLayers = [];

					private _blackListedLayerNames = [
						"Info",
						"Selectors",
						"Units"
					];

					// Get all layers that follow a naming scheme
					all3DENEntities # 6 apply
					{
						private _name = _x get3DENAttribute "name" select 0;
						if (not (_name in _blackListedLayerNames)) then
						{
							_compositionLayers pushBack [_name, _x];
						};
					};

					// Loop though all layers
					{
						_x params ["_name", "_ID"];

						// Get the entities
						private _fullEntities = get3DENLayerEntities _ID;
						private _entities = get3DENLayerEntities _ID;
						{
							_fullEntities append get3DENLayerEntities _x;
							_x set3DENLayer -1
						} forEach _entities;

						// Select the entities so do3DENAction works
						set3DENSelected _fullEntities;

						// Open the create composition dialog
						do3DENAction "CreateCustomComposition";

						// Make sure it's open
						waitUntil { !(isNull findDisplay 317) };

						private _splitName = _name splitString " ";
						private _finalName = _splitName joinString "";

						// Set the layer name as composition name in the dialog
						findDisplay 317 displayCtrl 95 ctrlSetText _finalName;

						findDisplay 317 displayCtrl 96 ctrlSetText "FNF";

						// Close the dialog by activating the OK button
						ctrlActivate (findDisplay 317 displayCtrl 1);

						// Add a small delay
						sleep 0.1;

						//set layers back to required host layer
						{
							_x set3DENLayer _ID
						} forEach _entities;

					} forEach _compositionLayers;

					{
						delete3DENEntities _x;
					} forEach all3DENEntities;

					_composition = create3DENComposition [fnf_allFNFCompositions select 0, [0,0,0]];

					fnf_allFNFCompositions deleteAt 0;
				};
			}
		],
		[
			"No",
			{}
		]
	] call BIS_fnc_3DENShowMessage;
}];


_composition = create3DENComposition [fnf_allFNFCompositions select 0, [0,0,0]];
fnf_allFNFCompositions deleteAt 0;
