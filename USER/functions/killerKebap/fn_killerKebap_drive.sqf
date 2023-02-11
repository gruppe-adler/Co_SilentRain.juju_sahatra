#define DISTANCE_TO_KEEP 20

if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };

params ["_veh"];

// Spawn units
private _killerKebapDriver = (createGroup civilian) createUnit ["UK3CB_TKC_C_WORKER", [0,0,0], [], 0, "FORM"];
_killerKebapDriver assignAsDriver _veh;
_killerKebapDriver moveInDriver _veh;
_killerKebapDriver setBehaviour "CARELESS";

sleep 2;

_killerKEbapdriver addUniform "UK3CB_ADC_C_Shorts_U_04";


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

		_path = _approachPath + _pos12Path;
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
	};
};

{
	_x params ["_veh", "_path"];
	_veh setDriveOnPath _path;
} forEach [[_veh, _path]];

_handle = 
[
	{
		params ["_vehiclesPaths", "_handle"];

		private _lead = (_vehiclesPaths select 0) select 0;
		private _leadPath = (_vehiclesPaths select 0) select 1;
		if (_lead inArea [_leadPath select ((count _leadPath) - 1), 5, 5, 0, false]) exitWith {
			for "_i" from 1 to ((count _vehiclesPaths) - 1) do {
				private _veh = (_vehiclesPaths select _i) select 0;
				_veh forceSpeed -18;				
			};
			systemChat "Stopping handler";
			[
				{
					params ["_veh"];
					_veh inArea [[2266.66,6617.2,0], 5, 5, 0, false]
				},
				{
					params ["_veh"];
					_veh forceSpeed 10;
					systemChat "slowing pickup 2";
				},
				[(_vehiclesPaths select 2) select 0]
			] call CBA_fnc_waitUntilAndExecute;

			[
				{
					params ["_veh"];
					_veh inArea [[2220.42,6543.28,0], 5, 5, 0, false]
				},
				{
					params ["_veh"];
					_veh forceSpeed 10;
					systemChat "slowing pickup 1";
				},
				[(_vehiclesPaths select 1) select 0]
			] call CBA_fnc_waitUntilAndExecute;			
			[_handle] call CBA_fnc_removePerFrameHandler;
		};

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
	0,
	[[_veh, _path]]
] call CBA_fnc_addPerFrameHandler;
