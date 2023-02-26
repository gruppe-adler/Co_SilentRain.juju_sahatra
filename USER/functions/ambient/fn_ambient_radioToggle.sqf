params ["_radio", "_switchOn"];

if (_switchOn) then {
	private _source = createSoundSource [(selectRandom ["music1_sfx", "arabicsong1_sfx", "arabicsong2_sfx"]), position _radio, [], 0];
	[_source, _radio, false, true] call grad_SR_fnc_ambient_soundSourceHelper;
} else {
	deleteVehicle (_radio getVariable ["soundSource", objNull]);
};