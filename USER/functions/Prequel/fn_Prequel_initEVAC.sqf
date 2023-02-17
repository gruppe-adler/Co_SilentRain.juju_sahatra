#define DISTANCE_TO_KEEP 20

if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };

// Spawn units
private _pickupTransport = ["O_Soldier_TL_F", "O_Soldier_AR_F", "O_Soldier_LAT_F"];
private _vodnikTransport = ["O_Soldier_SL_F", "O_Soldier_F", "O_Soldier_LAT_F", "O_soldier_M_F", "O_Soldier_TL_F", "O_Soldier_AR_F", "O_Soldier_A_F", "O_medic_F"];
(["UK3CB_KRG_O_BTR60", GRAD_spawn_btr_1, "O_crew_F"] call grad_SR_fnc_Prequel_spawnVehicle) params ["_btr_1", "_btr_1_crewGroup"];
(["UK3CB_ADR_O_Hilux_Dshkm", GRAD_spawn_pickup_1, "O_Soldier_F", _pickupTransport] call grad_SR_fnc_Prequel_spawnVehicle) params ["_pickup_1", "_pickup_1_crewGroup", "_pickup_1_transportGroup"];
[_pickup_1, [0, "uk3cb_factions\addons\uk3cb_factions_vehicles\wheeled\uk3cb_factions_vehicles_hilux\data\ada_des_hilux_exterior_co.paa"]] remoteExec ["setObjectTexture", 0, _pickup_1];
(["UK3CB_ADR_O_Hilux_Dshkm", GRAD_spawn_pickup_2, "O_Soldier_F", _pickupTransport] call grad_SR_fnc_Prequel_spawnVehicle) params ["_pickup_2", "_pickup_2_crewGroup", "_pickup_2_transportGroup"];
[_pickup_2, [0, "uk3cb_factions\addons\uk3cb_factions_vehicles\wheeled\uk3cb_factions_vehicles_hilux\data\ada_des_hilux_exterior_co.paa"]] remoteExec ["setObjectTexture", 0, _pickup_2];
(["UK3CB_ARD_O_GAZ_Vodnik", GRAD_spawn_vodnik, "O_Soldier_F", _vodnikTransport] call grad_SR_fnc_Prequel_spawnVehicle) params ["_vodnik", "_vodnik_crewGroup", "_vodnik_transportGroup"];
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
private _stopPos = [];

