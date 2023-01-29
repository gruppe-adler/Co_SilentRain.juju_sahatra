params ["_position"];

private _car = "UK3CB_ADC_C_Datsun_Civ_Closed" createVehicle [0,0,0];
_car setVehiclePosition [_position, [], 0, "NONE"];

// textures killerkebap
{
	_x params ["_textureClassname", "_offset", "_vectorDirAndUp"];

	private _textureObj = _textureClassname createVehicle [0,0,0];
	_textureObj attachTo [_car, _offset];
	_textureObj setVectorDirAndUp _vectorDirAndUp;
	_textureObj setObjectTextureGlobal [0, "data\killerkebap.paa"];
	
} forEach [
	["UserTexture1m_F",[-0.765625,-1.3302,-0.0527267],[[0.999013,-0.0103125,0.0431965],[-0.0443619,-0.277213,0.959784]]],
	["UserTexture1m_F",[-0.0488281,1.84302,-0.324669],[[-0.0793171,-0.142189,-0.986657],[0.0135473,-0.989837,0.141558]]],
	["UserTexture1m_F",[0.755859,-1.1615,-0.024025],[[-0.999846,0.0122259,-0.0125945],[-0.0155997,-0.290006,0.956898]]]
];