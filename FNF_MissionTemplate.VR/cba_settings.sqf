// ACE Advanced Ballistics
force force ace_advanced_ballistics_ammoTemperatureEnabled = false;
force force ace_advanced_ballistics_barrelLengthInfluenceEnabled = false;
force force ace_advanced_ballistics_bulletTraceEnabled = true;
force force ace_advanced_ballistics_enabled = false;
force force ace_advanced_ballistics_muzzleVelocityVariationEnabled = false;
force force ace_advanced_ballistics_simulationInterval = 0.05;

// ACE Advanced Fatigue
force force ace_advanced_fatigue_enabled = true;
force force ace_advanced_fatigue_enableStaminaBar = true;
ace_advanced_fatigue_fadeStaminaBar = true;
force force ace_advanced_fatigue_loadFactor = 0.4;
force force ace_advanced_fatigue_performanceFactor = 4;
force force ace_advanced_fatigue_recoveryFactor = 5;
force force ace_advanced_fatigue_swayFactor = 0.25;
force force ace_advanced_fatigue_terrainGradientFactor = 0.7;

// ACE Advanced Throwing
force force ace_advanced_throwing_enabled = true;
force force ace_advanced_throwing_enablePickUp = true;
force force ace_advanced_throwing_enablePickUpAttached = true;
force force ace_advanced_throwing_showMouseControls = true;
force force ace_advanced_throwing_showThrowArc = true;

// ACE Arsenal
force force ace_arsenal_allowDefaultLoadouts = true;
force force ace_arsenal_allowSharedLoadouts = true;
ace_arsenal_camInverted = false;
force force ace_arsenal_enableIdentityTabs = true;
ace_arsenal_enableModIcons = true;
ace_arsenal_EnableRPTLog = false;
ace_arsenal_fontHeight = 4.5;

// ACE Artillery
force force ace_artillerytables_advancedCorrections = true;
force force ace_artillerytables_disableArtilleryComputer = true;
force force ace_mk6mortar_airResistanceEnabled = true;
force force ace_mk6mortar_allowCompass = true;
force force ace_mk6mortar_allowComputerRangefinder = false;
force force ace_mk6mortar_useAmmoHandling = true;

// ACE Captives
force force ace_captives_allowHandcuffOwnSide = false;
force force ace_captives_allowSurrender = true;
force force ace_captives_requireSurrender = 0;
force force ace_captives_requireSurrenderAi = false;

// ACE Common
force force ace_common_allowFadeMusic = true;
force force ace_common_checkPBOsAction = 0;
force force ace_common_checkPBOsCheckAll = false;
force force ace_common_checkPBOsWhitelist = "[]";
ace_common_displayTextColor = [0,0,0,0.1];
ace_common_displayTextFontColor = [1,1,1,1];
ace_common_settingFeedbackIcons = 1;
ace_common_settingProgressBarLocation = 0;
force force ace_noradio_enabled = true;
ace_parachute_hideAltimeter = true;

// ACE Cook off
force force ace_cookoff_ammoCookoffDuration = 0.2;
force force ace_cookoff_enable = 1;
force force ace_cookoff_enableAmmobox = false;
force force ace_cookoff_enableAmmoCookoff = false;
force force ace_cookoff_probabilityCoef = 4.2;

// ACE Crew Served Weapons
force force ace_csw_ammoHandling = 1;
force force ace_csw_defaultAssemblyMode = false;
ace_csw_dragAfterDeploy = false;
force force ace_csw_handleExtraMagazines = true;
force force ace_csw_progressBarTimeCoefficent = 1;

// ACE Explosives
force force ace_explosives_explodeOnDefuse = false;
force force ace_explosives_punishNonSpecialists = false;
force force ace_explosives_requireSpecialist = false;

// ACE Fragmentation Simulation
force force ace_frag_enabled = false;
force force ace_frag_maxTrack = 10;
force force ace_frag_maxTrackPerFrame = 10;
force force ace_frag_reflectionsEnabled = false;
force force ace_frag_spallEnabled = false;

