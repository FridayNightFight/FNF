/*Sets player ACE attributes*/

if (pRole == ROLE_CLS) then {player setVariable ["ace_medical_medicClass", 1, true]};
if (pRole in [ROLE_CE,ROLE_CR,ROLE_P]) then {player setVariable ["ace_isEngineer", 1, true]};
