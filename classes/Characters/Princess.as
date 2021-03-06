﻿package classes.Characters 
{
	import classes.CockClass;
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Items.Melee.TaivrasSpear;
	import classes.Items.Protection.ReaperArmamentsMarkIShield;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.ItemSlotClass;
	import classes.kGAMECLASS;
	import classes.Util.RandomInCollection;
	
	import classes.Items.Guns.HammerPistol;
	import classes.Items.Guns.EagleHandgun;
	import classes.Items.Guns.LaserPistol;
	
	import classes.GLOBAL;

	/**
	 * ...
	 * @author Gedan
	 */
	
	public class Princess extends Creature
	{
		
		public function Princess() 
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true; // Setting this will stop a given NPC class from ever being serialized.
			
			this.short = "princess";
			this.originalRace = "nyrea";
			this.a = "the ";
			this.capitalA = "The ";
			this.tallness = 72;
			this.scaleColor = "green";
			
			this.long = "The nyrean princess glares at you from across the room, her boytoys taking refuge in the shadowed recesses of the chamber. The citrine gems interwoven into her slender head-spikes have shifted with her clumsy attempts at combat so that they hang askew, less like a regal crown and more like a classless harlot’s glass jewelry. It is a sight that is nonetheless steeped in sexuality, even if it has been overlaid in bandoleers of red myrmedion drug-spit. You almost wish you had the time to admire how her heaving bust is just this side of too large for her frame, but if you’re going to get out of here without joining her harem, you’d best keep your eyes on the fight.";
			
			this.plural = false;
			
			this.shield = new EmptySlot();
			this.meleeWeapon = new TaivrasSpear();
			
			this.physiqueRaw = 20;
			this.reflexesRaw = 20;
			this.aimRaw = 29;
			this.intelligenceRaw = 10;
			this.willpowerRaw = 5;
			this.libidoRaw = 60;
			this.shieldsRaw = this.shieldsMax();
			this.energyRaw = 100;
			this.lustRaw = 5;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.damageValue = 25.0;
			baseHPResistances.electric.damageValue = 25.0;
			baseHPResistances.burning.damageValue = 25.0;
			
			this.XPRaw = 600;
			this.level = 7;
			this.credits = 0;
			this.HPMod = 55;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();
			
			this.femininity = 90;
			this.eyeType = 0;
			this.eyeColor = "red";
			this.thickness = 40;
			this.tone = 29;
			this.hairColor = "red";
			this.furColor = "tawny";
			this.hairLength = 0;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SCALES;
			this.skinTone = "pink";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_NYREA;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_NYREA;
			this.lipMod = 1;
			this.earType = GLOBAL.TYPE_NYREA;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_NYREA;
			this.legCount = 2;
			this.legFlags = [];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = 0;
			this.tailCount = 0;
			this.tailFlags = [];
			
			//Used to set cunt or dick type for cunt/dick tails!
			this.tailGenitalArg = 0;
			//tailGenital:
			//0 - none.
			//1 - cock
			//2 - vagina
			this.tailGenital = 0;
			//Tail venom is a 0-100 slider used for tail attacks. Recharges per hour.
			this.tailVenom = 0;
			//Tail recharge determines how fast venom/webs comes back per hour.
			this.tailRecharge = 5;
			//hipRating
			//0 - boyish
			//2 - slender
			//4 - average
			//6 - noticable/ample
			//10 - curvy//flaring
			//15 - child-bearing/fertile
			//20 - inhumanly wide
			this.hipRatingRaw = 10;
			//buttRating
			//0 - buttless
			//2 - tight
			//4 - average
			//6 - noticable
			//8 - large
			//10 - jiggly
			//13 - expansive
			//16 - huge
			//20 - inconceivably large/big/huge etc
			this.buttRatingRaw = 10;
			//No dicks here!
			this.cocks = new Array();
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 1.5;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 2;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 4;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9999;
			this.minutesSinceCum = 9000;
			this.timesCum = 122;
			this.cockVirgin = true;
			this.vaginalVirgin = false;
			this.analVirgin = true;
			//Goo is hyper friendly!
			this.elasticity = 3;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 6;
			this.nippleColor = "green";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 1;
			
			this.hairLength = 10;
			
			this.cocks = [];
			this.cocks.push(new CockClass());
			(this.cocks[0] as CockClass).cType = GLOBAL.TYPE_NYREA;
			(this.cocks[0] as CockClass).cLengthRaw = 8;
			(this.cocks[0] as CockClass).cThicknessRatioRaw = 1.66;
			(this.cocks[0] as CockClass).addFlag(GLOBAL.FLAG_KNOTTED);
			(this.cocks[0] as CockClass).virgin = false;
			this.cockVirgin = false;
			createStatusEffect("Force Fem Gender");
			this.createStatusEffect("Flee Disabled",0,0,0,0,true,"","",false,0);
			this.createStatusEffect("Disarm Immune");
			
			this._isLoading = false;
		}
		
		override public function prepForCombat():void
		{
			var nyrea:Princess = this.makeCopy();
			
			nyrea.tallness = 68 + (rand(12) - 6);
			nyrea.rangedWeapon = new (RandomInCollection(EagleHandgun, HammerPistol, LaserPistol))();
			
			nyrea.sexualPreferences.setRandomPrefs(7,1);

			nyrea.inventory.push(new ReaperArmamentsMarkIShield());
			//else if(rand(50) == 0) nyrea.inventory.push(new Satyrite());
			//else if(rand(20) == 0) nyrea.inventory.push(new Picardine());
			//else if (rand(20) == 0)	nyrea.inventory.push(nyrea.rangedWeapon.makeCopy());
			//else if (rand(20) == 0) nyrea.inventory.push(nyrea.meleeWeapon.makeCopy());
			kGAMECLASS.showName("FIGHT:\nPRINCESS");
			kGAMECLASS.showBust("PRINCESS_BANDOLEER");
			kGAMECLASS.foes.push(nyrea);
		}
		
	}

}