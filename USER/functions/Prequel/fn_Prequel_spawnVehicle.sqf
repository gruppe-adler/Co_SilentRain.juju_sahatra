/*
* Spawns an Opfor-operated vehicle for the EVAC.
*
* Arguments:
* 0: The vehicle type <STRING>
* 1: The reference object for spawn pos and dir <OBJECT>
* 2: The unit-type of the crew <STRING>
* 3: Unit-types of soldiers being transported <ARRAY> (default: [])
*
* Return Value:
* The spawned vehicle and the group of the crew.
* If _transport is not empty, the group of the transported units will also be returned. <ARRAY>
*
* Example:
* ["cool_car", sneakyPos_1, "pewPewGunman"] call grad_SR_fnc_Prequel_spawnVehicle;
*/

params ["_vehType", "_marker", "_unitType", ["_transport", []]];

private _veh = createVehicle [_vehType, getPos _marker];
_veh setPos (getPos _marker);
_veh setDir (getDir _marker);

private _crewGroup = createGroup east;
if ((_veh emptyPositions "Gunner") isEqualTo 1) then {
	private _gunner = _crewGroup createUnit [_unitType, [0, 0, 0], [], 0, "NONE"];
	[_gunner] call GRAD_Loadout_fnc_doLoadoutForUnit;
	_gunner assignAsGunner _veh;
	_gunner moveInGunner _veh;
};

if ((_veh emptyPositions "Commander") isEqualTo 1) then {
	private _commander = _crewGroup createUnit [_unitType, [0, 0, 0], [], 0, "NONE"];
	[_commander] call GRAD_Loadout_fnc_doLoadoutForUnit;
	_commander assignAsCommander _veh;
	_commander moveInCommander _veh;
};

private _driver = _crewGroup createUnit [_unitType, [2, 2, 0], [], 0, "NONE"];
[_driver] call GRAD_Loadout_fnc_doLoadoutForUnit;
_driver assignAsDriver _veh;
_driver moveInDriver _veh;

_crewGroup setBehaviourStrong "CARELESS";

if (_transport isEqualTo []) exitWith {
	[_veh, _crewGroup]
};

private _cargoGroup = createGroup east;
{
	private _unit = _cargoGroup createUnit [_x, [random 50, random 50, 0], [], 0, "NONE"];
	[_unit] call GRAD_Loadout_fnc_doLoadoutForUnit;
	_unit assignAsCargo _veh;
	_unit moveInCargo _veh;
} forEach _transport;

[_veh, _crewGroup, _cargoGroup]