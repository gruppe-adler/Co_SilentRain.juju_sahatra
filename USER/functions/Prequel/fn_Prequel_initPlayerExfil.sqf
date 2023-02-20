if (!isServer || !canSuspend) exitWith { _this remoteExec [_fnc_scriptName, 2]; };

private _heli = createVehicle ["gm_ge_army_ch53gs", [0, 0, 100], [], 0, "FLY"];
_heli allowDamage false;
private _heliCrew = createvehiclecrew _heli;
_heliCrew setBehaviour "CARELESS";

[_heli] call grad_SR_fnc_Prequel_playExfilData;

private _heliWaypoint = _heliCrew addWaypoint [[1978.56,6004.65,0], 0];
_heliWaypoint setWaypointType "SCRIPTED";
_heliWaypoint setWaypointScript "A3\functions_f\waypoints\fn_wpLand.sqf";

// STOP BOUNCE
[
	{
		params ["_heli"];
		isTouchingGround _heli
	},
	{
		params ["_heli"];
		
		private _handle = 
		[
			{
				params ["_args", "_handle"];
				_args params ["_heli"];
				private _vel = velocity _heli;
				_heli setVelocity [_vel # 0, _vel # 1, -1];
			},
			0,
			[_heli]
		] call CBA_fnc_addPerFrameHandler;
		
		[
			{
				params ["_handle"];
				[_handle] call CBA_fnc_removePerFrameHandler;
			},
			[_handle],
			5
		] call CBA_fnc_waitAndExecute;
	},
	[_heli]
] call CBA_fnc_waitUntilAndExecute;

// GEAR DOWN
[
	{
		params ["_heli"];
		_heli inArea [[1920.99,6010.21,0], 25, 25, 0, false, -1]
	},
	{
		params ["_heli"];
		_heli action ["LandGear", _heli];
	},
	[_heli]
] call CBA_fnc_waitUntilAndExecute;

waitUntil { missionNamespace getVariable ["GRAD_exfilTakeOff", false] };

// _heliCrew addWaypoint [[2029.7,5766.29,0], 0];
// _heliCrew addWaypoint [[1729.56,5767.34,0], 0];
_heliCrew addWaypoint [[419.525,7207.69,0], 0];