params ["_marker"];

private _car = "UK3CB_ADC_C_Datsun_Civ_Closed" createVehicle [0,0,0];
private _point = getPos _marker;
private _dir = getDir _marker;
_car setVehiclePosition [_point, [], 0, "NONE"];
_car setDir _Dir;

// textures killerkebap
_car setObjectTextureGlobal [0, "data\datsun_killerkebap_co.paa"];
_car setObjectTextureGlobal [1, "data\datsun_killerkebap_box_co.paa"];

[_car] remoteExec ["grad_SR_fnc_killerkebap_playSong", [0, -2] select isDedicated, _car];
_car setVariable ["songPlaying", true, true];

[_car] spawn grad_SR_fnc_killerKebap_drive;

_car addMPEventHandler ["MPKilled", {
    params ["_unit", "_killer", "_instigator", "_useEffects"];

    if (local _unit) then {
        _unit setVariable ["songPlaying", false, true]; 
    };
}];