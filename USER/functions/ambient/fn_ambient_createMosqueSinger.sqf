params ["_position"];


private _minarets = nearestObjects [_position, ["Land_A_Mosque_big_minaret_2_dam_EP1", "Land_A_Mosque_big_minaret_2_EP1", "Jbad_A_Minaret", "Jbad_A_Minaret_porto"], 50];

if (count _minarets > 0) then {

        private _minaret = _minarets#0;

        private _buildingPositions = [_minaret] call BIS_fnc_buildingPositions;

        private _posIndex = 0;
        private _highestPos = 0;

        {
            if (_x#2 > _highestPos) then {
                    _posIndex = _foreachindex;
                    _highestPos = _x#2;
            };
        } forEach _buildingPositions;



        private _unit = (createGroup civilian) createUnit ["UK3CB_TKC_C_SPOT", [0,0,0], [], 0, "NONE"];
        _unit setPos (_buildingPositions select _posIndex);
        _unit setUnitLoadout [[], 
        [], 
        [], 
        ["UK3CB_ADC_C_U_01_F",[]], 
        [], 
        [],"UK3CB_TKM_B_H_Turban_02_1","fsob_Beard01_Dark",["Binocular","","","",[], 
        [],""], 
        ["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]];
        doStop _unit;
        _unit setVariable ["lambs_danger_disableAI", true, true];

        _unit setDir ((_unit getDir _minaret) - 180);


        private _source = createSoundSource ["adhan_sfx", getPos _unit, [], 0];
        private _helper = [_source, _unit, false] call grad_SR_fnc_ambient_soundSourceHelper;
        [
            {
                params ["_source", "_helper", "_unit"];
                if (!isNull _source && !isNull _helper) then {
                    if (_unit isEqualTo _helper) then {
                        deleteVehicle _source;
                    } else {
                        deleteVehicle _helper;
                    };
                };
            },
            [_source, _helper, _unit],
            249
        ] call CBA_fnc_waitAndExecute;

        [_unit, "Acts_JetsMarshallingStop_loop"] remoteExec ["switchMove"];

        _unit disableAI "FSM";
        _unit disableAI "MOVE";
        _unit setCaptive true;
        _unit disableAI "autoTarget";
        _unit disableAI "ANIM";
        _unit setCaptive true;

        _unit addHeadgear "CUP_H_TKI_Lungee_Open_04";

        private _pfh = [{
            params ["_args", "_handle"];
            _args params ["_unit", "_source"];

            if (isNull _source) exitWith {
                [_unit, "Acts_JetsMarshallingStop_out"] remoteExec ["switchMove"];
                [_handle] call CBA_fnc_removePerFrameHandler;
            };

            if (!alive _unit || lifeState _unit == "INCAPACITATED") exitWith {
                _unit setDamage 1;
                [_handle] call CBA_fnc_removePerFrameHandler;
            };

            [_unit, "Acts_JetsMarshallingStop_loop"] remoteExec ["switchMove"];

        }, 2, [_unit, _source]] call CBA_fnc_addPerFrameHandler;

};