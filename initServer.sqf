["Initialize"] call BIS_fnc_dynamicGroups;

{{ _x setVariable ["ace_map_hideBlueForceMarker", true, true]; } forEach (units _x); } forEach allGroups;

// execVM "USER\scripts\ownerShipHandler.sqf";

GRAD_WARLORD_POSITION = ["WARLORD_POSITION", 1] call BIS_fnc_getParamValue;
publicVariable "GRAD_WARLORD_POSITION";

private _options = [1, 2, 3];
_options deleteAt (_options find GRAD_WARLORD_POSITION);

if (!isMultiplayer) exitWith {};

{
	(getMissionLayerEntities format["Warlord_Position_%1", _x]) params ["_objects", "_markers"];
	{
		deleteVehicle _x;
	} forEach _objects;

	{
		deleteMarker _x;		
	} forEach _markers;
} forEach _options;