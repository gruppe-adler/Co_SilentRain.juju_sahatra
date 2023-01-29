if ((side player) == east) then {
	player addAction [
        "<t color='#FF0000'>cheeki breeki iv damke</t>", 
        "USER\functions\hooker\fn_animSquat.sqf",
        nil,
        0,
        false,
        true,
        "",
        "(vehicle _this == _this) && !(_this getVariable ['grad_SR_animationRunning', false]) && speed _this < 1 && stance player == 'stand'"
        ];
};

player addEventHandler ["AnimDone", {
    params ["_unit", "_anim"];

    // hint str _anim;

    if (_anim == toLower "Acts_Executioner_Squat") then {
        [_unit] remoteExec ["grad_SR_fnc_hooker_animSquatEnd", 0];
    };

    if (_anim == toLower "Acts_Executioner_Squat_End") then {
        [_unit, ""] remoteExec ["switchMove", 0];
    };
}];
