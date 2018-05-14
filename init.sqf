#define framework

#include "core\script_macros.hpp"
#include "core\init.sqf" 
#include "customization\settings.sqf" 
#include "core\dia\debug\dia_debug.sqf" 

if (isServer) then {

	"" call FNC_StartingCount; 

	[] spawn { //Spawns code running in parallel

		while {!FW_MissionEnded} do { //Loops while the mission is not ended
			
			#include "customization\endConditions.sqf" 
			
			//The time limit in minutes variable called FW_TimeLimit is set in customization/settings.sqf, to disable the time limit set it to 0
			if ((time / 60) >= FW_TimeLimit && FW_TimeLimit != 0) exitWith { //It is recommended that you do not remove the time limit end condition 
				
				FW_TimeLimitMessage call FNC_EndMission;
				
			};
		};	
	};
};

#include "modules\modules.sqf" 
#include "core\postChecks.sqf" 