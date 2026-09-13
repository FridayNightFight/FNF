class ctrlMenuStrip;
class display3DEN
{
	class Controls
	{
		class MenuStrip : ctrlMenuStrip
		{
			class Items
			{
				class Tools
				{
					items[] += {"fnf_mmFolder"};
				};

				class fnf_mmFolder
				{
					text = "FNF Mission Maker Tools...";
					items[] = {"fnf_generateLobbyDescription", "fnf_spawnCustomSidedKit"};
				};

				class fnf_generateLobbyDescription
				{
					text = "Generate Lobby Description";
					picture = "";
					action = "[] call FNF_ModFunctions_fnc_generateLobbyDescription;";
					opensNewWindow = 0;
				};
				class fnf_spawnCustomSidedKit
				{
					text = "Spawn Custom Sided Kit";
					picture = "";
					action = "[] call FNF_ModFunctions_fnc_spawnCustomSidedKit;";
					opensNewWindow = 1;
				};
			};
		};
	};
};
