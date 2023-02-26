params ["_radio"];

_radio addAction
	[
		"<t color='#3366FF'>Switch Radio ON</t>",	// title
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script

			if (_target getVariable ['destroyed', false]) exitWith {
				hint "Radio is broken";
			};

			[_target, true] call grad_SR_fnc_ambient_radioToggle;
			
		},
		nil,		// arguments
		6,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"isNull (_target getVariable ['soundSource', objNull]) && !(_target getVariable ['destroyed', false])", 	// condition
		1.5,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	];

_radio addAction
	[
		"<t color='#FF6633'>Switch Radio OFF</t>",	// title
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script
			
			if (_target getVariable ['destroyed', false]) exitWith {
				hint "Radio is broken";
			};

			[_target, false] call grad_SR_fnc_ambient_radioToggle;
			
		},
		nil,		// arguments
		6,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"!isNull (_target getVariable ['soundSource', objNull])", 	// condition
		1.5,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	];
