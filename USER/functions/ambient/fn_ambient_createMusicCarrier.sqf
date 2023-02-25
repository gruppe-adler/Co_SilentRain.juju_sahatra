params ["_position"];

private _unit = (createGroup civilian) createUnit ["UK3CB_TKC_C_CIV", _position, [], 0, "NONE"];
_unit setPos _position;
_unit disableAI "FSM";
private _radio = "land_gm_euro_furniture_radio_01" createVehicle [0,0,0];
_radio attachTo [_unit,[-0.03,-0.06,-0.19],"RightHand"];
_radio setVectorDirAndUp [[1,0,0],[0,0,1]];

private _music = selectRandom [
    "music1_sfx",
    "arabicsong1_sfx",
    "arabicsong2_sfx"

];

{
    _radio disableCollisionWith _x;
} forEach (playableUnits + switchableUnits + [_unit]);


private _source = createSoundSource [_music, _position, [], 0];
[_source, _radio, false] call grad_SR_fnc_ambient_soundSourceHelper;