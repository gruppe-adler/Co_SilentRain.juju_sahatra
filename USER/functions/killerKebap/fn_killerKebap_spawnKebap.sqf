params ["_unit"];

private _kebapbox = "EauDeCombat_01_box_F" createVehicle [0,0,0];
_kebapbox setObjectTextureGlobal [0, "data\kebapbox.paa"];

[_kebapbox] remoteExec ["grad_SR_fnc_killerKebap_kebapAddActions", [0,-2] select isDedicated, _kebapbox];



_kebapbox