// ACE Goggles
ace_goggles_effects = 0;
ace_goggles_showClearGlasses = false;
ace_goggles_showInThirdPerson = false;

// ACE Hearing
force force ace_hearing_autoAddEarplugsToUnits = true;
force force ace_hearing_disableEarRinging = true;
force force ace_hearing_earplugsVolume = 0.5;
force force ace_hearing_enableCombatDeafness = false;
force force ace_hearing_enabledForZeusUnits = false;
force force ace_hearing_unconsciousnessVolume = 0.4;

// ACE Interaction
force force ace_interaction_disableNegativeRating = false;
force force ace_interaction_enableMagazinePassing = true;
force force ace_interaction_enableTeamManagement = true;

// ACE Interaction Menu
ace_gestures_showOnInteractionMenu = 2;
ace_interact_menu_actionOnKeyRelease = true;
ace_interact_menu_addBuildingActions = false;
ace_interact_menu_alwaysUseCursorInteraction = true;
ace_interact_menu_alwaysUseCursorSelfInteraction = true;
ace_interact_menu_colorShadowMax = [0,0,0,1];
ace_interact_menu_colorShadowMin = [0,0,0,0.25];
ace_interact_menu_colorTextMax = [1,1,1,1];
ace_interact_menu_colorTextMin = [1,1,1,0.25];
ace_interact_menu_cursorKeepCentered = false;
ace_interact_menu_cursorKeepCenteredSelfInteraction = false;
ace_interact_menu_menuAnimationSpeed = 0;
ace_interact_menu_menuBackground = 0;
ace_interact_menu_menuBackgroundSelf = 0;
ace_interact_menu_selectorColor = [1,0,0];
ace_interact_menu_shadowSetting = 2;
ace_interact_menu_textSize = 2;
ace_interact_menu_useListMenu = true;
ace_interact_menu_useListMenuSelf = true;

// ACE Logistics
force force ace_cargo_enable = true;
force force ace_cargo_loadTimeCoefficient = 5;
force force ace_cargo_paradropTimeCoefficent = 2.5;
force force ace_rearm_distance = 20;
force force ace_rearm_level = 0;
force force ace_rearm_supply = 0;
force force ace_refuel_hoseLength = 12;
force force ace_refuel_rate = 1;
force force ace_repair_addSpareParts = true;
force force ace_repair_autoShutOffEngineWhenStartingRepair = false;
force force ace_repair_consumeItem_toolKit = 0;
ace_repair_displayTextOnRepair = true;
force force ace_repair_engineerSetting_fullRepair = 1;
force force ace_repair_engineerSetting_repair = 1;
force force ace_repair_engineerSetting_wheel = 0;
force force ace_repair_fullRepairLocation = 2;
force force ace_repair_fullRepairRequiredItems = [];
force force ace_repair_miscRepairRequiredItems = [];
force force ace_repair_repairDamageThreshold = 0.3;
force force ace_repair_repairDamageThreshold_engineer = 0.2;
force force ace_repair_wheelRepairRequiredItems = [];

// ACE Magazine Repack
force force ace_magazinerepack_timePerAmmo = 1;
force force ace_magazinerepack_timePerBeltLink = 4;
force force ace_magazinerepack_timePerMagazine = 1;

// ACE Map
force force ace_map_BFT_Enabled = false;
force force ace_map_BFT_HideAiGroups = false;
force force ace_map_BFT_Interval = 1;
force force ace_map_BFT_ShowPlayerNames = false;
force force ace_map_DefaultChannel = 1;
force force ace_map_mapGlow = true;
force force ace_map_mapIllumination = false;
force force ace_map_mapLimitZoom = false;
force force ace_map_mapShake = false;
force force ace_map_mapShowCursorCoordinates = false;
ace_markers_moveRestriction = 4;

