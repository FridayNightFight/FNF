class vn_artillery_settings {
    // https://wiki.sogpf.com/index.php/Radio_Support
    // https://pastebin.com/raw/bBnaw8wg
    // Add your NUMBER variable that will be used as a cost variable - leave empty if you don't want the cost to matter.
    cost_variable = "";
    // Array - { Always available, `radio_backpacks`, `radio_vehicles`, `player_types`, "vn_artillery" unit trait}
    // Make the first true for the radio to be always avaliable
    availability[] = {
        0,
        0,
        0,
        0,
        1
    };
    // Distance from the edge of a blacklisted marker that a artillery/aircraft cannot be called in.
    danger_distance = 150;
    unit_trait_required = 1;
    radio_backpacks[] = {
        "vn_o_pack_t884_01",
        "vn_o_pack_t884_ish54_01_pl",
        "vn_o_pack_t884_m1_01_pl",
        "vn_o_pack_t884_m38_01_pl",
        "vn_o_pack_t884_ppsh_01_pl",
        "vn_b_pack_prc77_01_m16_pl",
        "vn_b_pack_03_m3a1_pl",
        "vn_b_pack_03_xm177_pl",
        "vn_b_pack_03_type56_pl",
        "vn_b_pack_03",
        "vn_b_pack_prc77_01",
        "vn_b_pack_trp_04",
        "vn_b_pack_trp_04_02",
        "vn_b_pack_03",
        "vn_b_pack_03_02",
        "vn_b_pack_lw_06"
    };
    radio_vehicles[] = {
        "vn_b_boat_05_01",
        "vn_b_wheeled_m54_03",
        "vn_b_wheeled_m151_01",
        "vn_b_wheeled_m54_02",
        "vn_b_wheeled_m54_01",
        "vn_b_wheeled_m54_mg_02",
        "vn_i_air_ch34_02_01",
        "vn_i_air_ch34_01_02",
        "vn_i_air_ch34_02_02"
    };
    player_types[] = {
        "vn_b_men_sog_05",
        "vn_b_men_sog_17",
        "vn_b_men_army_08",
        "vn_o_men_nva_dc_13",
        "vn_o_men_nva_65_27",
        "vn_o_men_nva_65_13",
        "vn_o_men_nva_27",
        "vn_o_men_nva_13",
        "vn_o_men_nva_marine_13",
        "vn_o_men_nva_navy_13",
        "vn_o_men_vc_local_27",
        "vn_o_men_vc_local_13",
        "vn_o_men_vc_regional_13"
    };
    // Planes
    class aircraft {
        class illumination {
            displayname = $STR_VN_ARTILLERY_AIRCRAFT_ILLUMINATION_ILLUMINATION_NAME;
            class gnat {
                displayname = $STR_VN_ARTILLERY_AIRCRAFT_ILLUMINATION_GNAT_NAME;
                icon = "vn\ui_f_vietnam\data\decals\vn_callsign_src_a101_ca.paa";
                description = $STR_VN_ARTILLERY_AIRCRAFT_ILLUMINATION_GNAT_DESCRIPTION;
                magazines[] = {};
                vehicleclass = "vn_b_air_uh1d_02_03";
                allow_double = 0;
                cooldown = __EVAL(5 * 60);
                illumination = 1;
                cost = 2;
            };
            class dawn_1 {
                displayname = $STR_VN_ARTILLERY_ARTILLERY_ILLUMINATION_DAWN_1_NAME;
                icon = "vn\ui_f_vietnam\data\decals\vn_callsign_src_usarmy_ca.paa";
                description = $STR_VN_ARTILLERY_ARTILLERY_ILLUMINATION_DAWN_1_DESCRIPTION;
                condition = "daytime >= 18 || daytime <= 6";

                function = "vn_fnc_artillery_dawn_1";
                allow_double = 0;
                cooldown = __EVAL(60 * 60);
                illumination = 1;
                cost = 5;
            };
        };
    };
    class artillery {
        class illumination {
            displayname = $STR_VN_ARTILLERY_ARTILLERY_ILLUMINATION_ILLUMINATION_NAME;
            class baker_1 {
                displayname = $STR_VN_ARTILLERY_ARTILLERY_ILLUMINATION_BAKER_1_NAME;
                icon = "vn\ui_f_vietnam\data\decals\vn_callsign_src_l176_ca.paa";
                description = $STR_VN_ARTILLERY_ARTILLERY_ILLUMINATION_BAKER_1_DESCRIPTION;
                ammo[] = {
                    "vn_flare_plane_med_w_ammo",
                    "vn_flare_plane_med_w_ammo",
                    "vn_flare_plane_med_w_ammo",
                    "vn_flare_plane_med_w_ammo"
                };
                allow_double = 0;
                cooldown = __EVAL(60 * 4);
                divergence = 100;
                count = 1;
                illumination = 1;
                cost = 2;
            };
            class mike_1 {
                displayname = $STR_VN_ARTILLERY_ARTILLERY_ILLUMINATION_MIKE_1_NAME;
                icon = "vn\ui_f_vietnam\data\decals\vn_callsign_src_l119_ca.paa";
                description = $STR_VN_ARTILLERY_ARTILLERY_ILLUMINATION_MIKE_1_DESCRIPTION;
                ammo[] = {
                    "vn_flare_plane_med_w_ammo",
                    "vn_flare_plane_med_w_ammo",
                    "vn_flare_plane_med_w_ammo",
                    "vn_flare_plane_med_w_ammo",
                    "vn_flare_plane_med_w_ammo",
                    "vn_flare_plane_med_w_ammo"
                };
                allow_double = 0;
                cooldown = __EVAL(60 * 5);
                divergence = 100;
                count = 1;
                illumination = 1;
                cost = 2;
            };
            class easy_1 {
                displayname = $STR_VN_ARTILLERY_ARTILLERY_ILLUMINATION_EASY_1_NAME;
                icon = "vn\ui_f_vietnam\data\decals\vn_callsign_src_hmm362_ca.paa";
                description = $STR_VN_ARTILLERY_ARTILLERY_ILLUMINATION_EASY_1_DESCRIPTION;
                ammo[] = {
                    "vn_flare_plane_med_w_ammo",
                    "vn_flare_plane_med_w_ammo",
                    "vn_flare_plane_med_w_ammo",
                    "vn_flare_plane_med_w_ammo",
                    "vn_flare_plane_med_w_ammo",
                    "vn_flare_plane_med_w_ammo",
                    "vn_flare_plane_med_w_ammo",
                    "vn_flare_plane_med_w_ammo"
                };
                allow_double = 0;
                cooldown = __EVAL(60 * 7);
                divergence = 100;
                count = 1;
                illumination = 1;
                cost = 2;
            };
        };
        class wp {
            displayname = $STR_VN_ARTILLERY_ARTILLERY_WP_WP_NAME;
            class baker_2 {
                displayname = $STR_VN_ARTILLERY_ARTILLERY_WP_BAKER_2_NAME;
                icon = "vn\ui_f_vietnam\data\decals\vn_callsign_src_l176_ca.paa";
                description = $STR_VN_ARTILLERY_ARTILLERY_WP_BAKER_2_DESCRIPTION;
                ammo[] = {
                    "vn_shell_105mm_m60_wp_ammo",
                    "vn_shell_105mm_m60_wp_ammo",
                    "vn_shell_105mm_m60_wp_ammo",
                    "vn_shell_105mm_m60_wp_ammo"
                };
                allow_double = 0;
                cooldown = __EVAL(60 * 15);
                divergence = 50;
                count = 1;
                cost = 8;
            };
            class easy_2 {
                displayname = $STR_VN_ARTILLERY_ARTILLERY_WP_EASY_2_NAME;
                icon = "vn\ui_f_vietnam\data\decals\vn_callsign_src_hmm362_ca.paa";
                description = $STR_VN_ARTILLERY_ARTILLERY_WP_EASY_2_DESCRIPTION;
                ammo[] = {
                    "vn_shell_60mm_m302_wp_ammo",
                    "vn_shell_60mm_m302_wp_ammo",
                    "vn_shell_60mm_m302_wp_ammo",
                    "vn_shell_60mm_m302_wp_ammo",
                    "vn_shell_60mm_m302_wp_ammo",
                    "vn_shell_60mm_m302_wp_ammo",
                    "vn_shell_60mm_m302_wp_ammo",
                    "vn_shell_60mm_m302_wp_ammo"
                };
                allow_double = 0;
                cooldown = __EVAL(60 * 15);
                divergence = 50;
                count = 1;
                cost = 4;
            };
            class mike_2 {
                displayname = $STR_VN_ARTILLERY_ARTILLERY_WP_MIKE_2_NAME;
                icon = "vn\ui_f_vietnam\data\decals\vn_callsign_src_l119_ca.paa";
                description = $STR_VN_ARTILLERY_ARTILLERY_WP_MIKE_2_DESCRIPTION;
                ammo[] = {
                    "vn_shell_105mm_m60_wp_ammo",
                    "vn_shell_105mm_m60_wp_ammo",
                    "vn_shell_105mm_m60_wp_ammo",
                    "vn_shell_105mm_m60_wp_ammo",
                    "vn_shell_105mm_m60_wp_ammo",
                    "vn_shell_105mm_m60_wp_ammo",
                    "vn_shell_105mm_m60_wp_ammo",
                    "vn_shell_105mm_m60_wp_ammo"
                };
                allow_double = 0;
                cooldown = __EVAL(60 * 15);
                divergence = 50;
                count = 1;
                cost = 15;
            };
        };
    };
};
