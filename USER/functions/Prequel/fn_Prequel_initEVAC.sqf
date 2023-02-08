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
	// private _speed = _marker getVariable ["GRAD_driveSpeed", 18];
	private _point = getPos _marker;
	// _point pushBack _speed;
	_approachPath pushBack _point;
};

private _path = [];
private _pathBtr_1 = [];
private _pathPickup_1 = [];
private _pathVodnik = [];
private _pathPickup_2 = [];

GRAD_WARLORD_POSITION = 3;
switch (GRAD_WARLORD_POSITION) do {
	case 1: {
		systemChat "Warlord Position 1";
	};

	case 2:{
		systemChat "Warlord Position 2";

		private _pos12Path = [];
		_finishMarkerNumber = 42;
		for "_i" from _startMarkerNumber to _finishMarkerNumber do
		{
			private _marker = call(compile format ["GRAD_Pos12_%1", _i]);
			// private _speed = _marker getVariable ["GRAD_driveSpeed", 17];
			private _point = getPos _marker;
			// _point pushBack _speed;
			_pos12Path pushBack _point;
		};

		private _path = _approachPath + _pos12Path;
	};

	case 3: {
		systemChat "Warlord Position 3";

		private _pos3Path = [];
		_finishMarkerNumber = 34;
		for "_i" from _startMarkerNumber to _finishMarkerNumber do
		{
			private _marker = call(compile format ["GRAD_Pos3_%1", _i]);
			private _point = getPos _marker;
			_pos3Path pushBack _point;
		};

		_path = _approachPath + _pos3Path;

		private _pos3_btr_path = [];
		_finishMarkerNumber = 2;
		for "_i" from _startMarkerNumber to _finishMarkerNumber do
		{
			private _marker = call(compile format ["GRAD_Pos3_btr_%1", _i]);
			private _point = getPos _marker;
			_pos3_btr_path pushBack _point;
		};
		_pathBtr_1 = _path + _pos3_btr_path;

		private _pos3_pickup1_path = [];
		_finishMarkerNumber = 9;
		for "_i" from _startMarkerNumber to _finishMarkerNumber do
		{
			private _marker = call(compile format ["GRAD_Pos3_pickup1_%1", _i]);
			private _point = getPos _marker;
			_pos3_pickup1_path pushBack _point;
		};
		_pathPickup_1 = _path + _pos3_pickup1_path;

		private _pos3_vodnik_path = [];
		_finishMarkerNumber = 13;
		for "_i" from _startMarkerNumber to _finishMarkerNumber do
		{
			private _marker = call(compile format ["GRAD_Pos3_vodnik_%1", _i]);
			private _point = getPos _marker;
			_pos3_vodnik_path pushBack _point;
		};
		_pathVodnik = _path + _pos3_vodnik_path;

		private _pos3_pickup2_path = [];
		_finishMarkerNumber = 16;
		for "_i" from _startMarkerNumber to _finishMarkerNumber do
		{
			private _marker = call(compile format ["GRAD_Pos3_pickup2_%1", _i]);
			private _point = getPos _marker;
			_pos3_pickup2_path pushBack _point;
		};
		_pathPickup_2 = _path + _pos3_pickup2_path;

		missionNamespace setVariable ["GRAD_EVAC_vehiclesPaths", [[_btr_1, _pathBtr_1], [_pickup_1, _pathPickup_1], [_vodnik, _pathVodnik], [_pickup_2, _pathPickup_2]], true];
	};
};


{
	_x params ["_veh", "_path"];
	_veh setDriveOnPath _path;
} forEach [[_btr_1, _pathBtr_1], [_pickup_1, _pathPickup_1], [_vodnik, _pathVodnik], [_pickup_2, _pathPickup_2]];

_handle = 
[
	{
		params ["_args", "_handle"];

		private _vehiclesPaths = missionNamespace getVariable ["GRAD_EVAC_vehiclesPaths", []];
	
		private _lead = (_vehiclesPaths select 0) select 0;
		_lead forceSpeed -1;
		private _leadPath = (_vehiclesPaths select 0) select 1;
		systemChat str _lead;
		if (_lead inArea [_leadPath select ((count _leadPath) - 1), 5, 5, 0, false]) then {
			_vehiclesPaths deleteAt 0;
			missionNamespace setVariable ["GRAD_EVAC_vehiclesPaths", _vehiclesPaths, true];
		};

		if (_vehiclesPaths isEqualTo []) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };

		// systemChat format["0: %1",(speed _lead) / 3.6];
		for "_i" from 1 to ((count _vehiclesPaths) - 1) do {
			private _veh = (_vehiclesPaths select _i) select 0;
			private _inFront = (_vehiclesPaths select (_i - 1)) select 0;
			private _speedFront = (speed _inFront) / 3.6;
			private _dist = _veh distance _inFront;

			private _aim = (_dist / DISTANCE_TO_KEEP) * _speedFront;
			if (_dist > DISTANCE_TO_KEEP) then {
				_aim = (_aim * 0.6) min (_speedFront * 1.3);
			};
			_veh forceSpeed _aim;

			// systemChat format["%1: %2", _i, _aim];
		};
	},
	1,
	[]
] call CBA_fnc_addPerFrameHandler;
