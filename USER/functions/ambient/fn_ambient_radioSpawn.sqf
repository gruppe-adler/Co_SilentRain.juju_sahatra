params ["_position"];

private _radio = (selectRandom ["land_gm_euro_furniture_radio_01", "jbad_radio_b", "Land_FMradio_F"]) createVehicle [0,0,0];
_radio setPos _position;
_radio setDir (random 360);

private _source = createSoundSource [(selectRandom ["music1_sfx", "arabicsong1_sfx", "arabicsong2_sfx"]), _position, [], 0];
[_source, _radio, false] call grad_SR_fnc_ambient_soundSourceHelper;

{
	_x addCuratorEditableObjects [[_radio], false];
} forEach allCurators;

[_radio] remoteExec ["grad_sr_fnc_ambient_radioActions", 0, _radio];