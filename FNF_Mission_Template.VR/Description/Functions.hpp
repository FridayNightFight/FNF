class CfgFunctions
{
	class FNF_ClientSide
	{
		class root
		{
			file = "Client";
			class init {};
			class singleplayerInitCall { postInit = 1; };
			class multiplayerInitCall {};
			class requestJIPObjects {};
		};
		class codeUtilities
		{
			file = "Client\CodeUtilities";
			class sortByLocation {};
			class getBottomLeft {};
			class checkSecondaryObjective {};
			class getDisplayObjNumber {};
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
			class getVisualCenter {};
			class calculateVisualCenter {};
			class verifyZone {};
			class areAnyZonesInRestrictionGroup {};
			class shadeZone {};
			class unShadeZone {};
			class getDisplayName {};
			class setZoneColour {};
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
			class watchObjs {};
			class initMarkerFollow {};
		};
		class objDestroy
		{
			file = "Client\Objectives\Destroy";
			class initDestroy {};
			class watchDestroy {};
		};
		class objCaptureSector
		{
			file = "Client\Objectives\CaptureSector";
			class initCaptureSector {};
			class watchCaptureSector {};
		};
				class objHoldSector
		{
			file = "Client\Objectives\HoldSector";
			class initHoldSector {};
			class watchHoldSector {};
			class notifyHoldSector {};
		};
		class objTerminal
		{
			file = "Client\Objectives\Terminal";
			class initTerminal {};
			class watchTerminal {};
			class notifyTerminal {};
		};
		class objAssassin
		{
			file = "Client\Objectives\Assassin";
			class initAssassin {};
			class watchAssassin {};
		};
		class objSteal
		{
			file = "Client\Objectives\Steal";
			class initSteal {};
			class watchSteal {};
		};
		class objEscort
		{
			file = "Client\Objectives\Escort";
			class initEscort {};
			class watchEscort {};
		};
		class safeZones
		{
			file = "Client\Safezones";
			class initSafeZones {};
			class startSafeZoneTimer {};
			class anyNonExpiredSafeZones {};
			class manuallyEndSafeZones {};
		};
		class teleportPoles
		{
			file = "Client\TeleportPoles";
			class initTeleportPoles {};
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
			class markEditorPlacedObjects {};
			class initGPSUnitMarkers {};
		};
		class pauseMenu
		{
			file = "Client\UI\PauseMenu";
			class adminGameEndButton {};
			class contactStaffButton {};
			class adminMenuButton {};
			class missionReviewButtonPM {};
		};
		class spectatorUI
		{
			file = "Client\UI\Spectator";
			class missionDetailsButton {};
			class missionDetailsScreen {};
			class missionReviewButton {};
			class missionReviewScreen {};
		};
		class admin
		{
			file = "Client\Admin";
			class contactStaff {};
			class recieveContactStaffRequest {};
			class adminMenu {};
			class respawnPlayer {};
			class zuesAceOptions {};
		};
		class timer
		{
			file = "Client\UI\Timer";
			class initOverallTimer {};
			class showTimerInHUD {};
		};
		class spectator
		{
			file = "Client\Spectator";
			class startSpectator {};
			class initSpectatorSlot {};
			class getSpectatorParentTask {};
			class startLimitedSpectator {};
			class upgradeSpectator {};
		};
		class hidingZones
		{
			file = "Client\HidingZones";
			class initHidingZones {};
			class addObjectToHide {};
			class removeObjectToHide {};
		};
		class selectors
		{
			file = "Client\Selectors";
			class initSelectors {};
			class switchSelection {};
		};
		class fortify
		{
			file = "Client\Fortify";
			class initFortify {};
			class disableFortify {};
			class addDestructionEH {};
		};
		class breifing
		{
			file = "Client\Breifing";
			class initBreifing {};
			class initOrbat {};
			class updateOrbat {};
		};
		class mapShading
		{
			file = "Client\UI\MapShading";
			class triangulatePolygon {};
			class initMapShading {};
			class invertPolygon {};
			class combineOffsetPoints {};
		};
		class radio
		{
			file = "Client\Radio";
			class initRadios {};
		};
		class newPlayerExperience
		{
			file = "Client\NewPlayerExperience";
			class initNewPlayerExperience {};
			class newToFNF {};
			class newToMRS {};
		};
		class taskControl
		{
			file = "Client\TaskControl";
			class initTaskControl {};
			class addTaskToTaskControl {};
			class removeTaskfromTaskControl {};
			class editTaskInTaskControl {};
		};
		class sequentialHandeler
		{
			file = "Client\SequentialHandeler";
			class checkAndAddSequentialHandle {};
			class initSequentialHandler {};
		};
		class backpackLocking
		{
			file = "Client\BackpackLocking";
			class initBackpackLocking {};
		};
		class base64Image
		{
			file = "Client\UI\Base64Image";
			class recieveBase64Image {};
			class sendBase64Image {};
			class showBase64Image {};
		};
		class reinsert
		{
			file = "Client\Reinsert";
			class initReinsert {};
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
			class initFortify {};
			class initAdmin {};
		};
		class handles
		{
			file = "Server\Handles";
			class handleDisconnect {};
			class handleJIPSyncing {};
			class handleVicInvincibility {};
			class handleVicRadios {};
		};
		class sequentialHandeler
		{
			file = "Server\SequentialHandeler";
			class checkAndAddSequentialHandle {};
			class initSequentialHandler {};
		};
		class reInsert
		{
			file = "Server\Reinsert";
			class startReinsert {};
		};
		class objectives
		{
			file = "Server\Objectives";
			class initObjs {};
			class watchObjs {};
		};
		class objDestroy
		{
			file = "Server\Objectives\Destroy";
			class initDestroy {};
			class watchDestroy {};
		};
		class objCaptureSector
		{
			file = "Server\Objectives\CaptureSector";
			class initCaptureSector {};
			class watchCaptureSector {};
		};
		class objHoldSector
		{
			file = "Server\Objectives\HoldSector";
			class initHoldSector {};
			class watchHoldSector {};
		};
		class objTerminal
		{
			file = "Server\Objectives\Terminal";
			class switchTerminal {};
			class initTerminal {};
			class watchTerminal {};
		};
		class objAssassin
		{
			file = "Server\Objectives\Assassin";
			class initAssassin {};
			class watchAssassin {};
		};
		class objSteal
		{
			file = "Server\Objectives\Steal";
			class initSteal {};
			class watchSteal {};
		};
		class objEscort
		{
			file = "Server\Objectives\Escort";
			class initEscort {};
			class watchEscort {};
		};
	};
};
