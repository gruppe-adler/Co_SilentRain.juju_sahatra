if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };

params ["_veh"];

// Spawn units
private _killerKebapDriver = (createGroup civilian) createUnit ["UK3CB_TKC_C_WORKER", [0,0,0], [], 0, "FORM"];
_killerKebapDriver assignAsDriver _veh;
_killerKebapDriver moveInDriver _veh;
_killerKebapDriver setBehaviour "CARELESS";

sleep 1;

_killerKebapDriver addUniform "UK3CB_ADC_C_Shorts_U_04";
[_killerKebapDriver, "khalil"] remoteExec ["setIdentity", 0, _killerKebapDriver];
[_killerKebapDriver] call ace_common_fnc_setName;

_killerKebapDriver addMPEventHandler ["MPKilled", { 
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	
	if (local _unit) then {
		[_unit] call grad_SR_fnc_killerKebap_dropKebap;
	};
 }];

[_killerKebapDriver, "khalil"] remoteExec ["grad_SR_fnc_customInteractions_addAction", [0,-2] select isDedicated, _killerKebapDriver];
[_killerKebapDriver, "khalil"] remoteExec ["grad_SR_fnc_killerKebap_driverAddActions", [0,-2] select isDedicated, _killerKebapDriver];



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

if (!isMultiplayer) then {
	GRAD_WARLORD_POSITION = 1;
};
switch (GRAD_WARLORD_POSITION) do {
	case 1: {
		systemChat "Warlord Position 1";

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

		_path = _approachPath + _pos12Path;

		private _pos1_pickup2_path = [];
		_finishMarkerNumber = 7;
		for "_i" from _startMarkerNumber to _finishMarkerNumber do
		{
			private _marker = call(compile format ["GRAD_Pos1_pickup2_%1", _i]);
			private _point = getPos _marker;
			_pos1_pickup2_path pushBack _point;
		};
		_path = _path + _pos1_pickup2_path;		
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

		private _pos2Path = [];
		_finishMarkerNumber = 4;
		for "_i" from _startMarkerNumber to _finishMarkerNumber do
		{
			private _marker = call(compile format ["GRAD_Pos2_%1", _i]);
			// private _speed = _marker getVariable ["GRAD_driveSpeed", 17];
			private _point = getPos _marker;
			// _point pushBack _speed;
			_pos2Path pushBack _point;
		};		

		_path = _approachPath + _pos12Path + _pos2Path;

		private _pos2_pickup1_path = [];
		_finishMarkerNumber = 38;
		for "_i" from _startMarkerNumber to _finishMarkerNumber do
		{
			private _marker = call(compile format ["GRAD_Pos2_pickup1_%1", _i]);
			private _point = getPos _marker;
			_pos2_pickup1_path pushBack _point;
		};
		_path = _path + _pos2_pickup1_path;
	};

	case 3: {
		systemChat "Warlord Position 3";

		private _pos3Path = [];
		_finishMarkerNumber = 22;
		for "_i" from _startMarkerNumber to _finishMarkerNumber do
		{
			private _marker = call(compile format ["GRAD_Pos3_%1", _i]);
			private _point = getPos _marker;
			_pos3Path pushBack _point;
		};

		private _pos3_btr_path = [];
		_finishMarkerNumber = 17;
		for "_i" from _startMarkerNumber to _finishMarkerNumber do
		{
			private _marker = call(compile format ["GRAD_Pos3_btr_%1", _i]);
			private _point = getPos _marker;
			_pos3_btr_path pushBack _point;
		};		

		_path = _approachPath + _pos3Path + _pos3_btr_path;
	};
};

{
	_x params ["_veh", "_path"];
	_veh setDriveOnPath _path;
	// slow down on arrival in Nasul
	[
		{
			params ["_veh"];
			_veh inArea [[2383.24,6271.28,14.7667], 300, 500, 155.394, false]
		},
		{
			params ["_veh"];
			_veh limitSpeed 30;
		},
		[_veh]
	] call CBA_fnc_waitUntilAndExecute;
} forEach [[_veh, _path]];
