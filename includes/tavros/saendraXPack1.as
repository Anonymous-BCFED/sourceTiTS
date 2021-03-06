import classes.Creature;
import classes.Engine.Combat.DamageTypes.TypeCollection;
/*

Flagdoc:

SAENDRA_XPACK1_STATUS:
	0/undefined -- not started

	1 -- mail sent to pc, has 6 hours to get to the elevator on tavros
	2 -- pc didn't get to the location in time
	3 -- pc turned up to deck 92 late
	4 -- pc turned up to deck 92 in time
	5 -- pc defeated the pirate group with saen -- rescue available
	6 -- pc defeated the pirate group with saen -- rescue expired
	7 -- started the rescue stuff
	8 -- failed to rescue the dude
	9 -- rescued the dude successfully
	10 -- had post-rescue discussion with saendra
	11 -- talked to saen about her friend post expiry

SAENDRA_XPACK1_RESCUE_SHOTGUARD_STATE:
	0/undefined -- not defeated
	1 -- removed by using the callgirl
	2 -- removed by using bitchkitten titties
	3 -- defeated in combat

SAENDRA_XPACK1_RESCUE_TECHGUARD_STATE:
	0/undefined -- not defeated
	1 -- removed by using the callgirl
	2 -- removed by using holoburn
	3 -- defeated in combat
	4 -- pc lost to the techie

SAENDRA_XPACK1_CREDITOFFER:
	0/undefined -- no change
	1 -- enable option for full donation
	2 -- given her the cash, disabled
	3 -- given her the cash, she's back

*/

public function tryProcSaendraXPackEmail():void
{
	if (shipLocation != "TAVROS HANGAR") return;
	if (saendraAffection() < 60) return;
	if (MailManager.isEntryUnlocked("saendraxpack1")) return;
	if (eventQueue.indexOf(unlockSaendraXPackMail) != -1) return;

	eventQueue.push(unlockSaendraXPackMail);
}