// ACE Map Gestures
ace_map_gestures_defaultColor = [1,0.88,0,0.7];
ace_map_gestures_defaultLeadColor = [1,0.88,0,0.95];
force force ace_map_gestures_enabled = true;
force force ace_map_gestures_interval = 0.03;
force force ace_map_gestures_maxRange = 10;
ace_map_gestures_nameTextColor = [0.2,0.2,0.2,0.3];

// ACE Map Tools
force force ace_maptools_drawStraightLines = true;
ace_maptools_rotateModifierKey = 1;

// ACE Medical
force force ace_medical_ai_enabledFor = 0;
force force ace_medical_AIDamageThreshold = 0.6;
force force ace_medical_bleedingCoefficient = 0.3;
force force ace_medical_blood_bloodLifetime = 900;
force force ace_medical_blood_enabledFor = 1;
force force ace_medical_blood_maxBloodObjects = 100;
force force ace_medical_fatalDamageSource = 2;
ace_medical_feedback_bloodVolumeEffectType = 0;
ace_medical_feedback_painEffectType = 3;
force force ace_medical_fractureChance = 0.8;
force force ace_medical_fractures = 0;
ace_medical_gui_enableActions = 0;
ace_medical_gui_enableMedicalMenu = 1;
ace_medical_gui_enableSelfActions = true;
force force ace_medical_gui_maxDistance = 3;
ace_medical_gui_openAfterTreatment = true;
force force ace_medical_ivFlowRate = 3;
force force ace_medical_limping = 1;
force force ace_medical_painCoefficient = 0.5;
force force ace_medical_playerDamageThreshold = 1.3;
force force ace_medical_spontaneousWakeUpChance = 0.75;
force force ace_medical_spontaneousWakeUpEpinephrineBoost = 5;
force force ace_medical_statemachine_AIUnconsciousness = false;
force force ace_medical_statemachine_cardiacArrestBleedoutEnabled = true;
force force ace_medical_statemachine_cardiacArrestTime = 420;
force force ace_medical_statemachine_fatalInjuriesAI = 0;
force force ace_medical_statemachine_fatalInjuriesPlayer = 0;
force force ace_medical_treatment_advancedBandages = 0;
force force ace_medical_treatment_advancedDiagnose = true;
force force ace_medical_treatment_advancedMedication = false;
force force ace_medical_treatment_allowLitterCreation = true;
force force ace_medical_treatment_allowSelfIV = 1;
force force ace_medical_treatment_allowSelfPAK = 0;
force force ace_medical_treatment_allowSelfStitch = 1;
force force ace_medical_treatment_allowSharedEquipment = 1;
force force ace_medical_treatment_clearTraumaAfterBandage = true;
force force ace_medical_treatment_consumePAK = 0;
force force ace_medical_treatment_consumeSurgicalKit = 0;
force force ace_medical_treatment_convertItems = 0;
force force ace_medical_treatment_cprSuccessChance = 0.5;
force force ace_medical_treatment_holsterRequired = 0;
force force ace_medical_treatment_litterCleanupDelay = 600;
force force ace_medical_treatment_locationEpinephrine = 0;
force force ace_medical_treatment_locationPAK = 0;
force force ace_medical_treatment_locationsBoostTraining = false;
force force ace_medical_treatment_locationSurgicalKit = 0;
force force ace_medical_treatment_maxLitterObjects = 100;
force force ace_medical_treatment_medicEpinephrine = 0;
force force ace_medical_treatment_medicIV = 0;
force force ace_medical_treatment_medicPAK = 1;
force force ace_medical_treatment_medicSurgicalKit = 1;
force force ace_medical_treatment_timeCoefficientPAK = 0.5;
force force ace_medical_treatment_treatmentTimeAutoinjector = 4;
force force ace_medical_treatment_treatmentTimeBodyBag = 15;
force force ace_medical_treatment_treatmentTimeSplint = 7;
force force ace_medical_treatment_treatmentTimeTourniquet = 5;
force force ace_medical_treatment_woundStitchTime = 5;
force force ace_medical_treatment_treatmentTimeIV = 6;
force force ace_medical_treatment_treatmentTimeCPR = 10;
force force ace_medical_treatment_allowBodyBagUnconscious = false;
force force ace_medical_treatment_woundReopenChance = 0;

