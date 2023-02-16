["Initialize"] call BIS_fnc_dynamicGroups;

{{ _x setVariable ["ace_map_hideBlueForceMarker", true, true]; } forEach (units _x); } forEach allGroups;

// execVM "USER\scripts\ownerShipHandler.sqf";

GRAD_WARLORD_POSITION = ["WARLORD_POSITION", 1] call BIS_fnc_getParamValue;
publicVariable "GRAD_WARLORD_POSITION";
