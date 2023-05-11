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
      class verifyZone {};
      class areAnyZonesInRestrictionGroup {};
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
      class startSafeZoneTimer {};
      class checkSafeZoneIsValid {};
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
      class notificationSystem {};
      class adminGameEnd {};
    };
    class spectator
    {
      file = "Client\Spectator";
      class startSpectator {};
      class initSpectatorSlot {};
    };
    class hidingZones
    {
      file = "Client\HidingZones";
      class initHidingZones {};
      class addObjectToHide {};
      class cleanUpSpareHidingZones {};
    };
    class selectors
    {
      file = "Client\Selectors";
      class initSelectors {};
      class switchSelection {};
    };
	};
	class FNF_ServerSide
	{
		class root
		{
			file = "Server";
      class init { postInit = 1; };
			class endGame {};
      class syncTimer {};
		};
    class objectives
    {
      file = "Server\Objectives";
      class initObjs {};
    };
    class objDestroy
    {
      file = "Server\Objectives\Destroy";
      class initDestroy {};
      class watchDestroy {};
    };
	};
};
