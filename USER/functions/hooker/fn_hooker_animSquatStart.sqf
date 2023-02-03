params ["_unit"];

_unit setVariable ["grad_SR_animationRunning", true, true];

_unit switchMove "Acts_Executioner_Squat";

[{
    params ["_unit"];
    
    // move down quickly
    [{
        params ["_unit"];
        animationState _unit == toLower "Acts_Executioner_Squat"
    },{
        params ["_unit"];
        _unit setAnimSpeedCoef 5;
        _unit setMimic "hurt";

        [{
            params ["_unit"];
            animationState _unit == toLower "Acts_Executioner_Squat" && moveTime _unit > 1
        },{
            params ["_unit"];
            _unit setAnimSpeedCoef 1;

            [[_unit], "USER\functions\hooker\fn_hooker_pee.sqf"] remoteExec ["BIS_fnc_execVM", 0];
        }, [_unit]] call CBA_fnc_waitUntilAndExecute;

    }, [_unit]] call CBA_fnc_waitUntilAndExecute;

}, [_unit]] call CBA_fnc_execNextFrame;