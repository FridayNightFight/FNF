class CfgVehicles
{
  //BEGIN BACKPACKS
  class Bag_Base;

  //IFA3
  class B_LIB_AssaultPack_Base: Bag_Base {
    maximumLoad = 1000;
  };


  //IFA3 - GER
  class B_LIB_GER_Backpack: B_LIB_AssaultPack_Base {
    maximumLoad = 1000;
  };
  class B_LIB_GER_MedicBackpack: B_LIB_AssaultPack_Base {
    maximumLoad = 1000;
  };
  class B_LIB_GER_Panzer: B_LIB_AssaultPack_Base {
    maximumLoad = 1000;
  };
	class B_LIB_GER_A_frame: B_LIB_AssaultPack_Base {
    maximumLoad = 1000;
	};
  class B_LIB_GER_A_frame_kit: B_LIB_GER_A_frame {
    maximumLoad = 1000;
	};
  class B_LIB_GER_A_frame_zeltbahn: B_LIB_GER_A_frame {
    maximumLoad = 1000;
	};

  class B_LIB_GER_Radio: B_LIB_AssaultPack_Base {
    maximumLoad = 1000;
	};


  class B_LIB_GER_SapperBackpack_empty: B_LIB_GER_Backpack {
    maximumLoad = 1000;
  };
  class B_LIB_GER_SapperBackpack2: B_LIB_GER_SapperBackpack_empty {
    maximumLoad = 1000;
  };
  class B_LIB_GER_Panzer_Empty: B_LIB_GER_Panzer {
    maximumLoad = 1000;
  };
  class B_LIB_GER_Panzer_Big_Empty: B_LIB_GER_Panzer_Empty {
    maximumLoad = 1000;
  };

  //IFA3 - SOV
  class B_LIB_SOV_RA_GasBag: B_LIB_AssaultPack_Base {
    maximumLoad = 1000;
  };
  class B_LIB_SOV_RA_MedicalBag: B_LIB_AssaultPack_Base {
    maximumLoad = 1000;
  };
  class B_LIB_SOV_RA_MGAmmoBag: B_LIB_AssaultPack_Base {
    maximumLoad = 1000;
  };
  class B_LIB_SOV_RA_Rucksack: B_LIB_AssaultPack_Base {
    maximumLoad = 1000;
  };

  class B_LIB_SOV_RA_Radio: B_LIB_AssaultPack_Base {
    maximumLoad = 1000;
  };

  class B_LIB_SOV_RA_Rucksack_Gas_Kit: B_LIB_SOV_RA_Rucksack {
    maximumLoad = 1000;
  };
  class B_LIB_SOV_RA_Rucksack_Green: B_LIB_SOV_RA_Rucksack {
    maximumLoad = 1000;
  };
  class B_LIB_SOV_RA_Rucksack_Gas_Kit_Green: B_LIB_SOV_RA_Rucksack_Green {
    maximumLoad = 1000;
  };
  class B_LIB_SOV_RA_Rucksack2: B_LIB_SOV_RA_Rucksack {
    maximumLoad = 1000;
  };
  class B_LIB_SOV_RA_Rucksack2_Gas_Kit: B_LIB_SOV_RA_Rucksack2 {
    maximumLoad = 1000;
  };
  class B_LIB_SOV_RA_Rucksack2_Green: B_LIB_SOV_RA_Rucksack2 {
    maximumLoad = 1000;
  };
  class B_LIB_SOV_RA_Rucksack2_Gas_Kit_Green: B_LIB_SOV_RA_Rucksack2_Green {
    maximumLoad = 1000;
  };
  class B_LIB_SOV_RA_Rucksack2_Shinel: B_LIB_SOV_RA_Rucksack2 {
    maximumLoad = 1000;
  };
  class B_LIB_SOV_RA_Rucksack2_Shinel_Green: B_LIB_SOV_RA_Rucksack2_Green {
    maximumLoad = 1000;
  };
  class B_LIB_SOV_RA_Rucksack2_Gas_Kit_Shinel: B_LIB_SOV_RA_Rucksack2 {
    maximumLoad = 1000;
  };
  class B_LIB_SOV_RA_Rucksack2_Gas_Kit_Shinel_Green: B_LIB_SOV_RA_Rucksack2_Green {
    maximumLoad = 1000;
  };
  class B_LIB_SOV_RA_RucksackMines: B_LIB_SOV_RA_Rucksack {
    maximumLoad = 1000;
  };
  class B_LIB_SOV_RA_RucksackMines2: B_LIB_SOV_RA_Rucksack {
    maximumLoad = 1000;
  };

  //IFA3 - UK
  class B_LIB_UK_HSack: B_LIB_AssaultPack_Base {
    maximumLoad = 1000;
  };
  class B_LIB_UK_HSack_Medic: B_LIB_UK_HSack {
    maximumLoad = 1000;
  };

  //IFA3 - US
  class B_LIB_US_Backpack: B_LIB_AssaultPack_Base {
    maximumLoad = 1000;
  };
  class B_LIB_US_RocketBag: B_LIB_AssaultPack_Base {
    maximumLoad = 1000;
  };
  class B_LIB_US_RocketBag_Empty: B_LIB_US_RocketBag {
    maximumLoad = 1000;
  };
  class B_LIB_US_Radio: B_LIB_AssaultPack_Base {
    maximumLoad = 1000;
  };
  class B_LIB_US_Bandoleer: B_LIB_AssaultPack_Base {
    maximumLoad = 1000;
  };
  class B_LIB_US_M2Flamethrower: B_LIB_AssaultPack_Base {
    maximumLoad = 1000;
  };
  class B_LIB_US_M36: B_LIB_AssaultPack_Base {
    maximumLoad = 1000;
  };
  class B_LIB_US_M36_Rocketbag: B_LIB_US_M36 {
    maximumLoad = 1000;
  };
  class B_LIB_US_M36_Rocketbag_Empty: B_LIB_US_M36_Rocketbag {
    maximumLoad = 1000;
  };
  class B_LIB_US_Backpack_RocketBag: B_LIB_US_Backpack {
    maximumLoad = 1000;
  };
  class B_LIB_US_Backpack_RocketBag_Empty: B_LIB_US_Backpack_RocketBag {
    maximumLoad = 1000;
  };

  //FOW - GER
  class fow_b_heer_aframe: Bag_Base {
    maximumLoad = 1000;
  };
  class fow_b_heer_ammo_belt: Bag_Base {
    maximumLoad = 1000;
  };
  class fow_b_ammoboxes: Bag_Base {
    maximumLoad = 1000;
  };
  class fow_b_ammoboxes_mg34_42: Bag_Base {
    maximumLoad = 1000;
  };
  class fow_b_grenadebag: Bag_Base {
    maximumLoad = 1000;
  };
  class fow_b_tornister: Bag_Base {
    maximumLoad = 1000;
  };
  class fow_b_tornister_medic: fow_b_tornister {
    maximumLoad = 1000;
  };

  //FOW - IJA
  class fow_b_ija_ammobox: Bag_Base {
    maximumLoad = 1000;
  };
  class fow_b_ija_ammobox_metal: Bag_Base {
    maximumLoad = 1000;
  };
  class fow_b_ija_ammobox_wood: Bag_Base {
    maximumLoad = 1000;
  };
  class fow_b_ija_backpack: Bag_Base {
    maximumLoad = 1000;
  };
  class fow_b_ija_backpack_foliage: fow_b_ija_backpack {
    maximumLoad = 1000;
  };

  //FOW - UK
  class fow_b_uk_p37: Bag_Base {
    maximumLoad = 1000;
  };
  class fow_b_uk_p37_blanco: fow_b_uk_p37 {
    maximumLoad = 1000;
  };
  class fow_b_uk_p37_blanco_shovel: fow_b_uk_p37_blanco {
    maximumLoad = 1000;
  };
  class fow_b_uk_p37_radio: fow_b_uk_p37 {
    maximumLoad = 1000;
  };
  class fow_b_uk_p37_radio_blanco: fow_b_uk_p37_radio {
    maximumLoad = 1000;
  };
  class fow_b_uk_p37_shovel: fow_b_uk_p37 {
    maximumLoad = 1000;
  };
  class fow_b_uk_bergenpack: fow_b_uk_p37 {
    maximumLoad = 1000;
  };
  class fow_b_uk_piat: fow_b_uk_p37 {
    maximumLoad = 1000;
  };

  //FOW - US
  class fow_b_us_bandoleer: Bag_Base {
    maximumLoad = 1000;
  };
  class fow_b_us_m2_fueltank: Bag_Base {
    maximumLoad = 1000;
  };
  class fow_b_us_m1928: Bag_Base {
    maximumLoad = 1000;
  };
  class fow_b_us_m1944: Bag_Base {
    maximumLoad = 1000;
  };
  class fow_b_us_m1944_ropes: fow_b_us_m1944 {
    maximumLoad = 1000;
  };
  class fow_b_us_radio_scr: Bag_Base {
    maximumLoad = 1000;
  };
  class fow_b_us_rocket_bag: Bag_Base {
    maximumLoad = 1000;
  };
  class fow_b_usmc_m1928: Bag_Base {
    maximumLoad = 1000;
  };
  class fow_b_usmc_m1928_02: Bag_Base {
    maximumLoad = 1000;
  };

  //END BACKPACKS
};
