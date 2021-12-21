class InfoPanel
{
  idd = 2525;
  x = 0;
  y = 1;
  w = 1;
  h = 1;
  class controls
  {
    class TreePanel: RscTree {
      idc = 2526;
      x = 0
      y = 0;
      w = 0.25;
      h = 1
      colorBackground[] = {0,0,0,0.8};
    };
    class myControl: RscControlsGroup {    //--- inherits from RscControlsGroup already defined

      idc = 2527;
      x = 0;
      y = 0;
      w = 1;
      h = 1; //w == h
      sizeEx = 0.03;
      class Controls
      {
        class myControl_a: RscStructuredText
        {
          idc = 2528;
          x = 0.25
          y = 0;
          w = 0.73;
          h = 1;
          size = 0.035;
          colorBackground[] = {0,0,0,0.8};
        };
      };
    };
  };
};




class HTMLBrowser
{
  deletable = 0;
  fade = 0;
  access = 0;
  type = CT_HTML;
  idc = 2314;
  style = ST_LEFT;
  filename = "";
  colorBackground[] = {0,0,0,0};
  colorText[] = {1,1,1,1};
  colorBold[] = {1,1,1,1};
  colorLink[] = {1,1,1,0.75};
  colorLinkActive[] = {1,1,1,1};
  colorPicture[] = {1,1,1,1};
  colorPictureLink[] = {1,1,1,1};
  colorPictureSelected[] = {1,1,1,1};
  colorPictureBorder[] = {0,0,0,0};
  tooltipColorText[] = {1,1,1,1};
  tooltipColorBox[] = {1,1,1,1};
  tooltipColorShade[] = {0,0,0,0.65};
  class H1
  {
    font = "RobotoCondensed";
    fontBold = "RobotoCondensedBold";
    sizeEx = GUI_TEXT_SIZE_LARGE;
    align = "left";
  };
  class H2
  {
    font = "RobotoCondensed";
    fontBold = "RobotoCondensedBold";
    sizeEx = GUI_TEXT_SIZE_MEDIUM;
    align = "right";
  };
  class H3
  {
    font = "RobotoCondensed";
    fontBold = "RobotoCondensedBold";
    sizeEx = GUI_TEXT_SIZE_MEDIUM;
    align = "left";
  };
  class H4
  {
    font = "RobotoCondensed";
    fontBold = "RobotoCondensedBold";
    sizeEx = GUI_TEXT_SIZE_MEDIUM;
    align = "left";
  };
  class H5
  {
    font = "RobotoCondensed";
    fontBold = "RobotoCondensedBold";
    sizeEx = GUI_TEXT_SIZE_MEDIUM;
    align = "left";
  };
  class H6
  {
    font = "RobotoCondensed";
    fontBold = "RobotoCondensedBold";
    sizeEx = GUI_TEXT_SIZE_MEDIUM;
    align = "left";
  };
  class P
  {
    font = "RobotoCondensed";
    fontBold = "RobotoCondensedBold";
    sizeEx = GUI_TEXT_SIZE_MEDIUM;
    align = "left";
  };
  x = 0;
  y = 0;
  w = 0.1;
  h = 0.1;
  sizeEx = GUI_TEXT_SIZE_MEDIUM;
  prevPage = "\A3\ui_f\data\gui\rsccommon\rschtml\arrow_left_ca.paa";
  nextPage = "\A3\ui_f\data\gui\rsccommon\rschtml\arrow_right_ca.paa";
  shadow = 2;
};