if (!isMultiplayer) then {
	GRAD_WARLORD_POSITION = 2;
};
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
		_stopPos = _path select ((count _path) - 1);

		private _pos2_btr_path = [];
		_finishMarkerNumber = 11;
		for "_i" from _startMarkerNumber to _finishMarkerNumber do
		{
			private _marker = call(compile format ["GRAD_Pos2_btr_%1", _i]);
			private _point = getPos _marker;
			_pos2_btr_path pushBack _point;
		};
		_pathBtr_1 = _path + _pos2_btr_path;

		private _pos2_pickup1_path = [];
		_finishMarkerNumber = 39;
		for "_i" from _startMarkerNumber to _finishMarkerNumber do
		{
			private _marker = call(compile format ["GRAD_Pos2_pickup1_%1", _i]);
			private _point = getPos _marker;
			_pos2_pickup1_path pushBack _point;
		};
		_pathPickup_1 = _path + _pos2_pickup1_path;

		private _pos2_vodnik_path = [];
		_finishMarkerNumber = 40;
		for "_i" from _startMarkerNumber to _finishMarkerNumber do
		{
			private _marker = call(compile format ["GRAD_Pos2_vodnik_%1", _i]);
			private _point = getPos _marker;
			_pos2_vodnik_path pushBack _point;
		};
		_pathVodnik = _path + _pos2_vodnik_path;

		private _pos2_pickup2_path = [];
		_finishMarkerNumber = 31;
		for "_i" from _startMarkerNumber to _finishMarkerNumber do
		{
			private _marker = call(compile format ["GRAD_Pos2_pickup2_%1", _i]);
			private _point = getPos _marker;
			_pos2_pickup2_path pushBack _point;
		};
		_pathPickup_2 = _path + _pos2_pickup2_path;

		// SPECIAL SPEED ADJUSTMENTS
		// Prevent Pickup_1 from flying of the cliffs near the villa
		// [
		// 	{
		// 		params ["_vehs", "_pos"];
		// 		(_vehs select 0) inArea [_pos, 4, 4, 0, false]
		// 	},
		// 	{
		// 		params ["_vehs"];
				
		// 		{
		// 			_x forceSpeed 13;
		// 		} forEach _vehs;
		// 		systemChat ("limiting speed to " + str(13 * 3.6) + "kmh");
		// 	},
		// 	[[_btr_1, _pickup_1, _pickup_2, _vodnik], _stopPos]
		// ] call CBA_fnc_waitUntilAndExecute;		

		// HANDLE TRANSPORTS
		{
			_x params ["_veh", "_path", ["_grps", []], ["_vehStr", ""]];
			
			// if (_grps isEqualTo []) then { continue };

			// // HANDLE TRANSPORTS
			// [
			// 	{
			// 		params ["_veh", "_grps", "_path", "_vehStr"];
			// 		_veh inArea [_path select ((count _path) - 1), 10, 10, 0, false]
			// 	},
			// 	{
			// 		params ["_veh", "_grps", "_path", "_vehStr"];

			// 		[
			// 			{
			// 				params ["_veh", "_grps", "_vehStr"];
			// 				_grps params ["_crew", "_transport"];

			// 				private _unloadPos = AGLToASL (_veh getRelPos [10, 180]);
			// 				private _wp = _crew addWaypoint [_unloadPos, -1];
			// 				_wp setWaypointType "TR UNLOAD";
			// 				_wp setWaypointBehaviour "AWARE";

			// 				switch (_vehStr) do {
			// 					case "Pickup 1": {
			// 						private _attackWP = _transport addWaypoint [AGLToASL [2298.72,6582.42,0], -1];
			// 						_attackWP setWaypointType "SAD";
			// 						_attackWP setWaypointSpeed "FULL";
			// 						systemChat "Unloading Pickup 1";
			// 					};

			// 					case "Pickup 2": {
			// 						private _attackWP = _transport addWaypoint [AGLToASL [2247.92,6591.48,0], -1];
			// 						_attackWP setWaypointType "SAD";
			// 						_attackWP setWaypointSpeed "FULL";
			// 						systemChat "Unloading Pickup 2";
			// 					};
			// 					case "Vodnik": {
			// 						[_transport, [2295.96,6663.58,0], 50] spawn lambs_wp_fnc_taskCQB;
			// 						systemChat "Unloading Vodnik";
			// 					};
			// 				};
			// 			},
			// 			[_veh, _grps, _vehStr],
			// 			2
			// 		] call CBA_fnc_waitAndExecute;
			// 	},
			// 	[_veh, _grps, _path, _vehStr]
			// ] call CBA_fnc_waitUntilAndExecute
		} forEach [
					[_btr_1, _pathBtr_1],
					[_pickup_1, _pathPickup_1, [_pickup_1_crewGroup, _pickup_1_transportGroup], "Pickup 1"],
					[_pickup_2, _pathPickup_2, [_pickup_2_crewGroup, _pickup_2_transportGroup], "Pickup 2"],
					[_vodnik, _pathVodnik, [_vodnik_crewGroup, _vodnik_transportGroup], "Vodnik"]
				];

		_handle = 
		[
			{
				params ["_args", "_handle"];
				_args params ["_vehicles", "_stopPos"];

				private _lead = _vehicles select 0;
				if (_lead inArea [_stopPos, 20, 20, 0, false]) exitWith {
					for "_i" from 0 to ((count _vehicles) - 1) do {
						private _veh = _vehicles select _i;
						_veh forceSpeed 16;				
					};
					systemChat "stopping convoy spacing";
					[_handle] call CBA_fnc_removePerFrameHandler;
				};

				// systemChat format["0: %1",(speed _lead) / 3.6];
				for "_i" from 1 to ((count _vehicles) - 1) do {
					private _veh = _vehicles select _i;
					private _inFront = _vehicles select (_i - 1);
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
			[[_btr_1, _pickup_1, _pickup_2, _vodnik], _stopPos]
		] call CBA_fnc_addPerFrameHandler;
	};

	case 3: {
		systemChat "Warlord Position 3";

		// CREATE PATHS
		private _pos3Path = [];
		_finishMarkerNumber = 22;
		for "_i" from _startMarkerNumber to _finishMarkerNumber do
		{
			private _marker = call(compile format ["GRAD_Pos3_%1", _i]);
			private _point = getPos _marker;
			_pos3Path pushBack _point;
		};

		_path = _approachPath + _pos3Path;
		_stopPos = _pos3Path select ((count _pos3Path) - 1);

		private _pos3_btr_path = [];
		_finishMarkerNumber = 17;
		for "_i" from _startMarkerNumber to _finishMarkerNumber do
		{
			private _marker = call(compile format ["GRAD_Pos3_btr_%1", _i]);
			private _point = getPos _marker;
			_pos3_btr_path pushBack _point;
		};
		_pathBtr_1 = _path + _pos3_btr_path;

		private _pos3_pickup1_path = [];
		_finishMarkerNumber = 20;
		for "_i" from _startMarkerNumber to _finishMarkerNumber do
		{
			private _marker = call(compile format ["GRAD_Pos3_pickup1_%1", _i]);
			private _point = getPos _marker;
			_pos3_pickup1_path pushBack _point;
		};
		_pathPickup_1 = _path + _pos3_pickup1_path;

		private _pos3_vodnik_path = [];
		_finishMarkerNumber = 12;
		for "_i" from _startMarkerNumber to _finishMarkerNumber do
		{
			private _marker = call(compile format ["GRAD_Pos3_vodnik_%1", _i]);
			private _point = getPos _marker;
			_pos3_vodnik_path pushBack _point;
		};
		_pathVodnik = _path + _pos3_vodnik_path;

		private _pos3_pickup2_path = [];
		_finishMarkerNumber = 15;
		for "_i" from _startMarkerNumber to _finishMarkerNumber do
		{
			private _marker = call(compile format ["GRAD_Pos3_pickup2_%1", _i]);
			private _point = getPos _marker;
			_pos3_pickup2_path pushBack _point;
		};
		_pathPickup_2 = _path + _pos3_pickup2_path;

		// SPECIAL SPEED ADJUSTMENTS
		// Prevent Pickup_1 from flying of the cliffs near the villa
		[
			{
				params ["_veh"];
				_veh inArea [[2343.53,6725.28,0], 5, 5, 0, false]
			},
			{
				params ["_veh"];
				_veh forceSpeed 15;
				[
					{
						params ["_veh"];
						_veh forceSpeed -1;
					},
					[_veh],
					5
				] call CBA_fnc_waitAndExecute;
			},
			[_pickup_1]
		] call CBA_fnc_waitUntilAndExecute;

		// HANDLE TRANSPORTS
		{
			_x params ["_veh", "_path", ["_grps", []], ["_vehStr", ""]];
			
			if (_grps isEqualTo []) then { continue };
			
			[
				{
					params ["_veh", "_grps", "_path", "_vehStr"];
					_veh inArea [_path select ((count _path) - 1), 10, 10, 0, false]
				},
				{
					params ["_veh", "_grps", "_path", "_vehStr"];

					[
						{
							params ["_veh", "_grps", "_vehStr"];
							_grps params ["_crew", "_transport"];

							private _unloadPos = AGLToASL (_veh getRelPos [10, 180]);
							private _wp = _crew addWaypoint [_unloadPos, -1];
							_wp setWaypointType "TR UNLOAD";
							_wp setWaypointBehaviour "AWARE";

							switch (_vehStr) do {
								case "Pickup 1": {
									private _attackWP = _transport addWaypoint [AGLToASL [2298.72,6582.42,0], -1];
									_attackWP setWaypointType "SAD";
									_attackWP setWaypointSpeed "FULL";
									systemChat "Unloading Pickup 1";
								};

								case "Pickup 2": {
									private _attackWP = _transport addWaypoint [AGLToASL [2247.92,6591.48,0], -1];
									_attackWP setWaypointType "SAD";
									_attackWP setWaypointSpeed "FULL";
									systemChat "Unloading Pickup 2";
								};
								case "Vodnik": {
									[_transport, [2295.96,6663.58,0], 50] spawn lambs_wp_fnc_taskCQB;
									systemChat "Unloading Vodnik";
								};
							};
						},
						[_veh, _grps, _vehStr],
						2
					] call CBA_fnc_waitAndExecute;
				},
				[_veh, _grps, _path, _vehStr]
			] call CBA_fnc_waitUntilAndExecute
		} forEach [
					[_btr_1, _pathBtr_1],
					[_pickup_1, _pathPickup_1, [_pickup_1_crewGroup, _pickup_1_transportGroup], "Pickup 1"],
					[_pickup_2, _pathPickup_2, [_pickup_2_crewGroup, _pickup_2_transportGroup], "Pickup 2"],
					[_vodnik, _pathVodnik, [_vodnik_crewGroup, _vodnik_transportGroup], "Vodnik"]
				];

		_handle = 
		[
			{
				params ["_args", "_handle"];
				_args params ["_vehicles", "_stopPos"];

				private _lead = _vehicles select 0;
				if (_lead inArea [_stopPos, 20, 20, 0, false]) exitWith {
					for "_i" from 1 to ((count _vehicles) - 1) do {
						private _veh = _vehicles select _i;
						_veh forceSpeed -1;				
					};
					systemChat "stopping convoy spacing";
					[_handle] call CBA_fnc_removePerFrameHandler;
				};

				// systemChat format["0: %1",(speed _lead) / 3.6];
				for "_i" from 1 to ((count _vehicles) - 1) do {
					private _veh = _vehicles select _i;
					private _inFront = _vehicles select (_i - 1);
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
			[[_btr_1, _pickup_1, _pickup_2, _vodnik], _stopPos]
		] call CBA_fnc_addPerFrameHandler;
	};
};


// START DRIVING
{
	_x params ["_veh", "_path"];
	_veh setDriveOnPath _path;
} forEach [[_btr_1, _pathBtr_1], [_pickup_1, _pathPickup_1], [_pickup_2, _pathPickup_2], [_vodnik, _pathVodnik]];
