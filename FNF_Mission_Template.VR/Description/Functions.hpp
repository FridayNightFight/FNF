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
		}
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
		class objCaptureSector
		{
			file = "Client\Objectives\CaptureSector";
			class initCaptureSector {};
			class watchCaptureSector {};
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
			class notifyAdminAssassin {};
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
		};
		class spectatorUI
		{
			file = "Client\UI\Spectator";
			class missionDetailsButton {};
			class missionDetailsScreen {};
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
			class initSpectatorPlayzones {};
			class initSpectatorSafeZones {};
		};
		class spectatorObj
		{
			file = "Client\Spectator\Objectives";
			class initSpectatorObjectives {};
		}
		class spectatorObjDestroy
		{
			file = "Client\Spectator\Objectives\Destroy";
			class initSpectatorDestroy {};
			class watchSpectatorDestroy {};
		}
		class spectatorObjCaptureSector
		{
			file = "Client\Spectator\Objectives\CaptureSector";
			class initSpectatorCaptureSector {};
			class watchSpectatorCaptureSector {};
		}
		class spectatorObjTerminal
		{
			file = "Client\Spectator\Objectives\Terminal";
			class initSpectatorTerminal {};
			class watchSpectatorTerminal {};
		}
		class spectatorObjAssassin
		{
			file = "Client\Spectator\Objectives\Assassin";
			class initSpectatorAssassin {};
			class watchSpectatorAssassin {};
		}
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
			class addSequentialHandle {};
			class initSequentialHandler {};
		}
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
			class handleGroupIds {};
			class handleJIPSyncing {};
			class handleVehicleInventory {};
			class handleVicInvincibility {};
		};
		class sequentialHandeler
		{
			file = "Server\SequentialHandeler";
			class addSequentialHandle {};
			class initSequentialHandler {};
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
		class objCaptureSector
		{
			file = "Server\Objectives\CaptureSector";
			class initCaptureSector {};
			class watchCaptureSector {};
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
	};
};