// ACE Name Tags
ace_nametags_defaultNametagColor = [0.77,0.51,0.08,1];
ace_nametags_nametagColorBlue = [0.67,0.67,1,1];
ace_nametags_nametagColorGreen = [0.67,1,0.67,1];
ace_nametags_nametagColorMain = [1,1,1,1];
ace_nametags_nametagColorRed = [1,0.67,0.67,1];
ace_nametags_nametagColorYellow = [1,1,0.67,1];
force force ace_nametags_playerNamesMaxAlpha = 0.8;
force force ace_nametags_playerNamesViewDistance = 5;
force force ace_nametags_showCursorTagForVehicles = false;
ace_nametags_showNamesForAI = false;
ace_nametags_showPlayerNames = 1;
ace_nametags_showPlayerRanks = false;
ace_nametags_showSoundWaves = 2;
ace_nametags_showVehicleCrewInfo = true;
ace_nametags_tagSize = 2;

// ACE Nightvision
force ace_nightvision_aimDownSightsBlur = 0;
force ace_nightvision_disableNVGsWithSights = false;
force ace_nightvision_effectScaling = 0.7;
force ace_nightvision_fogScaling = 1.2;
force ace_nightvision_noiseScaling = 0.5;
force ace_nightvision_shutterEffects = true;

// ACE Overheating
ace_overheating_displayTextOnJam = true;
force force ace_overheating_enabled = false;
force force ace_overheating_overheatingDispersion = true;
ace_overheating_showParticleEffects = true;
ace_overheating_showParticleEffectsForEveryone = false;
force force ace_overheating_unJamFailChance = 0.1;
force force ace_overheating_unJamOnreload = false;

// ACE Pointing
force force ace_finger_enabled = true;
ace_finger_indicatorColor = [0.83,0.68,0.21,0.75];
force force ace_finger_indicatorForSelf = true;
force force ace_finger_maxRange = 10;

// ACE Pylons
force force ace_pylons_enabledForZeus = true;
force force ace_pylons_enabledFromAmmoTrucks = true;
force force ace_pylons_rearmNewPylons = false;
force force ace_pylons_requireEngineer = false;
force force ace_pylons_requireToolkit = false;
force force ace_pylons_searchDistance = 15;
force force ace_pylons_timePerPylon = 3;

// ACE Quick Mount
force force ace_quickmount_distance = 3;
force force ace_quickmount_enabled = true;
ace_quickmount_enableMenu = 3;
ace_quickmount_priority = 0;
force force ace_quickmount_speed = 18;

// ACE Respawn
force force ace_respawn_removeDeadBodiesDisconnected = false;
force force ace_respawn_savePreDeathGear = false;

// ACE Scopes
force force ace_scopes_correctZeroing = true;
force force ace_scopes_deduceBarometricPressureFromTerrainAltitude = false;
force force ace_scopes_defaultZeroRange = 100;
force force ace_scopes_enabled = true;
force force ace_scopes_forceUseOfAdjustmentTurrets = true;
force force ace_scopes_overwriteZeroRange = false;
force force ace_scopes_simplifiedZeroing = false;
ace_scopes_useLegacyUI = false;
force force ace_scopes_zeroReferenceBarometricPressure = 1013.25;
force force ace_scopes_zeroReferenceHumidity = 0;
force force ace_scopes_zeroReferenceTemperature = 15;

// ACE Spectator
force force ace_spectator_enableAI = true;
ace_spectator_maxFollowDistance = 5;
force force ace_spectator_restrictModes = 0;
force force ace_spectator_restrictVisions = 0;

