["Initialize"] call BIS_fnc_dynamicGroups;

{ _x setVariable ["ace_map_hideBlueForceMarker", true, true]; { _x setVariable ["ace_map_hideBlueForceMarker", true, true]; } forEach (units _x); } forEach allGroups;

// execVM "USER\scripts\ownerShipHandler.sqf";

GRAD_WARLORD_POSITION = ["WARLORD_POSITION", 1] call BIS_fnc_getParamValue;
publicVariable "GRAD_WARLORD_POSITION";

private _options = [1, 2, 3];
_options deleteAt (_options find GRAD_WARLORD_POSITION);
GRAD_LAYERS_TO_DELETE = [];
{
	GRAD_LAYERS_TO_DELETE pushBack (getMissionLayerEntities format["Warlord_Position_%1", _x]);
} forEach _options;
publicVariable "GRAD_LAYERS_TO_DELETE";


private _qasim = [GRAD_Qasim_1, GRAD_Qasim_2, GRAD_Qasim_3] select (GRAD_WARLORD_POSITION - 1);
{
	_x addEventHandler ["HandleDamage", {
		params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit"];

		if (_hitIndex == -1) then {
			0
		};
	}];
} forEach (nearestObjects [_qasim, ["house"], 200]);


if (!isMultiplayer) exitWith {};
{
	_x params ["_objects", "_markers"];

	{
		if (_x isKindOf "Man") then {
			deleteVehicle _x;
			continue
		};
		
		_x enableSimulation false;
        _x hideObject true;
	} forEach _objects;

	{
        deleteMarkerLocal _x;
	} forEach _markers;
} forEach GRAD_LAYERS_TO_DELETE;


missionNameSpace setVariable ["grad_SR_playerDeaths", str 0, true];