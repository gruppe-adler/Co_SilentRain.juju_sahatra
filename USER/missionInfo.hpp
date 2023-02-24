/*
*   Legt allgemeine Information über die Mission fest.
*/

author = "Jules + nomi für Gruppe Adler";                                               // Missionsersteller
onLoadName = "CO Silent Rain";                                                   // Name der Mission
onLoadMission = "";                                                             // Beschreibung der Mission (wird im Ladebildschirm unterhalb des Ladebildes angezeigt)
loadScreen = "data\loadpic.paa";                                                // Ladebild
overviewPicture = "";                                                           // Bild, das in der Missionsauswahl angezeigt wird
overviewText = "";                                                              // Text, der in der Missionsauswahl angezeigt wird

class CfgIdentities
{
	class qasim
	{
		face = "PersianHead_A3_01_sick";
		glasses = "fsob_Beard03_Dark";
		name = "Lord Qasim";
		nameSound = "Lord Qasim";
		pitch = 1.0;
		speaker = "Male01PER";
	};

	class qasim_bg1
	{
		face = "PersianHead_A3_02_sick";
		glasses = "";
		name = "Bodyguard of Lord Qasim";
		nameSound = "Bodyguard of Lord Qasim";
		pitch = 1.0;
		speaker = "Male01PER";
	};

	class qasim_bg2
	{
		face = "PersianHead_A3_02_sick";
		glasses = "";
		name = "Bodyguard of Lord Qasim";
		nameSound = "Bodyguard of Lord Qasim";
		pitch = 1.0;
		speaker = "Male01PER";
	};

	class nadia
	{
		face = "max_female8";
		glasses = "";
		name = "Nadia";
		nameSound = "Hooker of Lord Qasim";
		pitch = 1.0;
		speaker = "Male01PER";
	};

	class khalil
	{
		face = "AsianHead_A3_02";
		glasses = "";
		name = "Khalil";
		nameSound = "Bringer of the Killer Kebap";
		pitch = 1.0;
		speaker = "Male01PER";
	};
};