// ACE Switch Units
force force ace_switchunits_enableSafeZone = true;
force force ace_switchunits_enableSwitchUnits = false;
force force ace_switchunits_safeZoneRadius = 100;
force force ace_switchunits_switchToCivilian = false;
force force ace_switchunits_switchToEast = false;
force force ace_switchunits_switchToIndependent = false;
force force ace_switchunits_switchToWest = false;

// ACE Uncategorized
force force ace_fastroping_requireRopeItems = false;
force force ace_gforces_enabledFor = 0;
force force ace_hitreactions_minDamageToTrigger = 0.1;
ace_inventory_inventoryDisplaySize = 0;
force force ace_laser_dispersionCount = 2;
force force ace_microdagr_mapDataAvailable = 2;
force force ace_microdagr_waypointPrecision = 3;
ace_optionsmenu_showNewsOnMainMenu = true;
force force ace_overpressure_distanceCoefficient = 1;
ace_tagging_quickTag = 1;

// ACE Vehicle Lock
force force ace_vehiclelock_defaultLockpickStrength = 10;
force force ace_vehiclelock_lockVehicleInventory = true;
force force ace_vehiclelock_vehicleStartingLockState = -1;

// ACE Vehicles
ace_vehicles_hideEjectAction = true;
force force ace_vehicles_keepEngineRunning = false;

// ACE View Distance Limiter
force force ace_viewdistance_enabled = true;
force force ace_viewdistance_limitViewDistance = 12000;
ace_viewdistance_objectViewDistanceCoeff = 0;
ace_viewdistance_viewDistanceAirVehicle = 0;
ace_viewdistance_viewDistanceLandVehicle = 0;
ace_viewdistance_viewDistanceOnFoot = 0;

// ACE Weapons
ace_common_persistentLaserEnabled = false;
force force ace_laserpointer_enabled = true;
ace_reload_displayText = true;
ace_reload_showCheckAmmoSelf = false;
ace_weaponselect_displayText = true;

// ACE Weather
force force ace_weather_enabled = false;
ace_weather_showCheckAirTemperature = true;
force force ace_weather_updateInterval = 60;
force force ace_weather_windSimulation = false;

// ACE Wind Deflection
force force ace_winddeflection_enabled = false;
force force ace_winddeflection_simulationInterval = 0.05;
force force ace_winddeflection_vehicleEnabled = false;

// TFAR - Global settings
force force TFAR_AICanHearPlayer = false;
force force TFAR_AICanHearSpeaker = false;
force force TFAR_allowDebugging = true;
TFAR_curatorCamEars = false;
force force TFAR_defaultIntercomSlot = 0;
force force TFAR_enableIntercom = true;
force force TFAR_experimentalVehicleIsolation = false;
force force TFAR_fullDuplex = true;
force force TFAR_giveLongRangeRadioToGroupLeaders = false;
force force TFAR_giveMicroDagrToSoldier = true;
force force TFAR_givePersonalRadioToRegularSoldier = true;
force force TFAR_globalRadioRangeCoef = 1;
force force TFAR_instantiate_instantiateAtBriefing = false;
TFAR_noAutomoveSpectator = false;
force force TFAR_objectInterceptionEnabled = false;
force force TFAR_objectInterceptionStrength = 400;
force force tfar_radiocode_east = "_opfor";
force force tfar_radiocode_independent = "_independent";
force force tfar_radiocode_west = "_bluefor";
force force tfar_radioCodesDisabled = false;
force force TFAR_SameLRFrequenciesForSide = false;
force force TFAR_SameSRFrequenciesForSide = false;
force force TFAR_setting_defaultFrequencies_lr_east = "";
force force TFAR_setting_defaultFrequencies_lr_independent = "";
force force TFAR_setting_defaultFrequencies_lr_west = "";
force force TFAR_setting_defaultFrequencies_sr_east = "";
force force TFAR_setting_defaultFrequencies_sr_independent = "";
force force TFAR_setting_defaultFrequencies_sr_west = "";
force force TFAR_setting_DefaultRadio_Airborne_east = "TFAR_mr6000l";
force force TFAR_setting_DefaultRadio_Airborne_Independent = "TFAR_anarc164";
force force TFAR_setting_DefaultRadio_Airborne_West = "TFAR_anarc210";
force force TFAR_setting_DefaultRadio_Backpack_east = "TFAR_mr3000";
force force TFAR_setting_DefaultRadio_Backpack_Independent = "TFAR_anprc155";
force force TFAR_setting_DefaultRadio_Backpack_west = "TFAR_rt1523g";
force force TFAR_setting_DefaultRadio_Personal_east = "TFAR_fadak";
force force TFAR_setting_DefaultRadio_Personal_Independent = "TFAR_anprc148jem";
force force TFAR_setting_DefaultRadio_Personal_West = "TFAR_anprc152";
force force TFAR_setting_DefaultRadio_Rifleman_East = "TFAR_fadak";
force force TFAR_setting_DefaultRadio_Rifleman_Independent = "TFAR_anprc148jem";
force force TFAR_setting_DefaultRadio_Rifleman_West = "TFAR_anprc152";
force force TFAR_spectatorCanHearEnemyUnits = true;
force force TFAR_spectatorCanHearFriendlies = true;
force force TFAR_takingRadio = 2;
force force TFAR_Teamspeak_Channel_Name = "TaskForceRadio";
force force TFAR_Teamspeak_Channel_Password = "123";
force force tfar_terrain_interception_coefficient = 4;
force force TFAR_voiceCone = false;

