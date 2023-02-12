params ["_unit"];

private _currentEmotion = _unit getVariable ["grad_SR_emotion", "fear"];
private _newEmotion = "fear";

switch (_currentEmotion) do {
	case "fear": { _newEmotion = "seduce"; };
	case "seduce": { _newEmotion = "calm"; };
	case "calm": { _newEmotion = "fear"; };
	default { };
};

hint ("new emotion is now " + _newEmotion);

 _unit setVariable ["grad_SR_emotion", _newEmotion, true];
