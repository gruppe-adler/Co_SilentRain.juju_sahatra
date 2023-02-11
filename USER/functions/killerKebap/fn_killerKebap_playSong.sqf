params ["_car"];

if (isNull _car) exitWith {};
if (!alive _car) exitWith {};

private _song = _car say3d "kebapsong";

[{
	params ["_song", "_car"];
	isNull _song
},{
	params ["_song", "_car"];
	
	// repeat if car is still alive
	if (alive _car) then {
		[_car] call grad_sr_fnc_killerkebap_playSong;
	};

}, [_song, _car]] call CBA_fnc_waitUntilAndExecute;


[{
	params ["_song", "_car"];
	!alive _car
},{
	params ["_song", "_car"];
	
	deleteVehicle _song;

}, [_song, _car]] call CBA_fnc_waitUntilAndExecute;