public function unlockSaendraXPackMail():void
{
	clearOutput();

	output("Your Codex beeps unexpectedly, alerting you to an incoming extranet message. When you pull your device out, you’re greeted by an message addressed from one <i>“FlyGirl@PhoenixCargo.net.”</i> No bonus points guessing who <i>that</i> is. You flip it open and start to read:");
	
	output("\n\n<i>Hey, hero, are you anywhere near Tavros? Please say yes!</i> the message reads. <i>If you are, I could really use a hand. I’m on Deck 92, up in the construction wing. Expect trouble. Hope I see you soon!</i>");
	
	output("\n\nThe message ends with a big heart-shaped emote.");
	
	output("\n\nYou glance over in the direction of the elevator. Wouldn’t be too hard to answer her request.");

	MailManager.unlockEntry("saendraxpack1", GetGameTimestamp());

	flags["SAENDRA_XPACK1_STATUS"] = 1;
	flags["SAENDRA_XPACK1_TIMER"] = GetGameTimestamp();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function updateSaendraXPackTimer(delta:Number = 0):void
{
	if (flags["SAENDRA_XPACK1_STATUS"] == 1 || flags["SAENDRA_XPACK1_STATUS"] == 5)
	{
		flags["SAENDRA_XPACK1_TIMER"] += delta;

		// Making it to the elevator on time
		if (flags["SAENDRA_XPACK1_STATUS"] == 1 && GetGameTimestamp() >= flags["SAENDRA_XPACK1_TIMER"] + (6 * 60))
		{
			flags["SAENDRA_XPACK1_STATUS"] = 2; // failed, rip you
		}

		if (flags["SAENDRA_XPACK1_STATUS"] == 5 && GetGameTimestamp() >= flags["SAENDRA_XPACK1_TIMER"] + (7 * 24 * 60))
		{
			flags["SAENDRA_XPACK1_STATUS"] = 6;
		}
	}
}

public function saendraX1LiftGo():void
{
	clearOutput();
	showName("\nDECK 92");

	generateMapForLocation("SX1 FAKE FIGHT ROOM");

	// 2late
	if (flags["SAENDRA_XPACK1_STATUS"] == 2)
	{
		output("The elevator door opens onto an open, dark area. Looks to be under construction, with half-finished walls arranged along an avenue, and heavy equipment lying all over. Tarps and semi-transparent sheets are tacked up on the skeletal outlines of walls, making it almost impossible to see more than a few yards ahead of you. There are no lights on, except dim glow coming from a flashlight lying on the ground. When you take a few steps closer, you see that its sitting in a pool of blood. Not that fresh, either.");
		
		output("\n\nYou spend a few minutes poking around, but nothing comes of it. Looks like whatever action was going on here came and went. Shit.");

		//Return PC to elevator. Remove Deck 92 from options, remove Saendra from the game.
		flags["SAENDRA_XPACK1_STATUS"] = 3;
		flags["SAENDRA_DISABLED"] = 1;

		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
	else
	{
		output("The elevator door opens onto an open, dark area. Looks to be under construction, with half-finished walls arranged along an avenue, and heavy equipment lying all over. Tarps and semi-transparent sheets are tacked up on the skeletal outlines of walls, making it almost impossible to see more than a few yards ahead of you. As the elevator door locks open and beeps, a flashlight suddenly clicks on just ahead, blinding you for a moment.");
		
		output("\n\n<i>“Oh, there you are!”</i> Saendra’s familiar voice says as the light swings out of your eyes. You can just make her out, sitting on the edge of a half-finished fountain. Her robotic hand’s clutching a light, you can see, and her other is wrapped around her Hammer pistol.");
		
		output("\n\n<i>“Looks like you’re expecting trouble,”</i> you call over to her, stepping out of the elevator before the doors can close on you.");
		
		output("\n\nSaen’s usual mirth is nowhere to be found. <i>“You could say that. I was supposed to meet somebody here, but he’s been a no-show. I’m starting to get worried.”</i>");
		
		output("\n\nYou make it over to Saen, and give her a hand up. She pulls herself to her feet, and all the way into a hug. It would almost be nice, if not for the cold hardness of her gun’s magazine pressed into the small of your back.");
		
		output("\n\n<i>“So what’s the story?”</i> you ask, looking from Saendra to the half-built deck around her.");
		
		output("\n\nShe clicks her flashlight off and slips it onto her gunbelt. <i>“Like I said, I was meeting somebody. A station tech who was supposed to be getting me something. Fuck knows why he wanted to meet up here, but overriding station security and wandering on up wasn’t exactly hard. But he should have showed before I even sent you that message. I’m getting worried.”</i>");
		
		output("\n\n<i>“You didn’t pay up front, did you?”</i> you chuckle, trying not to let the eerie silence of the deck get to you.");
		
		output("\n\n<i>“That’d imply I have any money,”</i> Saen answers with a half-hearted laugh. <i>“So no. I was going to trade for it. Good old-fashioned barter.”</i>");
		
		output("\n\nAs she says it, Saen pulls a small device out of her blouse - some kind of starship part, you’d guess.");
		
		output("\n\n<i>“Anyway, I don’t want to play damsel in distress or anything, but lightning has a tendency to strike twice with me, if you know what I mean. If you don’t have anything better to do, think you could just... I dunno... sit with me for a bit?”</i>");
		
		output("\n\nBefore you answer, you have to ask: <i>“What exactly is it you were trying to buy, anyway?”</i>");
		
		output("\n\nSaen fidgets a bit, rubbing at the back of her head with her robotic hand. <i>“Docking codes for the station. I’ve got the </i>Phoenix<i> beaten together enough to fly... and <i>probably</i> not explode, too. But the bastard running the garage refuses to clear me to launch. Apparently my girl doesn’t meet ‘Confederate regulation’ standards anymore. Bah.”</i>");
		
		output("\n\nThe holo-projector on Saen’s wrist flickers, and Valeria’s avatar pops up with her hands on her hips and a scowl on her lips. <i>“That’s because it probably WILL explode, you psychopath!”</i> Val snaps, glowering at her mistress. <i>“You’re going to get us both killed!”</i>");
		
		output("\n\n<i>“Am not,”</i> Saen huffs, sounding a little less self-assured.");
		
		output("\n\nWhile the two of them start bickering about whatever plan Saendra’s got up her sleeve, you turn and start looking around the construction site. You imagine they’re building shops here, probably high end judging by the fountain and wide open corridors. Much swankier than the main merchant deck near the hangar, that’s for sure.");
		
		output("\n\nAnd you’re almost certain you can hear a clinking sound coming towards you.");
		
		output("\n\nYou have just enough time to yell <i>“GET DOWN!”</i> when you see a small, black disc sliding across the floor towards your halfbreed friend.");
		
		output("\n\nThe grenade goes off with a deafening KABANG and a blinding flash, burning at your dark-adjusted eyes. You manage to cover your eyes and grab at your [pc.weapon], but the sounds of jackboots pounding on the deck, rushing towards you makes you realize you’re in a hell of a spot. You stumble into the closest thing you can find to cover and rub at your eyes, trying to adjust back to blackness.");
		
		output("\n\nBy the time you’re able to see again, the first things your eyes alight on are a twitching mass of small green lasers flickering across the bulkheads behind you, searching for targets. You’re able to see Saendra across from you, ducking down behind the edge of the fountain with her Hammer pistol shakily held in her hands. Slowly, you risk a peek around the corner of your hole. Several men in heavy armor are moving in from the far side of the merchant square, machine pistols held at their hips.");
		
		output("\n\nWith silent determination, the mysterious assailants storm forward, fingers on their triggers.");
		
		output("\n\nSaendra shoots you a look before leaping to her feet and firing off a shot. One of the assassins at the front of their formation screams and drops, firing his gun wildly into the ceiling and walls. The others start yelling, shooting, and diving for cover.");
		
		output("\n\nHere we go again!");

		//Pirate fight here
		clearMenu();
		addButton(0, "Next", initsx1PirateGroupFight);
	}
}

public function initsx1PirateGroupFight():void
{
	pc.createStatusEffect("Pitch Black", 0, 0, 0, 0, false, "Icon_Slow", "It’s pitch black here, making it almost impossible to see anything but for bursts of light accompanying weaponsfire.", true, 0);
	startCombat("SX1GROUPPIRATES");
}

public function sx1PirateGroupAI():void
{
	// saen AI
	if (sx1SaendraAI()) output("\n\n");

	var nadesAvail:Boolean = !UpdateStatusEffectCooldown(foes[0], "NadeCD");

	// enemy AI
	var enemyAttacks:Array = [];
	enemyAttacks.push({ v: sx1GroupRangedAttack, 		w: 40 });
	enemyAttacks.push({ v: sx1GroupMachinePistols, 		w: 40 });

	if (nadesAvail)
	{
		enemyAttacks.push({ v: sx1GroupFlashbang, 		w: 15 });
		enemyAttacks.push({ v: sx1GroupSmokeGrenade, 	w: 15 });
		enemyAttacks.push({ v: sx1GroupConcGrenade, 	w: 15 });
	}

	weightedRand(enemyAttacks)();

	processCombat();
}

public function sx1GroupRangedAttack():void
{
	rangedAttack(foes[0], pc, [2]);
}

public function sx1SaendraAI():Boolean
{
	var noAction:Boolean = false;

	if (pc.hasStatusEffect("SaenBlind"))
	{
		pc.addStatusValue("SaenBlind", 1, -1);
		if (pc.statusEffectv1("SaenBlind") <= 0)
		{
			pc.removeStatusEffect("SaenBlind");
		}
		else
		{
			noAction = true;
		}
	}

	if (pc.hasStatusEffect("SaenStunned"))
	{
		pc.addStatusValue("SaenStunned", 1, -1);
		if (pc.statusEffectv1("SaenStunned") <= 0)
		{
			pc.removeStatusEffect("SaenStunned");
		}
		else
		{
			noAction = true;
		}
	}

	var sHackAvail:Boolean = !UpdateStatusEffectCooldown(pc, "SaenSHackCD");
	var sBoostAvail:Boolean = !UpdateStatusEffectCooldown(pc, "SaenSBoostCD");
	var sDisarmAvail:Boolean = !UpdateStatusEffectCooldown(pc, "SaenDisarmShotCD") && !foes[0].hasStatusEffect("Disarm Immune") && !foes[0].hasStatusEffect("PartialDisarm") && !foes[0].hasStatusEffect("Disarmed");

	if (noAction) return false;

	var attacks:Array = [];
	attacks.push({ v: sx1SaenHammerPistol, w: 40 });
	attacks.push({ v: sx1SaenLowBlow, w: 20 });
	if (foes[0].shields() > 0 && sHackAvail) attacks.push({ v: sx1SaenShieldHack, w: 25 });
	if (pc.shields() < pc.shieldsMax() && sBoostAvail) attacks.push({ v: sx1ShieldBooster, w: 25 });
	if (sDisarmAvail) attacks.push({ v: sx1DisarmingShot, w: 15 });

	weightedRand(attacks)();

	return true;
}

public function sx1GroupMachinePistols():void
{
	//Machine Pistols
	output("One of the assassins brings his machine pistol to bear, firing a burst of toward you!");
	if (rangedCombatMiss(foes[0], pc, -1, 3))
	{
		output(" The burst misses!");
	}
	else
	{
		output(" The burst hits!");

		applyDamage(new TypeCollection({ kinetic: 10 }), foes[0], pc, "minimal");
	}
}

public function sx1GroupFlashbang():void
{
	// Flashbang
	output("One of the assassins pulls another disk-like grenade from his belt and slides it across the deck, placing it between you and Saendra! The flashbang detonates with deafening force,");

	if (rand(10) != 0)
	{
		output(" blinding you and Saendra");
		pc.createStatusEffect("Blind", 3, 0, 0, 0, false, "Blind", "Accuracy is reduced, and ranged attacks are far more likely to miss.", true, 0);
		pc.createStatusEffect("SaenBlind", 3, 0, 0, 0, true, "Blind", "Accuracy is reduced, and ranged attacks are far more likely to miss.", true, 0);
	}
	else
	{
		output(" blinding Saendra, though you manage to avoid any serious effect.");
		pc.createStatusEffect("SaenBlind", 3, 0, 0, 0, true, "Blind", "Accuracy is reduced, and ranged attacks are far more likely to miss.", true, 0);
	}

	foes[0].createStatusEffect("NadeCD", 5);
}

public function sx1GroupSmokeGrenade():void
{
	// Smoke Grenade
	output("One of the assassins pulls a cylindrical grenade from his belt and hurls it between you and him. Smoke billows out of the grenade after a loud POP, making it almost impossible to see. <b>Aim reduced!</b>");
	pc.createStatusEffect("Smoke Grenade", 3, 0, 0, 0, false, "Blind", "Ranged attacks are far more likely to miss.", true, 0);

	foes[0].createStatusEffect("NadeCD", 5);
}

public function sx1GroupConcGrenade():void
{
	// Concussion Grenade
	output("One of the assassins grabs a red grenade off of his belt and hurls it at you. A second later, the grenade detonates in a rib-crushing wave of kinetic force that nearly knocks you on your ass!");
	var mul:Number;
	if (pc.RQ() < rand(100)) mul = 2;
	else mul = 1;

	applyDamage(new TypeCollection({ kinetic: 12 * mul }), foes[0], pc, "minimal");

	foes[0].createStatusEffect("NadeCD", 5);
}

// Saendra Abilities
// Saen has the Smuggler "Aimed Shot" ability, and perks up to Level 5

public function sx1SaenHammerPistol():void
{
	// Hammer Pistol
	output("Saendra levels her Hammer pistol at ");
	if (foes[0].plural == true) output("one of ");
	output(foes[0].a + foes[0].short + " and squeezes off a shot.");

	var chance:Number = 3;
	if (pc.hasStatusEffect("SaenBlind")) chance = 6;

	if (rand(chance) == 0)
	{
		output(" The shot goes wide!");
	}
	else
	{
		output(" The shot connects!");
		applyDamage(new TypeCollection({ kinetic: 10 }), pc, foes[0], "minimal");
	}
}

public function sx1SaenLowBlow():void
{
	// Low Blow
	if (foes[0].plural) output("One of " + foes[0].a);
	else output(foes[0].capitalA);
	output(foes[0].short + " gets a little too close to Saendra, and she responds by giving " + foes[0].mf("him", "her") + " a swift kick in the groin!");
	output(" " + foes[0].mf("He", "She") + " takes doubles over in pain!");
	applyDamage(new TypeCollection({ kinetic: 10 }), pc, foes[0], "minimal");

}

public function sx1SaenShieldHack():void
{
	var damage:DamageResult = applyDamage(new TypeCollection({ electric: 15 }, DamageFlag.ONLY_SHIELD), pc, foes[0], "suppress");
	// Valeria Shield Hack
	output("Saendra taps on her wrist, yanking Valeria out of her digital hidey-hole and aiming the fluttery holo-avatar at");
	if (foes[0].plural == true) output(" one of ");
	output(foes[0].a + foes[0].short + ". A concussive wave blasts from her target's shield belt as it's overloaded,");
	if (foes[0].plural == true) output(" a chain of energy shooting forth and connecting to his compatriots");
	if (foes[0].shields() <= 0) output(" completely");
	else output(" nearly");
	output(" burning out!");
	outputDamage(damage);

	pc.createStatusEffect("SaenSHackCD", 5, 0, 0, 0, false);
}

public function sx1ShieldBooster():void
{
	// Shield Booster
	output("Saen waves her mechanical arm at you and the metallic probe shoots out, jacking into your shield generator. You breath a sigh of relief as your shields are restored!");

	pc.shields(pc.shieldsMax() * 0.25);
	pc.createStatusEffect("SaenSBoostCD", 5, 0, 0, 0, false);
}

public function sx1DisarmingShot():void
{
	//Disarming Shot
	output("Saendra takes careful aim with her Hammer pistol, aiming for");
	if (foes[0].plural == true) output(" one of");
	output(foes[0].a + foes[0].short);
	output("’s weapon. She squeezes off a shot");

	if (rand(3) == 0)
	{
		output(" and the target's weapon goes flying to the ground in a shower of sparks! Damn, she's a deadshot!");
		if (foes[0].plural == true) foes[0].createStatusEffect("PartialDisarm", 2, 0, 0, 0, false);
		else foes[0].createStatusEffect("Disarmed",4,0,0,0,false,"Blocked","Cannot use normal melee or ranged attacks!",true,0);

		applyDamage(new TypeCollection({kinetic: 7}), pc, foes[0], "minimal");
	}
	else
	{
		output(", but just barely misses.");
	}

	pc.createStatusEffect("SaenDisarmShotCD", 4, 0, 0, 0, false);
}

public function sx1PirateGroupPCLoss():void
{
	clearOutput();
	showName("DEFEAT:\nVOID PIRATES");
	author("Savin");
	showBust("VOIDPIRATE", "VOIDPIRATE", "VOIDPIRATE", "VOIDPIRATE");

	generateMapForLocation("SX1 FAKE FIGHT ROOM");

	output("You slump to the ground, completely unable to put up even token resistance anymore. Your [pc.mainWeapon] clatters out of your hands, and is quickly stomped on by a jackbooted thug. You look up, in the barrel of a machine pistol, and can’t help but clench down in preparation for the inevitable.");
	
	output("\n\nIt doesn’t come. Instead, you’re roughly grabbed by plated hands and rolled onto your stomach. Your hands are cuffed behind your back, completely restrained as the other assassins grab Saendra and drag her off, kicking and screaming.");
	
	output("\n\n<i>“Stay down, kid,”</i> the man over you growls, making the barrel of his gun painfully apparent against your spine.");
	
	output("\n\nOut of the corner of your eye, you watch Saen get slammed down onto the side of the fountain. A few moments later, the elevator dings open behind you, and another figure strides into the corridor. A woman, dressed in an all-red jumpsuit under a black longcoat. Her flowing dark hair half-conceals a face that’s a network of scars and tattoos that wrap around an eyepatch.");
	
	output("\n\n<i>“[pc.HimHer] again?”</i> the woman growls, pointing at you. <i>“The same white knight from before? I’m almost impressed.”</i>");
	
	output("\n\nShe scoffs and closes the distance between her and Saendra, grabbing the halfbreed by the hair and yanking her head back.");
	
	output("\n\n<i>“Saendra. I’m disappointed in you.”</i> the woman says, scowling down at Saendra. <i>“After all we’ve done for you, this is how you repay us? And now you’re dragging civilians into it? Tsk, you should know better than that. Look at what you’ve done.”</i>");
	
	output("\n\nThe woman twists Saen’s face, making her look at you. One of the heavy-armored men around you rears back the butt of his weapon and cracks you in the back of the skull. You see stars and reel from the impact.");
	
	output("\n\nThe woman reaches down and grabs one of Saendra’s tits, reaching right into her shirt. Saen recoils, struggling against the men holding her down.... until her hand comes back with a small data chit, still stuck to a piece of tape.");
	
	output("\n\n<i>“You really thought you could steal from us? You God damn idiot, Saendra. What were you thinking?”</i>");
	
	output("\n\nSaen stares the woman - the pirate, you guess - in the eye for a second, and spits in her face.");
	
	output("\n\n<i>“Is that all you have to say? So be it,”</i> the pirate woman says, wiping the insult from her cheek. <i>“Fine. Gentlemen, escort Saendra back to the </i>Rose<i>. We’ll deal with her there. Maybe Carver has an opening in her roster this year, hmm?”</i>");
	
	output("\n\n<i>“Fuck you, Miri,”</i> Saen growls as a pair of armored men heft her to her feet and drag her off.");
	
	output("\n\nAs your companion is dragged off, another pirate points your way and asks his commander, <i>“And what about this one? To the slaver, too?”</i>");
	
	output("\n\nThe pirate woman, Miri, approaches you. You’re hefted to your [pc.knees], and the woman leans in to look you in the eye. <i>“One interference I could understand,”</i> she says. <i>“You just bumbled into the </i>Phoenix<i> business, thought you were playing hero for a damsel in distress. But twice now? No, I can’t allow this.”</i>");
	
	output("\n\nShe turns from you to the soldier holding you. <i>“Give [pc.himHer] to Carver. The full break.”</i>");
	
	output("\n\n<i>“Aye, Lord Bragga,”</i> he says, hauling you up to your [pc.feet] and dragging you towards the elevator. You’re thrown against the far wall of the elevator when it opens, behind the soldier. He pushes a button, down to one of the docks. You feel your hopes of freedom slipping away with every deck. You’re going to spend the rest of your life as a sex slave, all because you wanted to help a friend. Fuck you for being nice, right?");

	badEnd();
}

public function sx1PirateGroupPCVictory():void
{
	clearOutput();
	showName("VICTORY:\nVOID PIRATES");
	author("Savin");
	showBust("VOIDPIRATE", "VOIDPIRATE", "VOIDPIRATE", "VOIDPIRATE");

	generateMapForLocation("SX1 FAKE FIGHT ROOM");

	output("The last of the assassins drops to his knees, several bullet holes smoking in his armor. Saendra twirls her pistol around her finger, blows the smoke off the barrel, and drops it into her holster.");
	
	output("\n\n<i>“Who the hell </i>were<i> they?”</i> you ask between gasping breaths.");
	
	output("\n\n<i>“WHAT!?”</i> Saen yells, rubbing at her feline ears. <i>“WHAT DID YOU SAY!?”</i>");
	
	output("\n\nYou shout a little louder, <i>“Who were they!?”</i>");
	
	output("\n\n<i>“I CAN’T HEAR YOU. MY EARS ARE RINGING.”</i> she yells, flailing at you. <i>“YOU OKAY!?”</i>");
	
	output("\n\nYou nod and, seeing as Saen’s not being very helpful, walk over to the bodies. They’re armored like proper soldiers, clad head to foot in vacuum-sealed plates over a skin-tight suit. Mercenaries or pirates, probably... actually, now that you think about it, the colors on their plates are distinctly reminiscent of the boarding party you saved Saen from back aboard the <i>Phoenix</i>. No way they tracked her all the way here. Did they?");
	
	output("\n\nYou turn to Saen and give her a look, which she answers with a loud declaration of <i>“MAWP”</i> while she rubs her ears. You mutter a small thanks to your nano-docs for repairing your hearing damage about as fast as it happens.");
	
	output("\n\nAnd thanks to that, you’re able to hear the elevator ding into place. You");
	if ((pc as Creature).hasEquippedWeapon()) output(" draw your [pc.weapon] and");
	output(" grab Saendra’s shoulder, shoving the both of you into cover and out of sight. You pull Saendra tight against yourself, wrapping your arm around her belly. She has the sense to shut up and draw her gun, clumsily swapping magazines just before the elevator slides open.");
	
	output("\n\nLight floods into the darkened corridor, and a trio of people stride out - two more armored men, and a woman in a skin-tight red jumpsuit, worn under a flowing black longcoat. The woman’s dark hair half-conceals a face that’s a network of scars and tattoos that wrap around an eyepatch. One of her gloved hands rests on the hilt of a saber at her hip; the other carries a sleek laser pistol.");
	
	output("\n\n<i>“Fuck,”</i> one of the armored goons says, waving a flashlight over the corridor full of bodies and hot brass. <i>“How did one woman do all this?”</i>");
	
	output("\n\n<i>“I told your men not to underestimate her, captain,”</i> the woman says, holstering her pistol. <i>“And the man she was supposed to be meeting?”</i>");
	
	output("\n\nThe ‘captain’ grunts and rests his gun on his shoulder. <i>“He’s been taken care of. Stashed him in a private room at Anon’s, just like you asked.”</i>");
	
	output("\n\nThe woman nods. <i>“Good. I’ll be down to collect him shortly.”</i>");
	
	output("\n\nShe turns on a heel and re-embarks onto the elevator. Her soldiers follow her, leaving you and Saendra in darkness. You release a breath you hadn’t known you’d been holding, and your vice grip on Saendra’s belly relents, letting the halfbreed slip out of your arms.");
	
	output("\n\n<i>“Shit,”</i> she sighs, holstering her gun again. She’s still half-shouting over the ringing in her ears. <i>“How the fuck did she find me?”</i>");
	
	output("\n\n<i>“Who </i>was<i> that?”</i>");
	
	output("\n\nSaen shrugs. <i>“I, uh... look, we can talk about this later, hero. My buddy’s in trouble because of me, and I’m gonna go bail him out. Meet you back at the bar!”</i>");
	
	output("\n\nThe halfbreed runs off towards the elevator bank, disappearing into the car you’d taken up. She gives you a wink as the door closes, taking her back down to the merchant decks.");
	
	output("\n\n...And now you’re going to have to wait for another elevator.\n\n");

	flags["SAENDRA_XPACK1_STATUS"] = 5;
	flags["SAENDRA_XPACK1_TIMER"] = GetGameTimestamp();

	// [Next] //Put PC back in elevator. Saendra returns to the bar as usual.
	genericVictory();
}

public function sx1TalkFriend():void
{
	clearOutput();
	saenHeader();

	flags["SAENDRA_XPACK1_STATUS"] = 7;

	output("<i>“Hey,”</i> you say, reaching across the table to take Saen’s robotic hand. <i>“That friend of yours... did you find him?”</i>");
	
	output("\n\n<i>“Yeah, actually. He’s here, at the bar. Just upstairs, like the pirate said. I saw one of the rooms with an armed guard outside. Not, like, some dude in power armor or anything, but a guy trying not to be too obvious leaning on the wall all the time, playing with a cigar he won’t light. Pretty sure I saw a machine pistol under his coat.”</i>");
	
	output("\n\nSaendra fidgets, eyes locking on your hand. <i>“I, uh, I’d knock him out myself, but I don’t know what’s in the room. Could be a lot more assholes. They even put a block on the room’s sensors when I sent Val in to check.”</i>");
	
	output("\n\n<i>“They know we’re coming,”</i> Valeria adds, flickering up onto Saendra’s mechanical wrist. Her avatar stumbles back when it materializes next to your hand, and she ends up falling onto her holographic butt. <i>“Probably, anyway. The pirates you and Saen saw at the elevator have most likely alerted their friends here at Anon’s.”</i>");
	
	output("\n\nThat makes things interesting. <i>“Want some help?”</i> you offer, squeezing Saen’s hand.");
	
	output("\n\nThe halfbreed’s cheeks flush a little red. <i>“You don’t have to, hero. It’s not your fight. God knows I’ve dragged you into too many of my problems already.”</i>");
	
	output("\n\nYou assure her that you’re willing. You’ve come this far after all.");
	
	output("\n\nSaen smiles at that, her twin tails swishing loudly on the leather seat. <i>“Alright, alright. Keep this up and I’m not going to be able to solve </i>any<i> of my own problems,”</i> she teases with a wink, hopping up from her seat and adjusting the gunbelt on her hip.");
	
	output("\n\n<i>“Please don’t shoot up the bar!”</i> Val whines, fluttering after Saendra. <i>“We really need the free room and board here!”</i>");
	
	output("\n\n<i>“Yeah, yeah, I know,”</i> Saen huffs. <i>“[pc.name] and I will think of something, won’t we?”</i>");
	
	output("\n\nShe gives you a hand up onto your [pc.feet], and you follow her towards the stairs...");

	clearMenu();
	addButton(0, "Next", sx1TalkFriendII);
}

public function sx1TalkFriendII():void
{
	clearOutput();
	saenHeader();

	generateMapForLocation("HOTEL CORRIDOR");

	output("You and Saendra walk up the stairs behind the bar, towards the small hall of rooms for rent Anon’s sports. It’s small and undecorated, steel walls straight down a ten foot corridor. A fluorescent light flickers uneasily overhead, casting dark shadows across the dull gray bulkheads.");
	
	output("\n\nYou hear muffled moans and distant thumps against the walls, sounds of pleasure echoing from the handful of side rooms as you pass them. A man in a long, heavily worn brown coat is standing with his back to one of the doors, chewing on the butt of an unlit cigar. His hands are shoved into his pockets. The handful of self-defense classes Dad put you through tip you off to the way the man’s right pocket seems weighed down by something heavy... like a gun.");
	
	output("\n\nSaen gives you a look and falls behind you,");
	if (pc.tallness < 60) output(" awkwardly hiding her face behind your tiny form");
	else output(" trying to hide behind you");
	output(". That should give you a momentary advantage - just enough to get you close to the guard. You pick up the pace, trying to seem as nonchalant as you can until you’re within striking range.");
	
	output("\n\nThe man looks up, chomping his cigar and sneering at you. <i>“");
	if (pc.isMasculine()) output("Move along, bro.");
	else output("Hey, sweetheart. You lookin’ for a good time?");
	output("”</i> he growls, turning towards you...");
	
	if (pc.PQ() >= 80)
	{
		output("\n\n... and right into a sucker-punch to the face. You deck the bastard, putting him down with one swift strike to the eye. He grunts and crumples, lying motionless on the floor.");
	
		output("\n\n<i>“Nice hit!”</i> Saen cheers, taking a knee beside the unconscious guard and lifting his wallet.");
	}
	else if (pc.AQ() >= 80)
	{
		output("\n\nYou lunge forward, sinking your fist right into his gut. He gasps for the wind you just knocked out of him, pulling his gun just in time for the tentacle-probe in Saendra’s wrist to shoot out and wrench it out of his hand.");
		
		output("\n\nThe hapless guard crumples to his knees and promptly gets a boot in the face from your halfbreed companion. He grunts, lying motionless on the floor.");
		
		output("\n\n<i>“Good teamwork!”</i> Saen grins, taking a knee beside the unconscious guard and lifting his wallet.");
	}
	else
	{
		output("\n\nYou take a swing at him, but the guard nimbly dodges out of the way of your fist, drawing his own weapon in the same fluid motion. Behind you, Saen hisses a curse and dives for it, tackling the guard to the ground and burying her knee in his crotch. He groans, and his weapon goes clattering across the floor.");
		
		output("\n\n<i>“Fuck off!”</i> Saendra growls, sucker-punching him with her robotic arm. The guard grunts and crumples, lying motionless on the floor.");
		
		output("\n\nWith a sigh of relief, Saendra sits back on her knees and runs a hand through her crimson hair. <i>“Let me handle the rough stuff next time,”</i> she teases, clenching her chromed fist. <i>“I punch harder.”</i>");
		
		output("\n\nYou bite back a comment as she lifts the guy’s wallet and crawls off of him.");
	}
	
	output("\n\nJust like Saen had suggested, you find a compact machine pistol next to the guard’s unconscious body."); //  and pick it up. <b>You acquire a SecureMP</b>
	clearMenu();
	addButton(0, "Take It", sx1LootSecureMP);
	addButton(1, "Leave It", sx1TalkFriendIII);
}

public function sx1LootSecureMP():void
{
	clearOutput();
	saenHeader();

	generateMapForLocation("HOTEL CORRIDOR");

	output("You snatch up the pistol from the guards body, hefting it in your grip with ease. Feels... pretty light actually, but not in a bad way.");
	output("\n\n");

	lootScreen = sx1TalkFriendIII;
	itemCollect([new SecureMP()]);
}

public function sx1TalkFriendIII():void
{
	clearOutput();
	saenHeader();

	generateMapForLocation("HOTEL CORRIDOR");

	output("<i>“Okay, I don’t think anybody heard that,”</i> Saendra says, pulling the Hammer pistol off her hip. <i>“Or if they did, they probably figured it was that busty callgirl next door slamming her headboard into the wall again. Trust me, it was only sexy listening to her moaning all night the first time,”</i> she laughs.");
	
	output("\n\nThe way Saen’s cheeks tint with red, something tells you she did more than just listen to the local call-girl at that...");
	
	output("\n\n<i>“Alright, how do you want to do this, hero?”</i> she asks, nodding towards the door. <i>“We could go in guns blazing, but that’s going to draw a lot of attention. Anybody back in the bar could be a pirate in disguise, or the ones in there might call for reinforcements. Might get me kicked out of my free digs, too.”</i>");
	
	output("\n\n<i>“Any other suggestions, then?”</i>");
	
	output("\n\nSaendra shrugs. <i>“I’m not a subtle girl, hero. I’m good with a gun, a pilot’s stick, a cock, and my tools. If that gives you any ideas, I’m all ears.”</i>");
	
	output("\n\nAs if for emphasis, her feline ears twitch at you.");

	sx1PuzzleOfDoomMenu();
}

public function sx1PuzzleOfDoomMenu():void
{
	clearMenu();

	addButton(0, "Door Breach", sx1DoorBreach, undefined, "Door Breach", "Do it the old-fashioned way. Kick the door in and take down the pirates.");

	addButton(1, "Call Girl", sx1SeeCallgirl, undefined, "Call Girl", "Maybe you could throw that call girl next store some credits to distract the guards...");

	if (flags["SAENDRA_XPACK1_ASKEDSAEN"] == undefined) addButton(2, "Saendra", sx1AskSaendra, undefined, "Ask Saendra", "Get your favourite bitchkitten’s professional input.");
	else addButton(2, "Distract", sx1SaenDistract, undefined, "Distract", "Have Saendra pop her tits out and distract one of the guards.");

	if (flags["SAENDRA_XPACK1_ASKEDVAL"] == undefined) addButton(3, "Valeria", sx1AskValiera, undefined, "Ask Valeria", "Pitch an idea to Saendra's holographic best friend...");
	else if (flags["SAENDRA_XPACK1_ASKEDVAL"] == 1) addButton(3, "Holo Burn", sx1Holoburn, undefined, "Holo Burn", "Try and overload the rooms electronics, and fry whoever's jacked into the computer system in there.");
	else addDisabledButton(3, "Holo Burn");

	if (pc.characterClass == GLOBAL.CLASS_SMUGGLER || pc.hasItem(new FlashGrenade())) addButton(4, "Flashbang", sx1ThrowFlashbang, undefined, "Flashbang", "Throw a flashbang in and storm the room.");
	else addDisabledButton(4, "Flashbang", "Throw Flashbang", "You don't have any flashbangs to hand.");
}

public function sx1AskValiera():void
{
	clearOutput();
	saenHeader();
	showBust("VALERIA");

	generateMapForLocation("HOTEL CORRIDOR");

	flags["SAENDRA_XPACK1_ASKEDVAL"] = 1;

	output("<i>“Hey, Valeria?”</i> you say, leaning in towards Saendra’s wrist.");
	
	output("\n\n<i>“Hi, [pc.name],”</i> the holo-fairy chirps, fluttering around the halfbreed’s mechanical arm. <i>“Anything I can do to help?”</i>");
	
	output("\n\n<i>“You said you were trying to hack into the room earlier, right?”</i>");
	
	output("\n\nThe fairy nods eagerly. <i>“I tried to access the bar’s security system, but I got blocked. And not by any countermeasure I’ve ever seen when I poked around Anon’s systems before. I think the pirates probably have a tech with them who’s plugged into the network.”</i>");
	
	output("\n\nSo, they’re monitoring the computer network... You ask the fairy <i>“Anything else?”</i>");
	
	output("\n\nValeria glances around and, after a moment’s thought, says <i>“I don’t know... the way the countermeasure hit me when I poked my nose in, it was way more intelligent... more creative... than your average V.I. watchdog. The way it worked, I think somebody in there may be physically jacked into the network, maybe using a holoset.”</i>");
	
	output("\n\nHmm... Maybe you could use that to your advantage.");

	sx1PuzzleOfDoomMenu();
}

public function sx1AskSaendra():void
{
	clearOutput();
	saenHeader();

	flags["SAENDRA_XPACK1_ASKEDSAEN"] = 1;

	generateMapForLocation("HOTEL CORRIDOR");

	output("<i>“So, any ideas?”</i>");
	
	output("\n\nSaendra shrugs. <i>“I mean, aside from shooting bitches? I guess we could try and honeypot ‘em... I could put on a sweet voice, tell them their boss sent some pleasure. Maybe flash ‘em my tits when they open the door while you bum-rush ‘em.”</i>");
	
	output("\n\nWhen you don’t eagerly agree, Saen pouts and crosses her arms under her generous assets, hefting them up. <i>“What? Come on, nobody can resist these big beauties. Hell, the pirates will probably just want to cuddle up with me and use ‘em as pillows...");
	if (saendra.hasCock()) output(" Aaaaand now I have a boner. Dammit, [pc.name].");
	output("”</i> Saen chuckles to herself, running a thumb across one of her little teats.");
	
	output("\n\n<i>“Anyway. What I </i>actually<i> mean is we can try and draw ‘em out somehow. Take them out one at a time, or at least weaken the group inside.”</i>");
	
	output("\n\nMaybe...");

	sx1PuzzleOfDoomMenu();
}

public function sx1SeeCallgirl():void
{
	clearOutput();

	generateMapForLocation("CALLGIRL ROOM");

	if (flags["SAENDRA_XPACK1_CALLGIRLSTATE"] == undefined)
	{
		flags["SAENDRA_XPACK1_CALLGIRLSTATE"] = 1;

		output("You ask Saendra to point out the room the call girl works out of. She nods to the door next to where you’ve been standing, from which comes a loud <i>thump</i> and a grunt of orgasmic male pleasure.");
		
		output("\n\n<i>“Hide that guy,”</i> you whisper, waving a hand at the body as you make your way over to the whore’s door. Saen growls something under her breath, hooks her hands under the guard’s legs, and starts dragging him off towards a janitor’s closet at the end of the hall.");
		
		output("\n\nYou knock, and hear an immediate response of a guttural grunt and a zipper zipping. A second later and the door swings open, revealing a towering green-skinned");
		if (CodexManager.entryViewed("Thraggen")) output(" thraggen");
		else output(" alien");
		output(" wearing combat trousers and a leather jacket with no shirt underneath, a very satisfied look on his face. He gives you a surprisingly friendly nod as he passes, leaving the door wide open as if inviting you to take his place inside.");
		
		output("\n\nSitting on the edge of a bed just past the door is a");
		if (!CodexManager.entryViewed("Zil")) output(" yellow-skinned, vaguely insectile woman");
		else output(" zil female");
		output(" with long, lustrous black hair spilling down her back and full, round breasts that would make a porn star jealous looming heavily over a corset made of chitin, hinting at a very flat, firm belly beneath it. A pair of long, pink leggings encircle her legs, but she’s otherwise nude, and you can see a very distinct patch of white staining the black lips of her sex, left over by the burly alien just with her.");
		
		output("\n\n<i>“Another one already?”</i> she smiles, leaning back and planting her arms on the bed, giving you a much better look at her bountiful bosom. <i>“Mmm, busy day today. You’ll have to give me a minute to clean up, honey... unless you like sloppy seconds. It’s certainly the most fun kind of lube.”</i>");
	}
	else
	{
		output("The callgirl is still sitting in her room, applying a bit of makeup when you walk back in.");
		
		output("\n\n<i>“Change your mind, honey?”</i> she asks, voice full of lascivious suggestion. <i>“Why don’t you come on in and let me take care of you...”</i>");
	}

	//[Okay...] [Job] [Nevermind]
	sx1CallgirlMenu();
}

public function sx1CallgirlMenu():void
{
	clearMenu();
	if (pc.credits >= 500 && (pc.hasCock() || pc.hasVagina()) && flags["SAENDRA_XPACK1_CALLGIRLSTATE"] != 2)
	{
		addButton(0, "Okay...", sx1CallgirlOkay, undefined, "Okay", "Well, you can probably spare a few minutes...");
	}
	else if (pc.credits < 500)
	{
		addDisabledButton(0, "Okay...", "Okay", "You don't have enough credits!");
	}
	else if (!pc.hasCock() && !pc.hasVagina())
	{
		addDisabledButton(0, "Okay...", "Okay", "As nice as a quick romp with the callgirl sounds, you'd need some genitals to fully enjoy the experience...");
	}
	else
	{
		addDisabledButton(0, "Okay", "Okay", "Saen probably wouldn't take too kindly to you literally fucking around any longer.")
	}

	if (pc.credits >= 500) addButton(1, "Job", sx1CallgirlOfferJob, undefined, "Offer Job", "Offer the Callgirl 500 credits to distract the guards.");
	else addDisabledButton(1, "Job", "Offer Job", "You don't have enough credits to offer the Callgirl!");

	addButton(2, "Nevermind", sx1CallgirlNevermind);
}

public function sx1CallgirlNevermind():void
{
	clearOutput();

	generateMapForLocation("CALLGIRL ROOM");

	output("<i>“Aww. Nervous, hun?”</i> the callgirl coos, blowing you a kiss. <i>“Go ahead and take your time. I’ll be here.”</i>");

	sx1PuzzleOfDoomMenu();
}

public function sx1CallgirlOkay():void
{
	clearOutput();

	generateMapForLocation("CALLGIRL ROOM");

	flags["SAENDRA_XPACK1_CALLGIRLSTATE"] = 2;
	pc.credits -= 500;

	output("<i>“I don’t have a lot of time,”</i> you admit as you step into the whore’s room and slide the door closed. It seals with a pneumatic hiss, leaving the two of you alone and basking in the heady mix of incense, sweat, and sex that clings to the air of her room.");
	
	output("\n\nYour heart flutters as the callgirl smiles and spreads her legs invitingly, patting a thigh. <i>“Then I’ll just have to take care of you quickly. Don’t worry, honey: same pleasure, half the time, or the next one’s on the house...”</i>");
	
	output("\n\nWell, that’s an offer that’s hard to refuse. You shuck your [pc.gear] and stride over to the bed, pressing the alien beauty onto her back with a confident hand. She giggles, and lets her legs ride up around your [pc.hips], curling around you. You lean in and drink deep of her scent, rich and honey-link, mixed with the sheen of sweat from her last encounter, and the musk rising from between her legs where the alien’s seed is cooling.");
	
	output("\n\n<i>“Ohh, you </i>are<i> eager, aren’t you?”</i> the alien beauty coos, black lips pressing against yours. A long tongue finds its way out to play with yours, wrapping around your [pc.tongue] and drawing you deeper into her embrace.");
	
	output("\n\nWith a talented mouth like hers, it’d be a shame not to put it to good use...");
	
	output("\n\n<i>“Is that so?”</i> she says as you explain your desires. <i>“I think I can make all your dreams come true, then.”</i>");
	
	output("\n\nYou smile at her and run a hand along the cup of her of her soft, squeezable breasts. Steadily moving up her lush body, you brush your thumb over the sin-black flesh of her nipple, her slender shoulders, finally hooking it into her lip and gently pulling at the lush, dark rim of her mouth. You start to crawl up the");
	if (CodexManager.entryViewed("Zil")) output(" zil");
	else output(" exotic");
	output(" woman’s slender frame, kissing and caressing until your");
	if (pc.hasCock())
	{
		output(" [pc.cocks]");
		if (pc.cocks.length == 1) output(" is");
		else output(" are");
		output(" dangling");
	}
	else
	{
		output(" [pc.cunts]");
		if (pc.vaginas.length == 1) output(" is");
		else output(" are");
		output(" poised");
	}
	output("  over her mouth.");
	
	output("\n\nShe giggles and brushes her chitinous fingers along");
	if (pc.hasCock()) output(" the shaft of [pc.oneCock]");
	if (pc.hasCock() && pc.hasVagina()) output(" and up to");
	if (pc.hasVagina()) output(" the lips of [pc.oneCunt]");
	output(". A shiver of pleasure meanders through your spine as the lusty alien teases you, her long tongue reaching out to caress your sex. Her hands grab your [pc.butt], squeezing you and drawing you in until her");
	if (pc.hasVagina()) output(" tongue is pressing in between your lips");
	else output(" lips are pressed to your [pc.cockHead], opening wide to swallow your [pc.cock]");
	output(".");

	if (pc.hasCock())
	{
		output("\n\nYou chew your lip and ease your [pc.cock] between the alien babe’s lush, black cockpillows. She moans and takes all you have to give her, wrapping her lips around your prick and sucking hard. She wasn’t kidding about half the time, double the pleasure.... You grunt and dig your fingers into the sheets of her bed, pistoning your hips forward into her welcoming mouth.");
		
		output("\n\nYou quickly find yourself using her face like a tight little pussy, pounding away at her wet depths and shadowy lips. The alien vixen puts on like she loves every second of it, moaning and groaning and arching her back. Her plated fingers squeeze your ass, even giving you a playful smack as if to say <i>“More! More!”</i>");
		
		output("\n\nPressing her deeper into the bed, you fuck the");
		if (CodexManager.entryViewed("Zil")) output(" zil");
		else output(" alien");
		output("’s mouth as hard as you can. Her tongue works wonders, wrapping around your [pc.cock] in a sultry, wringing grasp. Every time you thrust between her lips, she moans lasciviously and seems to draw you deeper in, inviting you to ram your meat down her throat.");
		
		output("\n\nA few minutes of the alien beauty’s oral treatment brings you to the edge, and then over it with a spectacular series of moans and grunts. You hilt your prick in her mouth and let loose a");
		if (pc.cumQ() <= 100) output(" trickle of cum onto the back of her throat");
		else if (pc.cumQ() <= 250) output(" a few squirts a spooge down her throat");
		else if (pc.cumQ() <= 1000) output(" hefty load of spunk down her throat, making her gag on your virile load");
		else output(" torrential load of seed down her throat, bloating the alien girl’s belly with the sheer volume of your orgasm");
		output(".");
	}
	else
	{
		output("\n\nYou smile down at the exotic beauty and use a pair of fingers to spread your pussylips open, inviting the");
		if (CodexManager.entryViewed("Zil")) output(" zil");
		else output(" alien");
		output(" to explore your depths with that lengthy tongue of hers. She does so eagerly, flicking it along your inner lip and tracing her way around your [pc.clit]. You shiver with pleasure, moaning and groping at your [pc.chest] as she works her lascivious art.");
		
		output("\n\n<i>“What a lovely taste!”</i> the yellow wasp-girl coos, kissing her way from your clit down to the gently-throbbing passage of your sex. You drink in a deep, long breath of air that twists into a husky moan when the alien babe’s tongue slithers into you. Ohhh, that’s the stuff! You bite your lower lip and gently rock your hips, riding her face and that writhing, thick tongue of hers.");
		
		output("\n\nThe callgirl controls her tongue with a serpentine grace, wiggling it against your juicy walls and hitting all the tenderest spots along the way. Your hand runs through her spiney, raven-black hair, urging her deeper and deeper into your quivering quim. Juices trickle down onto her face, smearing her black lips and chin with a glistening sheen of your mounting excitement.");
		
		output("\n\nA few minutes of the alien beauty’s oral treatment brings you to the edge, and then over it with a spectacular series of moans and grunts. You press your [pc.cunt] flush with her lips, getting as much of that squirming muscle inside you as you can before your climax washes over you in a wave of screaming ecstasy and gushing fem-cum. Your partner giggles as you orgasm all over her, splattering her face with girl-spunk.");
	}

	output("\n\n<i>“My, that was something,”</i> the");
	if (CodexManager.entryViewed("Zil")) output(" zil");
	else output(" waspy alien girl");
	output(" smiles, running a black-plated finger through the coating of juices on her face. <i>“I wish you weren’t in such a hurry... I’d love to have a repeat performance if-”</i>");
	
	output("\n\n<i>“[pc.name]!”</i> you hear from the door, along with a gentle knock. <i>“Come on already, what’s taking so long!?”</i>");
	
	output("\n\nThe callgirl tsks her tongue and takes the credit chit you slip her. <i>“Thank you, honey. Now go and tend to your woman... I’ll be here.”</i>");

	pc.orgasm();

	processTime(25);

	//Callgrill's menu
	sx1CallgirlMenu();
}

public function sx1CallgirlOfferJob():void
{
	clearOutput();
	pc.credits -= 500;

	generateMapForLocation("CALLGIRL ROOM");

	output("<i>“Hey, so, my buddy is over in the next room,”</i> you lie, pulling a credstick out of your pocket. <i>“It’s his birthday, you know, and I was thinking maybe...”</i>");
	
	output("\n\nThe alien whore smiles, her lush black lips reflecting the candlelight of her room. <i>“Ah, how generous of you,”</i> she coos, crawling up off the bed and slinking over to you. She takes the credit chit, pressing herself flirtatiously close as she does so. <i>“Your friend’s lucky to have you... I’ll make sure he knows that by the time I’m done.”</i>");
	
	output("\n\nYou give her a nod and step out of the way, letting her walk over to the pirates’ room while you grab Saendra and scamper off out of sight. The call-girl saunters up to the door, raps her knuckles on it, and leans suggestively against the door frame, thrusting her bare chest out until one of her breasts is pressed against the cold metal.");
	
	output("\n\n<i>“Delivery!”</i> she croons, cupping the other breast and rolling the black nipple between her fingers, drawing out a sweet drop of amber nectar.");
	
	output("\n\nThe door opens a moment later, revealing a rough-looking man in a long duster, face covered in dark stubble. <i>“Wh-what the-”</i> he grunts, eyes going wide.");
	
	output("\n\n<i>“Your friend thought you deserved a little something special,”</i> the");
	if (CodexManager.entryViewed("Zil")) output(" zil");
	else output(" alien");
	output(" woman purrs, hooking her fingers into the front of the pirate’s ballistic vest and pulling him invitingly towards her room. <i>“Why don’t you come with me, hmm?”</i>");
	
	output("\n\n<i>“Uh,”</i> the pirate grunts, pulling at his collar. Over his shoulder, he calls, <i>“Sam, you think you can hold down the fort for a couple minutes?”</i>");
	
	output("\n\n<i>“Yeah, whatever,”</i> a woman’s voice says from inside. <i>“Go... do whatever you’re gonna do. Ya pig.”</i>");
	
	output("\n\nThe man scoffs and turns back to the alien callgirl, smiling wide. One of his hands slips back around her waist, grabbing a handful of yellow-skinned butt. The whore giggles and leads the pirate out of the room he’s supposed to be guarding, and into hers. The door slides closed behind them, and it’s not a minute later that you hear low moans and squeaking bed springs.");
	
	output("\n\n<i>“Wow, that actually worked,”</i> Saendra laughs, drawing her gun again and jogging over to the pirate door. <i>“Guess that guy was more of a lover than a... uh, security guard.”</i>");
	
	output("\n\nYou chuckle, and knock on the door.");
	
	output("\n\n<i>“God dammit,”</i> a woman shouts from inside. <i>“I’m working in here, Mike. Use your damn key.”</i>");
	
	output("\n\nYou and Saen exchange a glance, and you knock again.");
	
	output("\n\n<i>“MIKE I SWEAR TO GOD,”</i> the woman bellows, and you hear something metallic thumping onto the ground. <i>“How the FUCK did you lose your key. Did it fall up that whore’s cunt?”</i>");
	
	output("\n\nThe door’s lock cycles, and you’re face to face with a blonde ausar girl in a tank top with a pair of holo-band goggles pulled up on her forehead. She’s scowling hard when she opens the door, but then goes wide-eyed when she realizes you’re not her partner.");
	
	output("\n\n<i>“Knock knock!”</i> Saen says, cracking the woman over the head with the butt of her pistol.");
	
	output("\n\nThe pirate tech collapses with blood spilling out of her nose, leaving you and Saen to hop over her body and into the room. It’s a small, cramped space with peeling wallpaper and dim lights that barely let you see. A bed has been pushed against the western wall, opposite a metal desk where a truckload of computer gear is set up.");
	
	output("\n\nSitting on the bed with ropes tied around his arms and legs is a grizzled looking human who’s clearly had some better days: he’s gotten roughed up pretty good, and his mechanic’s outfit’s been darkened with blood and grease. Saendra runs over to him and grabs the man’s shoulders.");

	flags["SAENDRA_XPACK1_RESCUE_SHOTGUARD_STATE"] = 1;
	flags["SAENDRA_XPACK1_RESCUE_TECHGUARD_STATE"] = 1;

	// go to rescue scene
	clearMenu();
	addButton(0, "Next", sx1RescueTheDude);
}

public function sx1Holoburn():void
{
	clearOutput();

	generateMapForLocation("HOTEL CORRIDOR");

	output("<i>“Valeria, think you can overload the power in there?”</i> you ask, jerking a thumb to the pirates’ door.");
	
	output("\n\nThe little holo-fairy shakes her head apologetically. <i>“Not from digital space. I’m equipped for basic security tasks, but I don’t have the training protocols to go toe to toe with their hacker. You’d have to do it manually, [pc.name].”</i>");
	
	if (pc.characterClass != GLOBAL.CLASS_ENGINEER)
	{
		output("\n\nWell, shit. You’ll have to find another way.");
		flags["SAENDRA_XPACK1_ASKEDVAL"] = 2;
		sx1PuzzleOfDoomMenu();
		return;
	}
	else
	{
		output("\n\nYou can do that. <i>“Find me a access port and-”</i>");
	
		output("\n\n<i>“There’s one right there,”</i> Val says, flying over to a small panel on the wall. <i>“If you know what wires to cross, you should be able to cause a power surge. If I’m right, the pirates’ hacker is plugged in to a holobank computer inside. Cause an overload, and you’ll knock him out at the very least.”</i>");
		
		output("\n\nSounds good. You crouch down and, with Saen’s help, pull the panel off of the wall and start to pull wires. With a little help from your halfbreed companion and her fairy partner, you find the right wires to cross and converters to boost until the panel erupts in a cloud of sparks and smoke.");
		
		output("\n\nFrom the pirates’ room, you hear a shriek of pain and a heavy thud, like a body collapsing. A second later and the door slams open, and a burly guy wearing a duster over a ballistic vest storms out, a shotgun at the ready.");
		
		output("\n\nSaendra has just enough time to yell <i>“Shit!”</i> before bullets start flying.");

		flags["SAENDRA_XPACK1_RESCUE_TECHGUARD_STATE"] = 2;

		// [Fight!] {Go to Shotgun Guard fite}
		clearMenu();
		addButton(0, "Fight!", sx1InitShotguardFight);
	}
}

public function sx1SaenDistract():void
{
	clearOutput();
	saenHeader();

	generateMapForLocation("HOTEL CORRIDOR");

	output("<i>“Alright, we’ll go with your plan,”</i> you tell Saendra, eyeing her mouthwatering rack. <i>“Let’s lure the bastards out.”</i>");
	
	output("\n\nShe laughs and pulls her shirt up over her head, letting her pink-tipped tits pop free. She gives a jubilant little bounce and saunters over to the pirates’ door, putting herself on full display as she knocks. You put your back to the wall, out of sight of whoever might answer.");
	if (pc.isTaur()) output(" Then again, with a gigantic animal body like yours, you’re not exactly hard to spot...");
	
	output("\n\nThe door opens a few moments later, revealing a burly, gruff-looking pirate in a long coat and a ballistic vest, with a shotgun slung over his shoulder. While he starts out with a scowl and narrowed eyes, his attention immediately shifts down to the halfbreed’s ample tits, and his jaw goes slack.");
	
	output("\n\n<i>“Woah,”</i> he says, staring at Saen’s chest. You take advantage of the man’s momentary distraction to lunge forward and");
	if (pc.PQ() >= 80) output(" deck the bastard, cracking him over the head and watching the body tumble to the deck");
	else if (pc.AQ() >= 80) output(" punch him right in the throat, dropping him gagging onto the deck");
	else output(" grab him, wresting the bastard down until Saen can bash him over the head with a steel-tipped boot");
	output(".");
	
	output("\n\n<i>“Down you go!”</i> Saen laughs, drawing her handgun.");

	flags["SAENDRA_XPACK1_RESCUE_SHOTGUARD_STATE"] = 2;

	// [Next] {to Pirate Tech fite}
	clearMenu();
	addButton(0, "Next", sx1SkipShotguard)
}

public function sx1ThrowFlashbang():void
{
	clearOutput();

	generateMapForLocation("HOTEL CORRIDOR");

	output("<i>“Kick the door,”</i> you say, pulling a flash grenade out and pulling the pin. Saen gives you a nod, rears her leg back, and slams her foot into the door. It buckles, tumbling back on its hinges and you toss the flashbang in.");
	
	output("\n\nA thunderous <i>kabang</i> echoes out of the room with a blinding flash to accompany it. The moment the bang passes, you and Saendra charge in with weapons drawn - and come face to face with a staggering man, dressed in a long coat and a ballistic vest, fumbling for the shotgun strapped to his back.");

	clearMenu();
	addButton(0, "Fight!", sx1InitShotguardFight, true);
}

public function sx1DoorBreach():void
{
	clearOutput();

	generateMapForLocation("SX1 RESCUE ROOM");

	output("<i>“Fuck it. Let’s do it loud,”</i> you say, nodding towards the door. Saen grins and thumbs the safety on her Hammer pistol.");
	
	output("\n\n<i>“Guess I didn’t need a free place to stay anyway,”</i> she chuckles, following your head and getting ready to knock the door in. The two of you exchange and glance, then shove the door in together, charging in the moment the heavy mass of steel buckles beneath your shoulder.");
	
	output("\n\nJust inside the door is a gruff-looking man in a long coat and a ballistic vest - and who’s got a shotgun aimed right at you. There’s no avoiding a fight now!");

	//{To Shotgun Guard fite}
	clearMenu();
	addButton(0, "Fight!", sx1InitShotguardFight);
}

public function sx1InitShotguardFight(wasFlashed:Boolean = false):void
{
	startCombat("SX1SHOTGUARD");
	
	if (wasFlashed)
	{
		foes[0].createStatusEffect("Blind",3,0,0,0,false,"Blind","Accuracy is reduced, and ranged attacks are far more likely to miss.",true,0);
	}
}

public function sx1ShotguardAI():void
{
	// inject saendras AI
	if (sx1SaendraAI()) output("\n\n");

	var blastAvail:Boolean = foes[0].energy() >= 20 && !foes[0].hasStatusEffect("Disarmed");
	var netAvail:Boolean = UpdateStatusEffectCooldown(foes[0], "StunNetCD") && foes[0].energy() >= 10;
	var zapAvail:Boolean = !pc.hasStatusEffect("Stunned") && foes[0].energy() >= 10;

	var attacks:Array = [];
	if (!foes[0].hasStatusEffect("Disarmed")) attacks.push({ v: sx1RangedAttack, w: 30 });
	attacks.push({ v: sx1MeleeAttack, w: 10 });
	if (!foes[0].hasStatusEffect("Disarmed")) attacks.push({ v: sx1ShotguardShotblast, w: 40 });
	if (blastAvail) attacks.push({ v: sx1ShotguardSolidSlug, w: 25 });
	if (netAvail) attacks.push({ v: sx1ShotguardRopeShot, w: 10 });
	if (zapAvail) attacks.push({ v: sx1ShotguardStunBaton, w: 20 });

	weightedRand(attacks)();

	processCombat();
}

public function sx1RangedAttack():void
{
	rangedAttack(foes[0], pc);
}

public function sx1MeleeAttack():void
{
	attack(foes[0], pc);
}

public function sx1ShotguardShotblast():void
{
	// Shotgun Blast
	// Deals light to moderate damage; always hits.

	var numHits:int = 1;
	for (var i:int = 0; i < 5; i++)
	{
		if (!rangedCombatMiss(foes[0], pc, -1)) numHits++;
	}

	var damage:TypeCollection = foes[0].rangedDamage();
	damage.multiply(0.33 * numHits); // potentially double the damage of a base ranged shot

	output("The pirate gunner fires off his shotgun, blasting you with a cone of hot lead!");
	applyDamage(damage, foes[0], pc, "minimal");
}

public function sx1ShotguardSolidSlug():void
{
	// Solid Slug
	// Deals heavy damage, but has a chance to miss

	output("The pirate shoves a shell into the bottom of his shotgun and pumps it in. Grinning maliciously, he shoulders his gun and fires it at you, blasting you with a solid slug of lead as thick around as your thumb.");
	
	foes[0].energy(-20);

	if (rangedCombatMiss(foes[0], pc))
	{
		output(" The shell misses, blasting a hole in the bulkhead!");
	}
	else
	{
		output(" The shell hits!");
		var damage:TypeCollection = foes[0].rangedDamage();
		damage.multiply(1.5);
		applyDamage(damage, foes[0], pc, "minimal");
	}
}

public function sx1ShotguardRopeShot():void
{
	// Rope Shot
	// Shot that deals light Piercing damage and entangles the target. 

	var tarChoice:Boolean = rand(2) == 0;

	output("The pirate switches his finger to a second trigger and pulls it, shooting a rope and hook from a second barrel under his gun! The rope shot shoots towards");
	if (tarChoice == true) output(" you,");
	else output(" Saendra,");

	if (rangedCombatMiss(foes[0], pc, -1, 2))
	{
		output(" but buries itself harmlessly in the wall.");
	}
	else
	{
		output(" swinging around and around until it binds"); 
		if (tarChoice == false)
		{
			output(" her arms against her side. Saendra is");
			pc.createStatusEffect("SaenStunned", 3);
		}
		else
		{
			output(" your arms to your side. You are");
			pc.createStatusEffect("Grappled", 0, 30, 0, 0, false, "Constrict", "You're stuck in the pirates net!", true, 0);
			// 9999 -- might need new grappletexts for this to make sense
		}
		output(" restrained!");
	}

	foes[0].createStatusEffect("StunNetCD", 5);
	foes[0].energy(-10);
}

public function sx1ShotguardStunBaton():void
{
	// Stun Baton
	//Light Electrical damage, high chance to stun

	output("The pirate yanks a baton off his belt and lunges at you, fingering a button as he does so that causes the haft of it to erupt on a burst of electricity. Zap!");
	if (!combatMiss(foes[0], pc))
	{
		output(" You take a shock right to the chest, zapping you!");
		output(" <b>Worse, you're stunned!</b>");
	}
	else
	{
		output(" You just manage to duck under the swing, evading the pirate's attack!");
	}

	foes[0].energy(-10);
}

public function sx1ShotguardPCVictory():void
{
	clearOutput();
	showName("VICTORY:\nVOID PIRATE");

	generateMapForLocation("SX1 RESCUE ROOM");

	flags["SAENDRA_XPACK1_RESCUE_SHOTGUARD_STATE"] = 3;

	output("The guard collapses, unable to fight anymore. Saen gives him a solid kick to the head, making sure he’s down for the count, and flashes you a cocky grin. The two of you advance into the pirates’ room, stepping over the guard’s body as you go.");

	if (flags["SAENDRA_XPACK1_RESCUE_TECHGUARD_STATE"] != undefined)
	{
		output("\n\nInside, you find a knocked out ausar woman jacked into an expensive-looking computer rig. She’s face-down on a desk at the side of the room, with smoke coming from the headset plugged into her ears. Ouch.");
		
		output("\n\nOpposite her, a bed has been pushed against the western wall, opposite a metal desk where a truckload of computer gear is set up. Sitting on the bed with ropes tied around his arms and legs is a grizzled looking human who’s clearly had some better days: he’s gotten roughed up pretty good, and his mechanic’s outfit’s been darkened with blood and grease. Saendra runs over to him and grabs the man’s shoulders.");

		//Go to "Rescue" scene
		clearMenu();
		addButton(0, "Next", sx1RescueTheDude, true);
	}
	else
	{
		output("\n\nAn ausar woman with a shock of blonde hair is standing inside, aiming a machine pistol at you and stumbling back until she’s against the far wall with nowhere else to go. Wires lead down from a brace around her neck to a huge rig of computer equipment planted on a desk a few feet away.");
		
		output("\n\n<i>“Stay back!”</i> she shouts, waving her gun around. <i>“I’m warning you!”</i>");
		
		output("\n\n<i>“Get fucked, bitch,”</i> Saen answers, taking aim.");
		
		output("\n\nThat settles that!");

		// [Fight] {To Tech Fite}
		clearMenu();
		addButton(0, "Fight!", sx1InitTechguardFight);
	}
}

public function sx1SkipShotguard():void
{
	clearOutput();

	generateMapForLocation("SX1 RESCUE ROOM");

	output("Cautiously, you peer into the room. An ausar woman with a shock of blonde hair is standing inside, aiming a machine pistol toward the door and stumbling back until she’s against the far wall with nowhere else to go. Wires lead down from a brace around her neck to a huge rig of computer equipment planted on a desk a few feet away.");
		
	output("\n\n<i>“Stay back!”</i> she shouts, waving her gun around. <i>“I’m warning you!”</i>");
	
	output("\n\n<i>“Get fucked, bitch,”</i> Saen answers, taking aim through the door.");
	
	output("\n\nThat settles that!");

	clearMenu();
	addButton(0, "Fight!", sx1InitTechguardFight);
}

public function sx1ShotguardPCLoss():void
{
	clearOutput();
	showName("DEFEAT:\nVOID PIRATE");

	generateMapForLocation("SX1 RESCUE ROOM");

	output("<i>“Hehehe,”</i> the pirate chuckles as you and Saen collapse, battered down by his barrage of shells. <i>“Got us a couple of live ones here... and what’s this?”</i> he grunts, turning to Saendra. <i>“Ah, you’re the kitten Bragga was after, aren’t you? Come to rescue your friend, huh?”</i>");
	
	output("\n\nHe tsks his tongue and kicks Saen’s pistol away, leaving her defenseless. <i>“There’s a bounty out on you, kitten. Guess I’ll be getting paid double... plus a little fun before I hand you over. As for your friend...”</i> he waves his shotgun over in your direction, and pulls the trigger as casually as he might toss away a cigarette butt. Your world is overwhelmed by a lightning bolt of pain, and the world goes black.");
	
	output("\n\nIn the end, you got the easy way out.");

	badEnd();
}

public function sx1InitTechguardFight():void
{
	startCombat("SX1TECHGUARD");
}

public function sx1TechguardAI():void
{
	// inject Saendra AI
	if (sx1SaendraAI()) output("\n\n");
	
	UpdateStatusEffectCooldown(foes[0], "StunCD");

	if (foes[0].shields() <= 0 && !foes[0].hasStatusEffect("ShieldBoostCD"))
	{
		sx1TechguardShieldRecharge();
	}
	else
	{
		var attacks:Array = [];

		attacks.push( { v: sx1TechguardMachinePistolBurst, w: 30 } );
		if (!foes[0].hasStatusEffect("StunCD")) attacks.push( { v: sx1TechguardShockDart, w: 10 } );
		attacks.push( { v: sx1TechguardTease, w: (foes[0].lust() / 2) } );

		weightedRand(attacks)();
	}
	
	if (foes[0].shields() > 0)
	{
		output("\n\n");
		sx1TechguardDroneAttack();
	}
	
	processCombat();
}

public function sx1TechguardMachinePistolBurst():void
{
	// Machine Pistol Burst
	// Light damage, several attacks

	output("The pirate tech sprays bullets at you, firing wildly from the hip!");

	var numHits:int = 0;
	for (var i:int = 0; i < 4; i++)
	{
		if (!rangedCombatMiss(foes[0], pc, -1, 0 - i))
		{
			numHits++;
		}
	}

	if (numHits == 0) output(" All of her shots go wide!");
	else
	{
		output(" " + num2Text(numHits) + " bullet");
		if (numHits > 1) output("s");
		output(" hit, drilling you!");

		var damage:TypeCollection = foes[0].rangedDamage();
		damage.multiply(0.4 * numHits);

		applyDamage(damage, foes[0], pc, "minimal");
	}
}

public function sx1TechguardShockDart():void
{
	// Shock Dart
	// Light electrical damage, high Stun chance

	output("The pirate tech fires a dart from a device on her wrist,");

	if (rangedCombatMiss(foes[0], pc))
	{
		output(" though you're able to duck out of the way.");
	}
	else
	{
		output(" hitting you in the shoulder. The darts instantly release an agonizing shock of electricity, making you yelp in agony.");

		applyDamage(new TypeCollection({ electric: 17 }), foes[0], pc, "minimal");

		if (pc.physique() + rand(25) + 1 < 35)
		{
			output(" The shock of it leaves you reeling -- <b>you're stunned!</b>");
			pc.createStatusEffect("Stunned", 3, 0, 0, 0, false, "Stun", "Cannot take action!", true, 0);
		}
	}
	
	foes[0].createStatusEffect("StunCD", 5);
}

public function sx1TechguardTease():void
{
	// Tease
	//Basic lust attack

	output("Hey, come on,”</i> the tech says, pressing her back to the wall and zipping down the front of her flight suit, revealing the perky mounds of her tits. <i>“Why don’t you put those weapons down, huh? We can work something out...”</i> she groans, running a hand up her chest.");

	if (pc.willpower() + rand(30) + 1 < 30)
	{
		output("\n\nAn subtle warmth builds in your crotch as you stare at the ausar womans pert breasts, transfixed by their succulent, pliant flesh forming so perfectly around the tips of her fingers....");
		applyDamage(new TypeCollection({ tease: 10 * (pc.libido() / pc.libidoMax()) }), foes[0], pc, "minimal");
	}
	else
	{
		output("\n\nYou respond with a polite, and obviously fake, cough. The ausar womans sensual show ends as abruptly as it started. <i>“Hey, don’t stop now!.”</i> You shoot a glare at Saen. <i>“What? I'm not going to turn down a free show.”</i> Touché.");
		applyDamage(new TypeCollection({ tease: 2 }), foes[0], pc, "minimal");
	}
}

public function sx1TechguardDroneAttack():void
{
	// Drone Attack
	// Light laser shot, so long as her shields are still up.
	var bHit:Boolean = false;

	output("The techie’s drone fires at you, scorching");
	if (rangedCombatMiss(foes[0], pc, -1, 2))
	{
		bHit = true;
		output(" the wall");
	}
	else
	{
		output(" you");
	}

	if (bHit)
	{
		output(" with it’s laser.");

		applyDamage(new TypeCollection({ burning: 3 }), foes[0], pc, "minimal");
	}
}

public function sx1TechguardShieldRecharge():void
{
	// Shield Recharge
	//1/encounter. Recharge 50% shields.
	output("The pirate babe grabs the generator on her belt and pushes it into maximum overdrive, giving herself a few more seconds of shielding from your assault.");

	foes[0].shields(foes[0].shieldsMax() * 0.5);
	foes[0].createStatusEffect("ShieldBoostCD");
}

public function sx1TechguardPCVictory():void
{
	clearOutput();
	showName("VICTORY:\nVOID TECHIE");

	generateMapForLocation("SX1 RESCUE ROOM");

	if (flags["SAENDRA_XPACK1_RESCUE_SHOTGUARD_STATE"] != 3) output("The last of the pirates");
	else output("The techie pirate");
	output(" collapses, unable to put up any more resistance. Saen breathes a sigh of relief, and the two of you advance into the room. It’s a small affair, with peeling wallpaper and dim lights that barely let you see. A bed has been pushed against the western wall, opposite a metal desk where a truckload of computer gear is set up.");

	output("\n\nSitting on the bed with ropes tied around his arms and legs is a grizzled looking human who’s clearly had some better days: he’s gotten roughed up pretty good, and his mechanic’s outfit’s been darkened with blood and grease. Saendra runs over to him and grabs the man’s shoulders.");

	// {To Rescue scene}
	clearMenu();
	addButton(0, "Next", sx1RescueTheDude, true);
}

public function sx1TechguardPCLoss():void
{
	clearOutput();
	showName("DEFEAT:\nVOID TECHIE");

	generateMapForLocation("SX1 RESCUE ROOM");

	flags["SAENDRA_XPACK1_RESCUE_TECHGUARD_STATE"] = 4;
	flags["SAENDRA_XPACK1_STATUS"] = 8;

	output("The resistance drains out of you, and soon you find yourself slumping to the ground with a groan. Saen follows you a moment later, succumbing to her injuries.");
	
	output("\n\n<i>“Holy shit. Get some!”</i> the pirate babe cheers, fist-pumping the air in front of her. She holsters her machine pistol and walks over to Saendra, grabbing the halfbreed by the scruff of the neck. <i>“And you’re that renegade we were supposed to keep an eye out for, aren’t you? Man, there’s a huge bounty on your head, bitch. Guess I get to collect.");
	
	output("\n\n<i>“As for you,”</i> she says, turning your way. <i>“Who the fuck are you? You know what; doesn’t matter. Fuck off.”</i>");
	
	output("\n\nHer boot comes down with an agonizing <i>crack</i>, and your world goes black.");

	clearMenu();
	addButton(0, "Next", sx1TechguardPCLossII);
}

public function sx1TechguardPCLossII():void
{
	clearOutput();
	showName("DEFEAT:\nVOID TECHIE");

	currentLocation = "MERCHANT'S THOROUGHFARE";

	output("You wake up... what must be hours later with a splitting headache and swimming vision. Everything hurts.");
	
	output("\n\n<i>“You okay?”</i> a voice says as you strain to open your eyes. You’re on Tavros station still - that much is obvious, by the blinding lights and the faint music playing over the merchant row speakers. A uniformed station security officer is kneeling over you, a concerned look on her face.");
	
	output("\n\n<i>“Hey, you alright?”</i> the officer repeats, shaking your shoulder. She’s reaching for her radio by the time you manage to nod, and pull yourself up into a sitting position. You grunt and grab your head, trying to arrest the pounding in your skull.");
	
	output("\n\nYou look around, at the glowing white lights above and the flickering holo-signs of the merchant shops around you. You’re just outside");
	if (flags["MET_SERA"] != undefined) output(" Sera’s shop");
	else output(" one of the transformative vendors");
	output(" near Anon’s... and very much alone. Saendra’s nowhere to be seen.");
	
	output("\n\n<i>“I’m... I’m fine,”</i> you groan. You must have been dumped on the side of the corridor after the pirates had done with you.");
	
	output("\n\nThe guard helps you up and you end up having to file a report with Tavros security: telling them that you and your friend got into a firefight with pirates twice, and ended up losing this second time. The officer expreses her sympathies, but tells you that there’s not a lot security can do about it: the station’s cameras tracked the pirates all the way to the docks, but they left well before you woke up. With Saen in tow, too.");
	
	output("\n\nAs you’re discharged from station security and make your way back down to the merchant deck, you are forced to come to the realization that you’ll probably never see Saendra again...");

	// {Return to Anon's. Saendra is missing.}
	flags["SAENDRA_DISABLED"] = 1;

	genericLoss();
}

public function sx1RescueTheDude(fromCombat:Boolean = false):void
{
	clearOutput();

	flags["SAENDRA_XPACK1_STATUS"] = 9;

	generateMapForLocation("SX1 RESCUE ROOM");

	output("<i>“Pete! Peter, you okay?”</i> Saendra says, gently shaking the man’s shoulders. He groans and slumps forward into her arms, alive but badly beaten.");
	
	output("\n\n<i>“Shit,”</i> Saen sighs, putting her arms around his shoulders. <i>“I gotta get him to a hospital, [pc.name]. Thanks for the help... I owe you.”</i>");
	
	output("\n\nSomething’s been gnawing at you for a while about... well, everything with Saendra. You’re not dumb enough to think these attacks are just random anymore. <i>“I think you owe me an explanation.”</i>");
	
	output("\n\nShe flinches as if struck, and her twin tails coil down defensively under her legs. <i>“Yeah... I guess I do, huh, hero? Look, like I said, I gotta get Pete here to a doctor. Catch me down at the bar sometime and I’ll tell you. I promise.");
	if (flags["SAENDRA_XPACK1_RESCUE_SHOTGUARD_STATE"] == 3 || flags["SAENDRA_XPACK1_RESCUE_TECHGUARD_STATE"] == 3) output(" Well, assuming I don’t get arrested first,”</i> she says, looking around at the bullet holes in the walls.");
	output(" ”</i>");
	
	output("\n\nThat’ll have to do. You step out of Saendra’s way, and she hefts her friend up into her arms and staggers out towards the stairs. For your part, you spend a few minutes ransacking the place, trying to find anything of use.");
	
	output("\n\n");
	if (flags["SAENDRA_XPACK1_RESCUE_TECHGUARD_STATE"] == 2) output("Unfortunately, you fried the pirates’ computer");
	else output("Unfortunately, the pirate techie must have fried her hard drive before she went down");
	output(". You won’t be getting any information from that. You do, however, find a datapad on the tech’s body. Not only is it loaded with credits, which you quickly hijack, but there’s a bounty notice on it as well.");

	pc.credits += 5000;
	
	output("\n\nSomebody’s offering a hefty twenty grand for Saendra’s capture. Somebody named <i>“Lord Bragga”</i> of the Black Void Pirates. What the hell has Saen gotten herself mixed up with?");
	
	output("\n\nYou pocket the datapad and head back down to the bar. You’ll have to ask your hybrid companion herself if you want to find out the truth.");

	//Key Item Added: Pirate Datapad
	pc.createKeyItem("Pirate Datapad");

	if (fromCombat) genericVictory();
	else
	{
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
}

public function sx1SaensFriendExpired():void
{
	clearOutput();
	saenHeader();

	output("<i>“Did you manage to find your friend?”</i> you ask, immediately regretting asking when she gets a very sad look on her face.");
	
	output("\n\n<i>“No,”</i> Saen says, resting her chin in her hands. <i>“Well, yes, but too late. Pirate bastards had already put a bullet in him by the time I got there. I fucked up, [pc.name]. Real bad.”</i>");
	
	output("\n\nYou grimace and put a hand on hers, squeezing it tight as the halfbreed lets out a ragged breath. <i>“Pete is... he was a mechanic at the docks. The station chief decided the </i>Phoenix<i> was too banged up to take off - but she’s space worthy, I made sure of it! Pete agreed with me, said he’d smuggle me the access codes I’d need to take off without the chief noticing. I guess somebody must have been monitoring my comms... or maybe they grabbed Pete from the get-go. Who knows. Either way, I got him killed, and I’ve got nothing to show for it.”</i>");
	
	output("\n\nA moment of silence passes before you ask if there’s anything you can do to help her.");
	
	output("\n\nSaen sighs and runs her chrome fingers through her hair. <i>“I don’t know, hero. Unless you’ve got Tavros access codes tucked up your ass, I don’t think I’m ever going to get out of here. Not for a few years, anyway, until I can save up enough for a total refit of the </i>Phoenix<i>.”</i>");
	
	output("\n\n<b>If you have the credits to spare, maybe you could help Saendra out with that.</b>");

	flags["SAENDRA_XPACK1_STATUS"] = 11;
	flags["SAENDRA_XPACK1_CREDITOFFER"] = 1;

	saendrasBarMenu();
}

public function sx1OfferCredits():void
{
	clearOutput();
	saenHeader();

	output("<i>“Hey, I’ve been thinking,”</i> you say, fishing a credit stick out of your pack. <i>“If this would help you out, Saen...”</i>");
	
	output("\n\nHer eyes widen as she realizes what it is in your hand. <i>“Hey, what... what is this?”</i>");
	
	output("\n\nYou shrug. <i>“I know you’re strapped for cash, so, I mean, I have plenty to spare...”</i>");
	
	output("\n\n<i>“Oh, you");
	if (pc.tallness > saendra.tallness) output(" big");
	else output(" little");
	output(" idiot...”</i> Saen sighs, reaching across the table and curling your fingers back around the credit chit. <i>“I don’t... I can’t take that, hero. You’ve done so much for me already. The last thing I want is to owe you more than I already do.”</i>");
	
	output("\n\nShe tries to push your hand back, but you insist. You tell her to quit playing tough, to let you help her. After all, you <i>have</i> helped her so much in the past - you don’t want to see her rotting here on Tavros forever. She deserves a second chance, and you’re in a position to give it to her.");
	
	output("\n\nSaendra sighs. <i>“You’re a sweetheart, you know that?”</i> she says with a wry laugh. <i>“One hell of a sweetheart.”</i>");
	
	output("\n\nShe smiles and wraps her chromed fingers around your hand, and the credit chit therein. Before she takes it, though, you squeeze her hand and ask if <i>“sweetheart”</i> is all she thinks about you.");
	
	output("\n\n<i>“Not by a long shot,”</i> Saendra says, reaching across the table to plant a kiss on your lips: soft, gentle, loving. You give her the credit chit, and return the red-maned pilot’s kiss with as much ardor as you can muster.");
	
	output("\n\nWhen you break the kiss, Saen leans her brow against yours, keeping you together a moment longer. <i>“Alright. I’m gonna go get started putting this to good use. I, um... thank you, [pc.name]. This means the world to me. I’ll see you soon.”</i>");
	
	output("\n\nYou nod and wave, letting Saendra slip out of the bar to start putting that money to use.");

	//Remove Saen from the bar for 24 hours.
	flags["SAENDRA_XPACK1_CREDITOFFER"] = 2;
	flags["SAENDRA_XPACK1_CREDITTIME"] = GetGameTimestamp();
	pc.credits -= 20000;
	flags["SAENDRA_MAX_AFFECTION"] = 100;
	saendraAffection(30);


	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function sx1TalkPirates():void
{
	clearOutput();
	saenHeader();

	flags["SAENDRA_XPACK1_STATUS"] = 10;

	output("<i>“Hey,”</i> you say, drawing the pirate datapad from your pack and tossing it onto the table. <i>“We need to talk.”</i>");
	
	output("\n\nSaen cocks an eyebrow and picks it up. Murmuring <i>“What’s this,”</i> she starts to flip through it. As she does, her emerald eyes grow wide. <i>“What the fuck...”</i>");
	
	output("\n\n<i>“Don’t tell me you don’t know what that’s about,”</i> you say, narrowing your eyes. <i>“You don’t get the Black Void putting a bounty that big on you just because.”</i>");
	
	output("\n\nShe doesn’t answer you for a while, too busy staring slack-jawed at the datapad you looted from her would-be attackers. After what seems like a brief eternity, Saendra sets it down and steeples her fingers.");
	
	output("\n\n<i>“I can’t believe she did that,”</i> Saen finally says, sighing. <i>“I understand the shit with the </i>Phoenix<i>, even kind of expected it. But a bounty? That’s low, Miri.”</i>");
	
	output("\n\n<i>“What’re you talking about? Who’s Miri?”</i>");
	
	output("\n\nYour companion doesn’t meet your eye as she answers. <i>“Mirian Bragga. A Dread Lord of the Black Void pirates, one of the most powerful women in the galaxy’s underworld. She... we were...”</i> she pauses for a moment, struggling to collect her thoughts. When she continues, Saendra’s robotic fingers clench hard. <i>“Miri and I were raised together. Like sisters, almost. And yeah, before you ask, that means I used to be part of the Void. My parents commanded an interceptor frigate on the fringe; when I was born, they left me on a Void base to keep me safe. Miri was just a year older, and our parents were good friends. So Miss Bragga and her servants brought me up, same as her daughter.”</i>");
	
	output("\n\n<i>“I could have been her second in command,”</i> Saen laughs sadly. <i>“We were such good friends...”</i>");
	
	output("\n\nShe puts her chin in her hands and glances up at you, waiting for you to speak. <i>“What happened to make you leave?”</i>");
	
	output("\n\n<i>“I didn’t get the chance to leave. Not officially. I guess you could call the day you rescued me my farewell party.”</i> She laughs, <i>“No, I didn’t leave. I did steal something though - or at least, I refused to give Miri something she wanted. I just never thought she wanted it that badly.”</i>");
	
	output("\n\n<i>“Bad enough to want to kill you.”</i>");
	
	output("\n\n<i>“Probably worse than that,”</i> Saendra says with a shake of her head. <i>“Listen, I know you have questions... and if you never want to talk to a filthy pirate again, well... I’d understand. I’d feel like shit for a while, but I’d understand. Pirates have a bad rep for a reason, and I deserve that. I’ve done some shitty things that I wish I hadn’t. But my friend, Pete - the guy we rescued? He’s fine, by the way - he gave me the codes to pull the </i>Phoenix<i> out of Tavros without the chief mechanic’s permission. What I stole from Miri... that’s my chance to start fresh. It’s intelligence, data the Void’s been gathering and studying for years now. Some kind of treasure map, basically. And I’m going to steal it right out from under the bastards.”</i>");
	
	output("\n\nFirst Saendra turns out to be an ex-pirate, and now she wants to go on a treasure hunt? What storybook did she fall out of?");
	
	output("\n\n<i>“If you still want anything to do with me, I could always use a first mate when I go to find the Void’s treasure. Hopefully I’ll be ready to leave soon, now that I have the codes.”</i>");
	
	output("\n\nYou suppose you have a decision to make regarding your pirate-babe");
	if (flags["SAENDRA TIMES SEXED"] != undefined) output(" lover");
	else output(" companion");
	output(".");
	
	flags["SAENDRA_MAX_AFFECTION"] = 100;
	saendraAffection(30);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
