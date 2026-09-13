class CfgPatches
{
	class fnf_medicalChanges
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"ace_medical_damage"};
	};
};

class ACE_Medical_Injuries {
	class damageTypes {
		class bullet {
			class Avulsion {
				weighting[] = {{1, 1}, {0, 0}};
			};

			delete Contusion;

			class VelocityWound {
				weighting[] = {{1.5, 0}, {1.5, 1}, {0, 0}};
			};
		};
	};
};
