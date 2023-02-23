params ["_car"];

// MIND THIS IS LOCAL
// ALIVE and songPlaying is handled by driver/server

if (isNull _car) exitWith {};
if (!alive _car) exitWith {};

private _song = _car say3d ["kebapsong", 200];

[{
	params ["_song", "_car"];
	isNull _song
},{
	params ["_song", "_car"];

	private _songPlaying = _car getVariable ["songPlaying", false];
	if (_songPlaying) then {
		[_car] call grad_sr_fnc_killerkebap_playSong;
	};

}, [_song, _car]] call CBA_fnc_waitUntilAndExecute;


[{
	params ["_song", "_car"];
	private _songPlaying = _car getVariable ["songPlaying", false];
	!_songPlaying
},{
	params ["_song", "_car"];
	
	if (!isNull _song) then {
		deleteVehicle _song;
	};

}, [_song, _car]] call CBA_fnc_waitUntilAndExecute;
