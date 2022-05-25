class CfgVehicles
{
  //Backpacks
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
  //END IFA3 - GER

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
  //END IFA3 - SOV
};
