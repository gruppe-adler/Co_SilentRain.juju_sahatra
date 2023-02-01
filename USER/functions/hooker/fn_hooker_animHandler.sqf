params ["_unit"];


_unit addEventHandler ["AnimDone", {
    params ["_unit", "_anim"];

    // hint str _anim;

    if (_anim == toLower "Acts_Executioner_Squat") then {
        [_unit] remoteExec ["grad_SR_fnc_hooker_animSquatEnd", 0];
    };

    if (_anim == toLower "Acts_Executioner_Squat_End") then {
        [_unit, ""] remoteExec ["switchMove", 0];
    };
}];
