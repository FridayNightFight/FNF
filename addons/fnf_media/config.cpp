/*
  Adds FNF-related media (images, sounds, etc.)
*/
class CfgPatches
{
  class fnf_media
  {
    units[] = {};
    weapons[]={};
    requiredAddons[] = {};
    requiredVersion = 0.1;
    author = "FNF Technical Team";
  };
};

class CfgRadio {
  sounds[] = {};
  class example {
    // display name
    name = "Example";
    // filename, volume, pitch
    sound[] = {"\sound\notAFile.ogg", 0, 1.0};
    // radio caption
    title = "This is a subtitle";
  };
  class ADS_ANY_ATT_OPF_LEN_ARU_1 {
    name = "ADS_ANY_ATT_OPF_LEN_ARU_1";
    sound[] = {"fnf_media\radio\ADS_ANY_ATT_OPF_LEN_ARU_1.wav",20,1};
    title = "We have taken the enemy Sector! *Jubilous Laughter* (Any Sector)";
  };
  class ADS_SEC1_ATT_OPF_LEN_ARU_1 {
    name = "ADS_SEC1_ATT_OPF_LEN_ARU_1";
    sound[] = {"fnf_media\radio\ADS_SEC1_ATT_OPF_LEN_ARU_1.wav",20,1};
    title = "We have taken Sector 1 from those dogs!";
  };
  class ADS_SEC1_ATT_OPF_LEN_ARU_3 {
    name = "ADS_SEC1_ATT_OPF_LEN_ARU_3";
    sound[] = {"fnf_media\radio\ADS_SEC1_ATT_OPF_LEN_ARU_3.wav",20,1};
    title = "Comrades, great news, Sector 1 is ours!";
  };
  class ADS_SEC1_DEF_OPF_LEN_ARU_1 {
    name = "ADS_SEC1_DEF_OPF_LEN_ARU_1";
    sound[] = {"fnf_media\radio\ADS_SEC1_DEF_OPF_LEN_ARU_1.wav",20,1};
    title = "Comrades, Sector 1 has been lost!";
  };
  class ADS_SEC1_DEF_OPF_LEN_ARU_2 {
    name = "ADS_SEC1_DEF_OPF_LEN_ARU_2";
    sound[] = {"fnf_media\radio\ADS_SEC1_DEF_OPF_LEN_ARU_2.wav",20,1};
    title = "Cyka, Sector 1 has been taken!";
  };
  class ADS_SEC2_ATT_OPF_LEN_ARU_2 {
    name = "ADS_SEC2_ATT_OPF_LEN_ARU_2";
    sound[] = {"fnf_media\radio\ADS_SEC2_ATT_OPF_LEN_ARU_2.wav",20,1};
    title = "Sector 2 has been captured from the enemy control!";
  };
  class ADS_SEC2_ATT_OPF_LEN_ARU_3 {
    name = "ADS_SEC2_ATT_OPF_LEN_ARU_3";
    sound[] = {"fnf_media\radio\ADS_SEC2_ATT_OPF_LEN_ARU_3.wav",20,1};
    title = "Sector 2 has been taken, that was easy!";
  };
  class ADS_SEC2_DEF_OPF_LEN_ARU_1 {
    name = "ADS_SEC2_DEF_OPF_LEN_ARU_1";
    sound[] = {"fnf_media\radio\ADS_SEC2_DEF_OPF_LEN_ARU_1.wav",20,1};
    title = "Sector 2 has been captured!";
  };
  class ADS_SEC2_DEF_OPF_LEN_ARU_2 {
    name = "ADS_SEC2_DEF_OPF_LEN_ARU_2";
    sound[] = {"fnf_media\radio\ADS_SEC2_DEF_OPF_LEN_ARU_2.wav",20,1};
    title = "Sector 2 has been taken!";
  };
  class ADS_SEC3_ATT_OPF_LEN_ARU_2 {
    name = "ADS_SEC3_ATT_OPF_LEN_ARU_2";
    sound[] = {"fnf_media\radio\ADS_SEC3_ATT_OPF_LEN_ARU_2.wav",20,1};
    title = "Sector 3 is taken, great work!";
  };
  class ADS_SEC3_ATT_OPF_LEN_ARU_4 {
    name = "ADS_SEC3_ATT_OPF_LEN_ARU_4";
    sound[] = {"fnf_media\radio\ADS_SEC3_ATT_OPF_LEN_ARU_4.wav",20,1};
    title = "Sector 3 has been captured by our forces!";
  };
  class ADS_SEC3_DEF_OPF_LEN_ARU_1 {
    name = "ADS_SEC3_DEF_OPF_LEN_ARU_1";
    sound[] = {"fnf_media\radio\ADS_SEC3_DEF_OPF_LEN_ARU_1.wav",20,1};
    title = "Sector 3 has been captured by the enemy!";
  };
  class ADS_SEC3_DEF_OPF_LEN_ARU_2 {
    name = "ADS_SEC3_DEF_OPF_LEN_ARU_2";
    sound[] = {"fnf_media\radio\ADS_SEC3_DEF_OPF_LEN_ARU_2.wav",20,1};
    title = "Sector 3 is gone!";
  };
  class ADS_SQ1_ATT_OPF_LEN_ARU_1 {
    name = "ADS_SQ1_ATT_OPF_LEN_ARU_1";
    sound[] = {"fnf_media\radio\ADS_SQ1_ATT_OPF_LEN_ARU_1.wav",20,1};
    title = "Sector 1 has been taken, now push on to the 2nd one Comrades!";
  };
  class ADS_SQ1_DEF_OPF_LEN_ARU_1 {
    name = "ADS_SQ1_DEF_OPF_LEN_ARU_1";
    sound[] = {"fnf_media\radio\ADS_SQ1_DEF_OPF_LEN_ARU_1.wav",20,1};
    title = "BLYAT, Sector 1 is lost! Retreat to Sector 2 Comrades!";
  };
  class ADS_SQ2_ATT_OPF_LEN_ARU_1 {
    name = "ADS_SQ2_ATT_OPF_LEN_ARU_1";
    sound[] = {"fnf_media\radio\ADS_SQ2_ATT_OPF_LEN_ARU_1.wav",20,1};
    title = "Sector 2 is now ours Comrades, lets push on to Sector 3 and end this fight!";
  };
  class ADS_SQ2_DEF_OPF_LEN_ARU_1 {
    name = "ADS_SQ2_DEF_OPF_LEN_ARU_1";
    sound[] = {"fnf_media\radio\ADS_SQ2_DEF_OPF_LEN_ARU_1.wav",20,1};
    title = "Sector 2 is gone, they took it! Fallback to Sector 3 before it's too late Comrades!";
  };
  class ADS_SQ3_ATT_OPF_LEN_ARU_1 {
    name = "ADS_SQ3_ATT_OPF_LEN_ARU_1";
    sound[] = {"fnf_media\radio\ADS_SQ3_ATT_OPF_LEN_ARU_1.wav",20,1};
    title = "Sector 3 is ours, Thank God, we can finally head home and drink Stoli!";
  };
  class ADS_SQ3_DEF_OPF_LEN_ARU_1 {
    name = "ADS_SQ3_DEF_OPF_LEN_ARU_1";
    sound[] = {"fnf_media\radio\ADS_SQ3_DEF_OPF_LEN_ARU_1.wav",20,1};
    title = "Sector 3 is lost! Retreat!";
  };
  class DES_ANY_ATT_OPF_LEN_ARU_1 {
    name = "DES_ANY_ATT_OPF_LEN_ARU_1";
    sound[] = {"fnf_media\radio\DES_ANY_ATT_OPF_LEN_ARU_1.wav",20,1};
    title = "Comrades, we blew up the objective, great job!";
  };
  class DES_ANY_ATT_OPF_LEN_ARU_3 {
    name = "DES_ANY_ATT_OPF_LEN_ARU_3";
    sound[] = {"fnf_media\radio\DES_ANY_ATT_OPF_LEN_ARU_3.wav",20,1};
    title = "We are getting medals for blowing up that one!";
  };
  class DES_ANY_ATT_OPF_LEN_ARU_5 {
    name = "DES_ANY_ATT_OPF_LEN_ARU_5";
    sound[] = {"fnf_media\radio\DES_ANY_ATT_OPF_LEN_ARU_5.wav",20,1};
    title = "*laughter*, another objective destroyed!";
  };
  class DES_ANY_ATT_OPF_LEN_ARU_7 {
    name = "DES_ANY_ATT_OPF_LEN_ARU_7";
    sound[] = {"fnf_media\radio\DES_ANY_ATT_OPF_LEN_ARU_7.wav",20,1};
    title = "Boom! Great work Comrades!";
  };
  class DES_ANY_DEF_OPF_LEN_ARU_1 {
    name = "DES_ANY_DEF_OPF_LEN_ARU_1";
    sound[] = {"fnf_media\radio\DES_ANY_DEF_OPF_LEN_ARU_1.wav",20,1};
    title = "CYKA, they blew up another objective!";
  };
  class DES_ANY_DEF_OPF_LEN_ARU_3 {
    name = "DES_ANY_DEF_OPF_LEN_ARU_3";
    sound[] = {"fnf_media\radio\DES_ANY_DEF_OPF_LEN_ARU_3.wav",20,1};
    title = "They just destroyed our objective!";
  };
  class DES_ANY_DEF_OPF_LEN_ARU_5 {
    name = "DES_ANY_DEF_OPF_LEN_ARU_5";
    sound[] = {"fnf_media\radio\DES_ANY_DEF_OPF_LEN_ARU_5.wav",20,1};
    title = "They blew it up, they blew up our objective!";
  };
  class END_LOSS_ATT_OPF_LEN_ARU_1 {
    name = "END_LOSS_ATT_OPF_LEN_ARU_1";
    sound[] = {"fnf_media\radio\END_LOSS_ATT_OPF_LEN_ARU_1.wav",20,1};
    title = "Cyka, all hope is lost, fallback!";
  };
  class END_LOSS_ATT_OPF_LEN_ARU_2 {
    name = "END_LOSS_ATT_OPF_LEN_ARU_2";
    sound[] = {"fnf_media\radio\END_LOSS_ATT_OPF_LEN_ARU_2.wav",20,1};
    title = "Pullback, we will get them next time!";
  };
  class END_LOSS_ATT_OPF_LEN_ARU_3 {
    name = "END_LOSS_ATT_OPF_LEN_ARU_3";
    sound[] = {"fnf_media\radio\END_LOSS_ATT_OPF_LEN_ARU_3.wav",20,1};
    title = "BLYAT, the enemy have held their ground, fallback!";
  };
  class END_LOSS_ATT_OPF_LEN_ARU_4 {
    name = "END_LOSS_ATT_OPF_LEN_ARU_4";
    sound[] = {"fnf_media\radio\END_LOSS_ATT_OPF_LEN_ARU_4.wav",20,1};
    title = "*cough* *cough*, everyone retreat.... (defeated sounding)";
  };
  class END_LOSS_DEF_OPF_LEN_ARU_1 {
    name = "END_LOSS_DEF_OPF_LEN_ARU_1";
    sound[] = {"fnf_media\radio\END_LOSS_DEF_OPF_LEN_ARU_1.wav",20,1};
    title = "Fallback! I say again, fallback Comrades!";
  };
  class END_LOSS_DEF_OPF_LEN_ARU_2 {
    name = "END_LOSS_DEF_OPF_LEN_ARU_2";
    sound[] = {"fnf_media\radio\END_LOSS_DEF_OPF_LEN_ARU_2.wav",20,1};
    title = "Retreat! Everyone retreat to the fallback line!";
  };
  class END_LOSS_DEF_OPF_LEN_ARU_3 {
    name = "END_LOSS_DEF_OPF_LEN_ARU_3";
    sound[] = {"fnf_media\radio\END_LOSS_DEF_OPF_LEN_ARU_3.wav",20,1};
    title = "Everyone reading this, retreat to rally point Moscow!";
  };
  class END_LOSS_DEF_OPF_LEN_ARU_4 {
    name = "END_LOSS_DEF_OPF_LEN_ARU_4";
    sound[] = {"fnf_media\radio\END_LOSS_DEF_OPF_LEN_ARU_4.wav",20,1};
    title = "Is anyone left? If you are reading this state your callsign and status!";
  };
  class END_WIN_ATT_OPF_LEN_ARU_1 {
    name = "END_WIN_ATT_OPF_LEN_ARU_1";
    sound[] = {"fnf_media\radio\END_WIN_ATT_OPF_LEN_ARU_1.wav",20,1};
    title = "We did it Comrades! We completed all objectives!";
  };
  class END_WIN_ATT_OPF_LEN_ARU_2 {
    name = "END_WIN_ATT_OPF_LEN_ARU_2";
    sound[] = {"fnf_media\radio\END_WIN_ATT_OPF_LEN_ARU_2.wav",20,1};
    title = "Oorah! We did it!";
  };
  class END_WIN_ATT_OPF_LEN_ARU_3 {
    name = "END_WIN_ATT_OPF_LEN_ARU_3";
    sound[] = {"fnf_media\radio\END_WIN_ATT_OPF_LEN_ARU_3.wav",20,1};
    title = "We pushed them so hard they just gave up! *laughing*";
  };
  class END_WIN_ATT_OPF_LEN_ARU_4 {
    name = "END_WIN_ATT_OPF_LEN_ARU_4";
    sound[] = {"fnf_media\radio\END_WIN_ATT_OPF_LEN_ARU_4.wav",20,1};
    title = "FOR THE MOTHERLAND! OORAH!";
  };
  class END_WIN_ATT_OPF_LEN_ARU_5 {
    name = "END_WIN_ATT_OPF_LEN_ARU_5";
    sound[] = {"fnf_media\radio\END_WIN_ATT_OPF_LEN_ARU_5.wav",20,1};
    title = "That was tougher than I thought it would be!";
  };
  class END_WIN_ATT_OPF_LEN_ARU_6 {
    name = "END_WIN_ATT_OPF_LEN_ARU_6";
    sound[] = {"fnf_media\radio\END_WIN_ATT_OPF_LEN_ARU_6.wav",20,1};
    title = "Mother Russia is proud of us Comrades!";
  };
  class END_WIN_DEF_OPF_LEN_ARU_1 {
    name = "END_WIN_DEF_OPF_LEN_ARU_1";
    sound[] = {"fnf_media\radio\END_WIN_DEF_OPF_LEN_ARU_1.wav",20,1};
    title = "THey stood no chance against Mother Russia!";
  };
  class END_WIN_DEF_OPF_LEN_ARU_2 {
    name = "END_WIN_DEF_OPF_LEN_ARU_2";
    sound[] = {"fnf_media\radio\END_WIN_DEF_OPF_LEN_ARU_2.wav",20,1};
    title = "Look at them run with their tail in between their legs! OORAHHHHHH!";
  };
  class END_WIN_DEF_OPF_LEN_ARU_3 {
    name = "END_WIN_DEF_OPF_LEN_ARU_3";
    sound[] = {"fnf_media\radio\END_WIN_DEF_OPF_LEN_ARU_3.wav",20,1};
    title = "We held our ground, good work Comrades!";
  };
  class END_WIN_DEF_OPF_LEN_ARU_4 {
    name = "END_WIN_DEF_OPF_LEN_ARU_4";
    sound[] = {"fnf_media\radio\END_WIN_DEF_OPF_LEN_ARU_4.wav",20,1};
    title = "Im thirsty for Stoli after that!";
  };
  class END_WIN_DEF_OPF_LEN_ARU_5 {
    name = "END_WIN_DEF_OPF_LEN_ARU_5";
    sound[] = {"fnf_media\radio\END_WIN_DEF_OPF_LEN_ARU_5.wav",20,1};
    title = "Wooh! I worked up a sweat for nothing!";
  };
  class END_WIN_DEF_OPF_LEN_ARU_6 {
    name = "END_WIN_DEF_OPF_LEN_ARU_6";
    sound[] = {"fnf_media\radio\END_WIN_DEF_OPF_LEN_ARU_6.wav",20,1};
    title = "Mother Russia now, Mother Russia FOREVER!";
  };
  class TER_ANYP_ATT_OPF_LEN_ARU_1 {
    name = "TER_ANYP_ATT_OPF_LEN_ARU_1";
    sound[] = {"fnf_media\radio\TER_ANYP_ATT_OPF_LEN_ARU_1.wav",20,1};
    title = "Enemy have paused our hack on the Terminal! (ANY TERMINAL)";
  };
  class TER_ANYP_DEF_OPF_LEN_ARU_1 {
    name = "TER_ANYP_DEF_OPF_LEN_ARU_1";
    sound[] = {"fnf_media\radio\TER_ANYP_DEF_OPF_LEN_ARU_1.wav",20,1};
    title = "The Terminal hack has been paused! (ANY TERMINAL)";
  };
  class TER_SQ1C_ATT_OPF_LEN_ARU_1 {
    name = "TER_SQ1C_ATT_OPF_LEN_ARU_1";
    sound[] = {"fnf_media\radio\TER_SQ1C_ATT_OPF_LEN_ARU_1.wav",20,1};
    title = "We have hacked Terminal 1! Now push to the second one, OOOORAHHHHHH!";
  };
  class TER_SQ1C_DEF_OPF_LEN_ARU_1 {
    name = "TER_SQ1C_DEF_OPF_LEN_ARU_1";
    sound[] = {"fnf_media\radio\TER_SQ1C_DEF_OPF_LEN_ARU_1.wav",20,1};
    title = "We just lost Terminal 1 Comrades! Retreat to the next Terminal!";
  };
  class TER_SQ2C_ATT_OPF_LEN_ARU_1 {
    name = "TER_SQ2C_ATT_OPF_LEN_ARU_1";
    sound[] = {"fnf_media\radio\TER_SQ2C_ATT_OPF_LEN_ARU_1.wav",20,1};
    title = "Terminal 2 is hacked! Push to the final one! Come on Comrades!";
  };
  class TER_SQ2C_DEF_OPF_LEN_ARU_1 {
    name = "TER_SQ2C_DEF_OPF_LEN_ARU_1";
    sound[] = {"fnf_media\radio\TER_SQ2C_DEF_OPF_LEN_ARU_1.wav",20,1};
    title = "We just lost the Second Terminal! Fallback!";
  };
  class TER_SQ3C_ATT_OPF_LEN_ARU_1 {
    name = "TER_SQ3C_ATT_OPF_LEN_ARU_1";
    sound[] = {"fnf_media\radio\TER_SQ3C_ATT_OPF_LEN_ARU_1.wav",20,1};
    title = "Terminal 3 is done and hacked! We did it, FOR MOTHER RUSSIA! OOOOOORAAAAHHHHHH";
  };
  class TER_SQ3C_DEF_OPF_LEN_ARU_1 {
    name = "TER_SQ3C_DEF_OPF_LEN_ARU_1";
    sound[] = {"fnf_media\radio\TER_SQ3C_DEF_OPF_LEN_ARU_1.wav",20,1};
    title = "Comrades, Terminal 3 has been hacked! The enemy have destroyed all of them!";
  };
  class TER_TM1C_ATT_OPF_LEN_ARU_1 {
    name = "TER_TM1C_ATT_OPF_LEN_ARU_1";
    sound[] = {"fnf_media\radio\TER_TM1C_ATT_OPF_LEN_ARU_1.wav",20,1};
    title = "Terminal 1 is done!";
  };
  class TER_TM1C_DEF_OPF_LEN_ARU_1 {
    name = "TER_TM1C_DEF_OPF_LEN_ARU_1";
    sound[] = {"fnf_media\radio\TER_TM1C_DEF_OPF_LEN_ARU_1.wav",20,1};
    title = "We just lost Terminal 1 Comrades!";
  };
  class TER_TM1H_ATT_OPF_LEN_ARU_1 {
    name = "TER_TM1H_ATT_OPF_LEN_ARU_1";
    sound[] = {"fnf_media\radio\TER_TM1H_ATT_OPF_LEN_ARU_1.wav",20,1};
    title = "We are hacking the first Terminal!";
  };
  class TER_TM1H_DEF_OPF_LEN_ARU_1 {
    name = "TER_TM1H_DEF_OPF_LEN_ARU_1";
    sound[] = {"fnf_media\radio\TER_TM1H_DEF_OPF_LEN_ARU_1.wav",20,1};
    title = "Enemy forces have begun a hack on Terminal 1!";
  };
  class TER_TM2C_ATT_OPF_LEN_ARU_1 {
    name = "TER_TM2C_ATT_OPF_LEN_ARU_1";
    sound[] = {"fnf_media\radio\TER_TM2C_ATT_OPF_LEN_ARU_1.wav",20,1};
    title = "Terminal 2 is done!";
  };
  class TER_TM2C_DEF_OPF_LEN_ARU_1 {
    name = "TER_TM2C_DEF_OPF_LEN_ARU_1";
    sound[] = {"fnf_media\radio\TER_TM2C_DEF_OPF_LEN_ARU_1.wav",20,1};
    title = "Blyat, Terminal 2 is lost!";
  };
  class TER_TM2H_ATT_OPF_LEN_ARU_1 {
    name = "TER_TM2H_ATT_OPF_LEN_ARU_1";
    sound[] = {"fnf_media\radio\TER_TM2H_ATT_OPF_LEN_ARU_1.wav",20,1};
    title = "We are hacking Terminal 2!";
  };
  class TER_TM2H_DEF_OPF_LEN_ARU_1 {
    name = "TER_TM2H_DEF_OPF_LEN_ARU_1";
    sound[] = {"fnf_media\radio\TER_TM2H_DEF_OPF_LEN_ARU_1.wav",20,1};
    title = "Terminal 2 is under attack!";
  };
  class TER_TM3C_ATT_OPF_LEN_ARU_1 {
    name = "TER_TM3C_ATT_OPF_LEN_ARU_1";
    sound[] = {"fnf_media\radio\TER_TM3C_ATT_OPF_LEN_ARU_1.wav",20,1};
    title = "Terminal 3 is done!";
  };
  class TER_TM3C_DEF_OPF_LEN_ARU_1 {
    name = "TER_TM3C_DEF_OPF_LEN_ARU_1";
    sound[] = {"fnf_media\radio\TER_TM3C_DEF_OPF_LEN_ARU_1.wav",20,1};
    title = "Comrades, Terminal 3 has been hacked!";
  };
  class TER_TM3H_ATT_OPF_LEN_ARU_1 {
    name = "TER_TM3H_ATT_OPF_LEN_ARU_1";
    sound[] = {"fnf_media\radio\TER_TM3H_ATT_OPF_LEN_ARU_1.wav",20,1};
    title = "Terminal 3 is under our control and being hacked!";
  };
  class TER_TM3H_DEF_OPF_LEN_ARU_1 {
    name = "TER_TM3H_DEF_OPF_LEN_ARU_1";
    sound[] = {"fnf_media\radio\TER_TM3H_DEF_OPF_LEN_ARU_1.wav",20,1};
    title = "THe enemy are hacking Terminal 3!";
  };
};