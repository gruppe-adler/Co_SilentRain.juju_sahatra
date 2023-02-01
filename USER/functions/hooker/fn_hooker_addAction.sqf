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

