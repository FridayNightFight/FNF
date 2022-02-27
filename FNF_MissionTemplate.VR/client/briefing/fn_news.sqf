/*
* Author: IndigoFox
*
* Description:
* Used to create News diary subject and fill w/ records containing news/update articles from staff as well as Youtube references for Steam Overlay playback.
*
* Arguments:
* <NONE>
*
* Return Value:
* <NIL>
*
* Example:
* call fnf_briefing_fnc_news
*
* Public: No
*/

// https://community.bistudio.com/wiki/BIS_fnc_showAANArticle

fnf_Diary_News = player createDiarySubject ["fnf_Diary_News", "News", "\A3\ui_f\data\igui\cfg\simpleTasks\types\documents_ca.paa"];

player createDiaryRecord [
  "fnf_Diary_News",
  [
    "Trailers",
    [
      "<executeClose expression=""openYoutubeVideo 'watch?v=sZnAiEfqLO0'"">Vietnam Trailer</execute>",
      "<executeClose expression=""openYoutubeVideo 'watch?v=REpD_Y7SsQk'"">WWII Trailer</execute>",
      "<executeClose expression=""openYoutubeVideo 'watch?v=ADVe2fzKsJU'"">FNF Titans Trailer</execute>",
      "<executeClose expression=""openYoutubeVideo 'watch?v=E-cQRWSxH80'"">FNF Promo</execute>"
    ] joinString "<br/>"
  ]
];

player createDiaryRecord [
  "fnf_Diary_News",
  [
    "Articles",
    [
      "<executeClose expression='call fnf_article_fnc_NewYear2022'>Happy New Year 2022</execute>"
    ] joinString "<br/>"
  ]
];

