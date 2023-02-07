#define DISTANCE_TO_KEEP 15

if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };

// Spawn units
private _pickupTransport = ["O_Soldier_TL_F", "O_Soldier_AR_F", "O_Soldier_LAT_F"];
private _vodnikTransport = ["O_Soldier_SL_F", "O_Soldier_F", "O_Soldier_LAT_F", "O_soldier_M_F", "O_Soldier_TL_F", "O_Soldier_AR_F", "O_Soldier_A_F", "O_medic_F"];
(["UK3CB_KRG_O_BTR60", GRAD_spawn_btr_1, "O_crew_F"] call grad_SR_fnc_Prequel_spawnVehicle) params ["_btr_1", "_btr_1_crewGroup"];
(["UK3CB_ADR_O_Hilux_Dshkm", GRAD_spawn_pickup_1, "O_Soldier_F", _pickupTransport] call grad_SR_fnc_Prequel_spawnVehicle) params ["_pickup_1", "_pickup_1_crewGroup", "_pickup_1_transportGroup"];
[_pickup_1, [0, "uk3cb_factions\addons\uk3cb_factions_vehicles\wheeled\uk3cb_factions_vehicles_hilux\data\ada_des_hilux_exterior_co.paa"]] remoteExec ["setObjectTexture", 0, _pickup_1];
(["UK3CB_ARD_O_GAZ_Vodnik", GRAD_spawn_vodnik, "O_Soldier_F", _vodnikTransport] call grad_SR_fnc_Prequel_spawnVehicle) params ["_vodnik", "_vodnik_crewGroup", "_vodnik_transportGroup"];
(["UK3CB_ADR_O_Hilux_Dshkm", GRAD_spawn_pickup_2, "O_Soldier_F", _pickupTransport] call grad_SR_fnc_Prequel_spawnVehicle) params ["_pickup_2", "_pickup_2_crewGroup", "_pickup_2_transportGroup"];
[_pickup_2, [0, "uk3cb_factions\addons\uk3cb_factions_vehicles\wheeled\uk3cb_factions_vehicles_hilux\data\ada_des_hilux_exterior_co.paa"]] remoteExec ["setObjectTexture", 0, _pickup_2];
// (["UK3CB_KRG_O_BTR60", GRAD_spawn_btr_2, "O_crew_F"] call grad_SR_fnc_Prequel_spawnVehicle) params ["_btr_2", "_btr_2_crewGroup"];

sleep 2;

private _approachPath = [];
private _startMarkerNumber = 1;
private _finishMarkerNumber = 21;
for "_i" from _startMarkerNumber to _finishMarkerNumber do
{
	private _marker = call(compile format ["GRAD_Approach_%1", _i]);
	private _speed = _marker getVariable ["GRAD_driveSpeed", 18];
	private _point = getPos _marker;
	// _point pushBack _speed;
	_approachPath pushBack _point;
};

private _pos123Path = [];
_finishMarkerNumber = 35;
for "_i" from _startMarkerNumber to _finishMarkerNumber do
{
	private _marker = call(compile format ["GRAD_Pos123_%1", _i]);
	private _speed = _marker getVariable ["GRAD_driveSpeed", 17];
	private _point = getPos _marker;
	// _point pushBack _speed;
	_pos123Path pushBack _point;
};

private _path = _approachPath + _pos123Path;

{
	_x params ["_veh", "_path"];
	_veh setDriveOnPath _path;
	[

	]
} forEach [[_btr_1, _path], [_pickup_1, _path], [_vodnik, _path], [_pickup_2, _path]];


_handle = 
[
	{
		params ["_vehicles", "_handle"];

		private _lead = _vehicles select 0;
		systemChat format["0: %1",(speed _lead) / 3.6];
		for "_i" from 1 to ((count _vehicles) - 1) do {
			private _veh = _vehicles select _i;
			private _inFront = _vehicles select (_i - 1);
			private _speedFront = (speed _inFront) / 3.6;
			private _dist = _veh distance _inFront;

			private _aim = (_dist / DISTANCE_TO_KEEP) * _speedFront;
			if (_dist > DISTANCE_TO_KEEP) then {
				_aim = (_aim * 0.6) min (_speedFront * 1.5);
			};
			_veh forceSpeed _aim;

			systemChat format["%1: %2", _i, _aim];
		};
	},
	1,
	[_btr_1, _pickup_1, _vodnik, _pickup_2]
] call CBA_fnc_addPerFrameHandler;