// Enhanced Movement Rework
force force emr_main_allowMidairClimbing = true;
force force emr_main_animSpeedCoef = 1;
force force emr_main_animSpeedStaminaCoef = 0.4;
force force emr_main_blacklistStr = "";
force force emr_main_climbingEnabled = true;
force force emr_main_climbOnDuty = 3.4;
force force emr_main_climbOverDuty = 3;
force force emr_main_dropDuty = 0.7;
force force emr_main_enableWalkableSurface = true;
force force emr_main_enableWeightCheck = false;
emr_main_hintType = 2;
force force emr_main_jumpDuty = 1;
force force emr_main_jumpingEnabled = true;
force force emr_main_jumpingLoadCoefficient = 0;
force force emr_main_jumpVelocity = 3.4;
force force emr_main_maxClimbHeight = 2.6;
force force emr_main_maxDropHeight = 5;
force force emr_main_maxWeightClimb1 = 200;
force force emr_main_maxWeightClimb2 = 200;
force force emr_main_maxWeightClimb3 = 200;
force force emr_main_maxWeightJump = 200;
force force emr_main_preventHighVaulting = false;
force force emr_main_staminaCoefficient = 1;
force force emr_main_whitelistStr = "";

// GRAD Trenches
force force grad_trenches_functions_allowBigEnvelope = true;
force force grad_trenches_functions_allowCamouflage = true;
force force grad_trenches_functions_allowDigging = true;
force force grad_trenches_functions_allowGiantEnvelope = true;
force force grad_trenches_functions_allowLongEnvelope = true;
force force grad_trenches_functions_allowShortEnvelope = true;
force force grad_trenches_functions_allowSmallEnvelope = true;
force force grad_trenches_functions_allowVehicleEnvelope = true;
force force grad_trenches_functions_bigEnvelopeDigTime = 70;
force force grad_trenches_functions_buildFatigueFactor = 0;
force force grad_trenches_functions_camouflageRequireEntrenchmentTool = false;
force force grad_trenches_functions_giantEnvelopeDigTime = 140;
force force grad_trenches_functions_LongEnvelopeDigTime = 140;
force force grad_trenches_functions_shortEnvelopeDigTime = 45;
force force grad_trenches_functions_smallEnvelopeDigTime = 20;
force force grad_trenches_functions_stopBuildingAtFatigueMax = true;
force force grad_trenches_functions_vehicleEnvelopeDigTime = 140;
