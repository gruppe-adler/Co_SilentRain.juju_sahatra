/*
*   Hier können eigene Sounds eingebunden werden.
*   Ist in CfgSounds included.
*/

class food_call
{
	name	= "food_call";
	sound[]	= {"\USER\sounds\Food_Call.ogg", db + 10, 1.0 };
	titles[] = {};
};

class escort_call
{
	name	= "escort_call";
	sound[]	= {"\USER\sounds\Escort_Call.ogg", db + 10, 1.0 };
	titles[] = {};
};

class evac_call_combat
{
	name	= "evac_call_combat";
	sound[]	= {"\USER\sounds\EVAC_call_combat.ogg", db + 10, 1.0 };
	titles[] = {};
};

class evac_call_normal
{
	name	= "evac_call_normal";
	sound[]	= {"\USER\sounds\EVAC_call_normal.ogg", db + 10, 1.0 };
	titles[] = {};
};


// NADIA
class nadia_pee
{
	name	= "nadia_pee";
	sound[]	= {"\USER\sounds\nadia_pee.ogg", db + 10, 1.0 };
	titles[] = {};
};

class nadia_peeBefore_1_fear
{
	name	= "nadia_peeBefore_1_fear";
	sound[]	= {"\USER\sounds\nadia_peeBefore_1_fear.ogg", db + 10, 1.0 };
	titles[] = {
			1, "<t color='#ff0000' shadow='2'>I need to pee</t>"
		};

	forceTitles = true;            // will display titles even if global show titles option is off
	titlesFont = "RobotoCondensed";        // titles font family
	titlesSize = 0.1;            // titles font size
	titlesStructured = true;    // treat titles as Structured Text 
};

class nadia_peeAfter_1_calm
{
	name	= "nadia_peeAfter_1_calm";
	sound[]	= {"\USER\sounds\nadia_peeAfter_1_calm.ogg", db + 10, 1.0 };
	titles[] = {
			1, "<t color='#ff0000' shadow='2'>Ah, that was necessary</t>"
		};

	forceTitles = true;            // will display titles even if global show titles option is off
	titlesFont = "RobotoCondensed";        // titles font family
	titlesSize = 0.1;            // titles font size
	titlesStructured = true;    // treat titles as Structured Text 
};


// KILLERKEBAP
class kebapsong
{
	name	= "kebapsong";
	sound[]	= {"\USER\sounds\kebapsong.ogg", db + 10, 1.0 };
	titles[] = {};
};