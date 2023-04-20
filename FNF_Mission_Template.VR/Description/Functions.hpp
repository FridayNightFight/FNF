class CfgFunctions
{
	class FNF_ClientSide
	{
		class root
		{
			file = "Client";
			class init { postInit = 1; };
			class gamemodeInit {};
		};
		class zones
		{
			file = "Client\Zones";
			class initZones {};
			class addZone {};
			class removeZone {};
			class addRestrictionGroup {};
			class removeRestrictionGroup {};
			class addZoneToRestrictionGroup {};
			class removeZoneFromRestrictionGroup {};
			class isObjectInZone {};
			class findValidPointWithinZone {};
		};
		class restrictions
		{
			file = "Client\Restrictions";
			class restrictPlayer {};
			class initWeaponDisable {};
			class getRequestWeaponDisable {};
			class startRequestWeaponDisable {};
			class endRequestWeaponDisable {};
		};
	};
	class FNF_ServerSide
	{
		class root
		{
			file = "Server";
			class endGame {};
		};
    class timer
    {
      file = "Server\Timer";
      class createTimer {};
      class addFunctionToTimer {};
      class removeFunctionFromTimer {};
    }
	};
	class FNF_Config
	{
		class variables
		{
			class config {file = "Config.sqf"; preInit = 1;}
		};
		class root
		{
			file = "Config";
			class destroyConfig {file = "Config\Destroy.sqf";};
		};
	};
	class FNF_Gamemodes
	{
		class modes
		{
			file = "Gamemodes";
			class destroy {};
		};
	};
};
