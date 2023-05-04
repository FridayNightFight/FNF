class CfgFunctions
{
	class FNF_ClientSide
	{
		class root
		{
			file = "Client";
			class init { postInit = 1; };
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
      class initPlayZones {};
		};
    class objectives
    {
      file = "Client\Objectives";
      class initObjs {};
    };
    class objDestroy
    {
      file = "Client\Objectives\Destroy";
      class initDestroy {};
      class watchDestroy {};
    };
    class safeZones
    {
      file = "Client\Safezones";
      class initSafeZones {};
    };
    class modules
    {
      file = "Client\Modules";
      class findFNFModules {};
      class findSpecificModules {};
    };
    class ui
    {
      file = "Client\UI";
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
};
