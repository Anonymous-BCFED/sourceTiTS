import classes.Characters.PlayerCharacter;


function initializeRooms():void 
{

	// clear out the rooms object, and re-initialize it.
	this.rooms = new Object();

	//
	// WRT Map generation: "In" is +1 in the z axis, and out is -1
	// N, S, E, W are the expected cardinal directions

	//99. Ship Interior
	rooms["SHIP INTERIOR"] = new RoomClass(this);
	rooms["SHIP INTERIOR"].roomName = "SHIP\nINTERIOR";
	rooms["SHIP INTERIOR"].description = "The inside of your father's old Casstech Z14 is in remarkably great shape for such an old ship; the mechanics that were working on this really ought to be proud of themselves. Seats for two lie in the cockpit, and there is a servicable but small shower near the back. Three bunks are scattered around the cramped interior, providing barely ample room for you and your crew.";
	rooms["SHIP INTERIOR"].planet = "PLANET: MHEN'GA";
	rooms["SHIP INTERIOR"].system = "SYSTEM: ARA ARA";
	rooms["SHIP INTERIOR"].outExit = shipLocation;
	rooms["SHIP INTERIOR"].outText = "Exit";
	rooms["SHIP INTERIOR"].runOnEnter = shipMenu;
	rooms["SHIP INTERIOR"].addFlag(GLOBAL.INDOOR);
	rooms["SHIP INTERIOR"].addFlag(GLOBAL.BED);

	//100. Hotel Room
	rooms["HOTEL ROOM"] = new RoomClass(this);
	rooms["HOTEL ROOM"].roomName = "HOTEL\nROOM";
	rooms["HOTEL ROOM"].description = "This small, station-bound room is attached to Anon's Bar and Board. The quarters are cramped, there are no windows, and worst of all, your cousin has a headstart on locking down your deceased father's fortune. Luckily, the galaxy is vast. Your cousin won't be claiming if anything for at least a few months if the scale of your father's challenge is anything like you expect. The door to the east is unlocked, leading back into the hallway above the bar. <b>Once you leave, it will seal shut behind you, since you only payed for one night.</b>";
	rooms["HOTEL ROOM"].planet = "TAVROS STATION";
	rooms["HOTEL ROOM"].system = "SYSTEM: KALAS";
	rooms["HOTEL ROOM"].eastExit = "ANON'S BOARD HALL";
	rooms["HOTEL ROOM"].addFlag(GLOBAL.INDOOR);

	//101. Anon's Board Hall
	rooms["ANON'S BOARD HALL"] = new RoomClass(this);
	rooms["ANON'S BOARD HALL"].roomName = "ANON'S BOARD\nHALL";
	rooms["ANON'S BOARD HALL"].description = "Located at the top of a stairway above the bar, this short hallway stretches briefly to the north before coming to an unremarkable, metallic dead-end. Automated portals line the east and west sides, connecting to different rooms, their surfaces kept moderately clean but pitted with rust here or there. This isn't the kind of place you'd want to stay for long, if you could help it. Anon's Bar and Board lies down the steel-grated stairwell to the south.";
	rooms["ANON'S BOARD HALL"].planet = "TAVROS STATION";
	rooms["ANON'S BOARD HALL"].system = "SYSTEM: KALAS";
	rooms["ANON'S BOARD HALL"].southExit = "ANON'S BAR AND BOARD";
	rooms["ANON'S BOARD HALL"].addFlag(GLOBAL.INDOOR);

	//102 "ANON'S BAR AND BOARD". Anon's Bar and Board
	rooms["ANON'S BAR AND BOARD"] = new RoomClass(this);
	rooms["ANON'S BAR AND BOARD"].roomName = "ANON'S BAR\nAND BOARD";
	rooms["ANON'S BAR AND BOARD"].description = "Heady alcoholic scents combine with drug-laced smoke and salty food to give this place the unquestionable aroma of a seedy bar. Three-breasted waitresses balancing trays full of drinks one-handed sashay around in short skirts and sheer tops, their gait made awkward by their three legs and small feet. A rickety metal stairway rises up to the north, leading to the board portion of the this establishment. You've already roomed there once, and the accomodations were far from great. A door to the west opens out into a central thoroughfare.";
	rooms["ANON'S BAR AND BOARD"].planet = "TAVROS STATION";
	rooms["ANON'S BAR AND BOARD"].system = "SYSTEM: KALAS";
	rooms["ANON'S BAR AND BOARD"].northExit = "ANON'S BOARD HALL";
	rooms["ANON'S BAR AND BOARD"].westExit = "MERCHANT'S THOROUGHFARE";
	rooms["ANON'S BAR AND BOARD"].runOnEnter = anonsBarAddendums;
	rooms["ANON'S BAR AND BOARD"].addFlag(GLOBAL.INDOOR);
	rooms["ANON'S BAR AND BOARD"].addFlag(GLOBAL.BAR);

	//103 "MERCHANT'S THOROUGHFARE". Merchant's Thoroughfare
	rooms["MERCHANT'S THOROUGHFARE"] = new RoomClass(this);
	rooms["MERCHANT'S THOROUGHFARE"].roomName = "MERCHANT'S\nTHOROUGHFARE";
	rooms["MERCHANT'S THOROUGHFARE"].description = "The crowds in this part of the station would normally be particularly thick, but it looks like many of the local business have been shuttered, their owners likely trying their business out on the rim, profiteering off the planet rush. For now, Anon's Bar and Board looks to be open out the east. Its interior promises cheap but delicious foods likely to broaden the waistline, but then again, what are you to expect from bar food? The express lifts have entrances here, able to take you to any level on the station if you head <b>in</b> the door.";
	rooms["MERCHANT'S THOROUGHFARE"].planet = "TAVROS STATION";
	rooms["MERCHANT'S THOROUGHFARE"].system = "SYSTEM: KALAS";
	rooms["MERCHANT'S THOROUGHFARE"].eastExit = "ANON'S BAR AND BOARD";
	rooms["MERCHANT'S THOROUGHFARE"].westExit = "FUR EFFECT";
	rooms["MERCHANT'S THOROUGHFARE"].southExit = "BETHS BROADS";
	rooms["MERCHANT'S THOROUGHFARE"].northExit = "DARK CHRYSALIS";
	rooms["MERCHANT'S THOROUGHFARE"].inExit = "LIFT: MERCHANT DECK";
	rooms["MERCHANT'S THOROUGHFARE"].inText = "Lift";
	rooms["MERCHANT'S THOROUGHFARE"].addFlag(GLOBAL.INDOOR);

	//104 "LIFT: MERCHANT DECK". In The Lift - Merchant's Thoroughfare
	rooms["LIFT: MERCHANT DECK"] = new RoomClass(this);;
	rooms["LIFT: MERCHANT DECK"].roomName = "LIFT: MERCHANT\nDECK";
	rooms["LIFT: MERCHANT DECK"].description = "Steady, mechanical thrums suffice the stuffy air inside this tube of metal and and plastic. There is a brass-hued railing to stablize oneself with during the highspeed travel through the kilometers-long station and a sturdy mechanical keypad with which to designate your target level. Much of the lift stations look to be inactive; right now, the hangar and the merchant's thoroughfare are the only areas reachable by lift.";
	rooms["LIFT: MERCHANT DECK"].planet = "TAVROS STATION";
	rooms["LIFT: MERCHANT DECK"].system = "SYSTEM: KALAS";
	//rooms["LIFT: MERCHANT DECK"].inExit = "MERCHANT'S THOROUGHFARE";
	rooms["LIFT: MERCHANT DECK"].outExit = "MERCHANT'S THOROUGHFARE";
	rooms["LIFT: MERCHANT DECK"].addFlag(GLOBAL.INDOOR);
	rooms["LIFT: MERCHANT DECK"].runOnEnter = hangarBonus;

	//105 "TAVROS HANGAR". The Hangar
	rooms["TAVROS HANGAR"] = new RoomClass(this);
	rooms["TAVROS HANGAR"].roomName = "THE\nHANGAR";
	rooms["TAVROS HANGAR"].description = "A sprawling, brightly lit hangar greets your eyes, empty save for a single ship near the back. Your gaze is pulled away from the distant craft by the sheer size of the enclosure. A hangar like this must have cost your father a veritable fortune to buy out - not much considering how wealthy he was, but no insignificant chunk of change. Magnetically-bounded plasma shields hold in the atmosphere while remaining transparent enough for you to view the nearby warp gate and inky blackness beyond. Perhaps the only thing this place couldn’t hold would be a capital ship, but a number of moorings with connective umbilicals stand by to tether one outside in that extreme scenario.";
	rooms["TAVROS HANGAR"].planet = "TAVROS STATION";
	rooms["TAVROS HANGAR"].system = "SYSTEM: KALAS";
	rooms["TAVROS HANGAR"].inExit = "TAVROS LIFT";
	rooms["TAVROS HANGAR"].inText = "Lift";
	rooms["TAVROS HANGAR"].addFlag(GLOBAL.INDOOR);

	//106"TAVROS LIFT". In The Lift - The Hangar
	rooms["TAVROS LIFT"] = new RoomClass(this);
	rooms["TAVROS LIFT"].roomName = "LIFT: HANGAR\nDECK";
	rooms["TAVROS LIFT"].description = "Steady, mechanical thrums suffice the stuffy air inside this tube of metal and and plastic. There is a brass-hued railing to stablize oneself with during the highspeed travel through the kilometers-long station and a sturdy mechanical keypad with which to designate your target level. Much of the lift stations look to be inactive; right now, the hangar and the merchant's thoroughfare are the only areas reachable by lift.";
	rooms["TAVROS LIFT"].planet = "TAVROS STATION";
	rooms["TAVROS LIFT"].system = "SYSTEM: KALAS";
	rooms["TAVROS LIFT"].outExit = "TAVROS HANGAR";
	//rooms["TAVROS LIFT"].inExit = "LIFT: MERCHANT DECK";
	//rooms["TAVROS LIFT"].inText = "ToMerchant";
	rooms["TAVROS LIFT"].addFlag(GLOBAL.INDOOR);
	rooms["TAVROS LIFT"].runOnEnter = hangarBonus;

	//107 The Dark Chrysalis
	rooms["DARK CHRYSALIS"] = new RoomClass(this);
	rooms["DARK CHRYSALIS"].roomName = "SHOP: DARK\nCHRYSALIS";
	rooms["DARK CHRYSALIS"].description = "The interior of this shop is difficult to make out thanks to a combination of dim lighting and a smoky haze that smells vaguely of walnuts. Looking around, you manage to locate the source of the illumination - four custom glowbulbs pumping out an unnatural-looking blue-black aura. The walls are covered in shelves with dozens of perverted-looking nicknames, many of them demonic in theme, and the lone counter in the back of the store is similarly decorated.";
	rooms["DARK CHRYSALIS"].planet = "TAVROS STATION";
	rooms["DARK CHRYSALIS"].system = "SYSTEM: KALAS";
	rooms["DARK CHRYSALIS"].southExit = "MERCHANT'S THOROUGHFARE";
	rooms["DARK CHRYSALIS"].addFlag(GLOBAL.INDOOR);
	rooms["DARK CHRYSALIS"].addFlag(GLOBAL.COMMERCE);
	rooms["DARK CHRYSALIS"].runOnEnter = seraBonusFunction;

	//108 "FUR EFFECT" Fur Effect
	rooms["FUR EFFECT"] = new RoomClass(this);
	rooms["FUR EFFECT"].roomName = "SHOP:\nFUR EFFECT";
	rooms["FUR EFFECT"].description = "The sign declared this store to be \"Fur Effect,\" and you can see why. Your [pc.feet] sink ankle-deep into thick, pink shag. The plush, pink rug covers the entire floor of the shop, giving way to a fuzzy-looking maroon wall treatment. Even the light sources appear to be wispy, vase-bound feathers, emitting a steady rainbow glow. There are also dozens of pictures and holos of attractive looking furred beings in various poses. One showcases a slinky ferret-girl bending her entire body backwards into an 'o' in a display of supreme flexibility. Another is a floating, holographic cow-girl modelling a straining set of overalls. Behind it, there is a velvety countertop and hardlight projected register.";
	rooms["FUR EFFECT"].planet = "TAVROS STATION";
	rooms["FUR EFFECT"].system = "SYSTEM: KALAS";
	rooms["FUR EFFECT"].eastExit = "MERCHANT'S THOROUGHFARE";
	rooms["FUR EFFECT"].addFlag(GLOBAL.INDOOR);
	rooms["FUR EFFECT"].addFlag(GLOBAL.COMMERCE);
	rooms["FUR EFFECT"].runOnEnter = furEffectBonusFunction;

	//109 "BETHS BROADS" Beth's Busty Broads
	rooms["BETHS BROADS"] = new RoomClass(this);
	rooms["BETHS BROADS"].roomName = "BETH'S\nBUSTY BROADS";
	rooms["BETHS BROADS"].description = "You're inside Beth's Busty Broads, which seems to be doing good business for itself. Several patrons are gathered around the stage in the center of the show floor, watching a particularly well-endowed ausar girl strut her stuff on the pole. A desk has been set up near the door, where a bored-looking human woman is flipping through a data-slate, barely acknowledging your presence.";
	rooms["BETHS BROADS"].planet = "TAVROS STATION";
	rooms["BETHS BROADS"].system = "SYSTEM: KALAS";
	rooms["BETHS BROADS"].northExit = "MERCHANT'S THOROUGHFARE";
	rooms["BETHS BROADS"].addFlag(GLOBAL.INDOOR);
	rooms["BETHS BROADS"].addFlag(GLOBAL.NPC);
	rooms["BETHS BROADS"].runOnEnter = reahaBonusFunction;

	

	//0. Ship Hanger
	rooms["SHIP HANGAR"] = new RoomClass(this);
	rooms["SHIP HANGAR"].roomName = "SHIP\nHANGAR";
	rooms["SHIP HANGAR"].description = "Though dubbed a hangar, this suspended platform is little more than an exposed landing pad. It's a hexagonal, steelcrete plate, one of dozens that ring the central elevator spire. Blinking lights ring the edges to guide you when taking off or landing, and to keep other ships from clipping the platform when seeking their own. An elevator door hangs open to the south, waiting for you to press the button that will take you back to the ground, while your ship remains parked here, ready to be entered.";
	rooms["SHIP HANGAR"].planet = "PLANET: MHEN'GA";
	rooms["SHIP HANGAR"].system = "SYSTEM: ARA ARA";
	rooms["SHIP HANGAR"].outExit = "SPACEPORT ELEVATOR";
	rooms["SHIP HANGAR"].outText = "Down";
	rooms["SHIP HANGAR"].addFlag(GLOBAL.OUTDOOR);
	rooms["SHIP HANGAR"].addFlag(GLOBAL.SHIPHANGAR);

	//1 - Spaceport Elevator
	rooms["SPACEPORT ELEVATOR"] = new RoomClass(this);
	rooms["SPACEPORT ELEVATOR"].roomName = "SPACEPORT\nELEVATOR";
	rooms["SPACEPORT ELEVATOR"].description = "A standard self-assembling cargo elevator towers overhead, connected to dozens of landing pads covered with brilliantly flashing lights. The supporting girders are stamped with the logo of Pyrite Heavy Industries, the subgroup of Pyrite Industries that handles the largest constructions. The whole thing still gleams like new, even in an environment so damp that the metal is sweating drops of condensation. The doors to the elevator are open, all you need to do is push the button to go back to your ship. Fences and the wall of a building to the east keep you penned in this area, but a doorway marked “Customs” to the east could be entered if you wish to explore.";
	rooms["SPACEPORT ELEVATOR"].planet = "PLANET: MHEN'GA";
	rooms["SPACEPORT ELEVATOR"].system = "SYSTEM: ARA ARA";
	rooms["SPACEPORT ELEVATOR"].inExit = "SHIP HANGAR";
	rooms["SPACEPORT ELEVATOR"].inText = "Up";
	rooms["SPACEPORT ELEVATOR"].eastExit = "CUSTOMS OFFICE";
	rooms["SPACEPORT ELEVATOR"].addFlag(GLOBAL.OUTDOOR);

	//2 - Flahne’s Office
	rooms["CUSTOMS OFFICE"] = new RoomClass(this);
	rooms["CUSTOMS OFFICE"].roomName = "CUSTOMS\nOFFICE";
	rooms["CUSTOMS OFFICE"].description = "This office is one of many set up around the spaceport to process customs both coming and going. Other identical rooms can be spotted through doorways to the north, but they appear to be closed down or currently occupied at the moment. A single, large desk sits on the east side of the room, kept fairly tidy aside from a mug filled with lollipops and candy. A name placard proclaims the desk’s owner to be Flahne. A doorway to the west opens out back into the jungle at the base of an elevator. The door to the south is labelled 'Out to Esbeth.'";
	rooms["CUSTOMS OFFICE"].planet = "PLANET: MHEN'GA";
	rooms["CUSTOMS OFFICE"].system = "SYSTEM: ARA ARA";
	rooms["CUSTOMS OFFICE"].westExit = "SPACEPORT ELEVATOR";
	rooms["CUSTOMS OFFICE"].southExit = "ESBETH'S NORTH PATH";
	rooms["CUSTOMS OFFICE"].runOnEnter = meetingFlahne;
	rooms["CUSTOMS OFFICE"].addFlag(GLOBAL.INDOOR);
	rooms["CUSTOMS OFFICE"].addFlag(GLOBAL.NPC);

	//3. Esbeth’s Northern Path
	rooms["ESBETH'S NORTH PATH"] = new RoomClass(this);
	rooms["ESBETH'S NORTH PATH"].roomName = "ESBETH'S\nNORTH PATH";
	rooms["ESBETH'S NORTH PATH"].description = "This small jungle town, Esbeth, doesn’t even have proper roads. There’s a hard-packed path underfoot, still blackened in places from when some kind of torch was used to burn away the omnipresent overgrowth. Prefabricated buildings have sprung up on all sides of this east-west path, though the one to the north is the biggest and most secure looking by far. A sign marking it as the 'Office of Customs and Governance' hangs above the entrance, letting you know exactly what it is.";
	rooms["ESBETH'S NORTH PATH"].planet = "PLANET: MHEN'GA";
	rooms["ESBETH'S NORTH PATH"].system = "SYSTEM: ARA ARA";
	rooms["ESBETH'S NORTH PATH"].northExit = "CUSTOMS OFFICE";
	rooms["ESBETH'S NORTH PATH"].westExit = "NORTHWEST ESBETH";
	rooms["ESBETH'S NORTH PATH"].eastExit = "NORTH ESBETH 2";
	rooms["ESBETH'S NORTH PATH"].runOnEnter = bountyBoardExtra;
	rooms["ESBETH'S NORTH PATH"].addFlag(GLOBAL.OUTDOOR);

	//4. The Northwest Corner of Esbeth
	rooms["NORTHWEST ESBETH"] = new RoomClass(this);
	rooms["NORTHWEST ESBETH"].roomName = "NORTHWEST\nESBETH";
	rooms["NORTHWEST ESBETH"].description = "Turning 90 degrees, the hard-packed path that serves as Esbeth’s only road hooks south and east from here, marking the northwest-most portion of town. A secure, barbed-wire-topped fence blocks off the north, though you can see the space port's cargo elevator stretching skyward on the other side. Farther to the northwest, you can see a series of towers with cannons mounted atop them, swiveling this way and that as they eye the burned-back jungle for danger.";
	rooms["NORTHWEST ESBETH"].planet = "PLANET: MHEN'GA";
	rooms["NORTHWEST ESBETH"].system = "SYSTEM: ARA ARA";
	rooms["NORTHWEST ESBETH"].southExit = "WEST ESBETH 1";
	rooms["NORTHWEST ESBETH"].eastExit = "ESBETH'S NORTH PATH";
	rooms["NORTHWEST ESBETH"].addFlag(GLOBAL.OUTDOOR);

	//5. Esbeth’s Western Path
	rooms["WEST ESBETH 1"] = new RoomClass(this);
	rooms["WEST ESBETH 1"].roomName = "WEST\nESBETH";
	rooms["WEST ESBETH 1"].description = "The western side of Esbeth is barely more than the tamped down path you now tread. Self-assembling, pre-fabricated houses have been set up here and there by the settlers brave enough to try their luck on a new, untested planet. Thus far, Mhen’ga has not sent its jungles in to claim the small town, but that doesn’t mean it won’t. The path bends forther to the north and continues straight on to the south. The western building is closed and locked, for now.\n\nTo the east you see one of the many pre-fabricated buildings in the colony, somewhat out of place among the shacks and more nondescript buildings. A pair of industrial stacks spewing out harmless wafts of steam denotes use, while the colorful and somewhat stretched sign up front purpose: <i>Crazy Carl’s Crude Cylinder Collection Cache</i>. The crude neon outline of a handgun helps you fill in the blanks.";
	rooms["WEST ESBETH 1"].planet = "PLANET: MHEN'GA";
	rooms["WEST ESBETH 1"].system = "SYSTEM: ARA ARA";
	rooms["WEST ESBETH 1"].southExit = "WEST ESBETH 2";
	rooms["WEST ESBETH 1"].northExit = "NORTHWEST ESBETH";
	rooms["WEST ESBETH 1"].eastExit = "CRAZY CARLS";
	rooms["WEST ESBETH 1"].addFlag(GLOBAL.OUTDOOR);

	//6. Esbeth’s Western Path
	rooms["WEST ESBETH 2"] = new RoomClass(this);
	rooms["WEST ESBETH 2"].roomName = "WEST\nESBETH";
	rooms["WEST ESBETH 2"].description = "The western path continues north and south along the western edge of town. You can see guard towers rising to the west, mounted with automated guns. The ground here is scorched black; whenever they cleared the jungle, they obviously burned this part a bit too long. You can still smell the charred carbon hanging in the air.";
	rooms["WEST ESBETH 2"].planet = "PLANET: MHEN'GA";
	rooms["WEST ESBETH 2"].system = "SYSTEM: ARA ARA";
	rooms["WEST ESBETH 2"].northExit = "WEST ESBETH 1";
	rooms["WEST ESBETH 2"].southExit = "SOUTHWEST ESBETH";
	rooms["WEST ESBETH 2"].addFlag(GLOBAL.OUTDOOR);

	//7. The Southwest Corner of Esbeth
	rooms["SOUTHWEST ESBETH"] = new RoomClass(this);
	rooms["SOUTHWEST ESBETH"].roomName = "SOUTHWEST\nESBETH";
	rooms["SOUTHWEST ESBETH"].description = "Here, Esbeth’s single road bends north and east, wrapping around this corner of the town. There isn’t much to see here, just some locked domiciles to the south and west and the same guard towers that ring the rest of the settlement. Distantly, you can make out the spaceport that towers over the north side of the town and your ship perched high on its landing pad.";
	rooms["SOUTHWEST ESBETH"].planet = "PLANET: MHEN'GA";
	rooms["SOUTHWEST ESBETH"].system = "SYSTEM: ARA ARA";
	rooms["SOUTHWEST ESBETH"].northExit = "WEST ESBETH 2";
	rooms["SOUTHWEST ESBETH"].eastExit = "SOUTH ESBETH 1";
	rooms["SOUTHWEST ESBETH"].addFlag(GLOBAL.OUTDOOR);

	//8. Esbeth’s Southern Path
	rooms["SOUTH ESBETH 1"] = new RoomClass(this);
	rooms["SOUTH ESBETH 1"].roomName = "SOUTH\nESBETH";
	rooms["SOUTH ESBETH 1"].description = "The southern portion of Esbeth’s lone, circular road stretches east and west from here. To the west, it curls up to the north in a 90 degree bend. The scent of sweet alien flowers graces your nose here, a pleasant distraction from the aroma of charred-away vegetation and freshly installed plumbing that plagues most of this place. You can see the trees in the distance, dark and foreboding but undoubtedly full of life and riches. To the south is what looks like a small, rambling junkyard, overflowing with spaceship and auto scrap. There is a flat-roofed stone hut buried in the detritus - a wooden sign bolted onto the front declares it to be THE ART OF SCRAPYARD MAINTENANCE. The ‘O’ is a painted Yin-Yang symbol.";
	rooms["SOUTH ESBETH 1"].planet = "PLANET: MHEN'GA";
	rooms["SOUTH ESBETH 1"].system = "SYSTEM: ARA ARA";
	rooms["SOUTH ESBETH 1"].westExit = "SOUTHWEST ESBETH";
	rooms["SOUTH ESBETH 1"].eastExit = "SOUTH ESBETH 2";
	rooms["SOUTH ESBETH 1"].southExit = "SCRAPYARD MAINTENANCE";
	rooms["SOUTH ESBETH 1"].addFlag(GLOBAL.OUTDOOR);

	//9. Esbeth’s Southern Path
	rooms["SOUTH ESBETH 2"] = new RoomClass(this);
	rooms["SOUTH ESBETH 2"].roomName = "SOUTH\nESBETH";
	rooms["SOUTH ESBETH 2"].description = "Traffic on these hard-packed paths is light the whole way around the small town of Esbeth. No matter where you are, you usually don’t see more than a few people. Most of them appear to be townsfolk on the way to some errand or in the process of improving a ramshackle abode, but every now and again you see someone who is out hunting and prospecting like yourself, kitted out for a fight and looking at everything with sharp eyes. The build to the north is a monolithic looking thing labelled 'Xenogen Biotech.' A large doorway to the north provides access, and the road goes on to the east and west.";
	rooms["SOUTH ESBETH 2"].planet = "PLANET: MHEN'GA";
	rooms["SOUTH ESBETH 2"].system = "SYSTEM: ARA ARA";
	rooms["SOUTH ESBETH 2"].westExit = "SOUTH ESBETH 1";
	rooms["SOUTH ESBETH 2"].eastExit = "SOUTH ESBETH 3";
	rooms["SOUTH ESBETH 2"].northExit = "KELLY'S OFFICE";
	rooms["SOUTH ESBETH 2"].addFlag(GLOBAL.OUTDOOR);

	//10. Esbeth’s Southern Path
	rooms["SOUTH ESBETH 3"] = new RoomClass(this);
	rooms["SOUTH ESBETH 3"].roomName = "SOUTH\nESBETH";
	rooms["SOUTH ESBETH 3"].description = "A gust of pollen tickles a sneeze out of your nose as you traverse the southern edge of the town of Esbeth. The structures to the north and south are simple and plain, guarded with closed, locked doors that make it obvious there’s nothing to be done inside. Townspeople give you a respectful nod as they pass but otherwise want nothing to do with you. While the road goes east and west, just east of here it doglegs north.";
	rooms["SOUTH ESBETH 3"].planet = "PLANET: MHEN'GA";
	rooms["SOUTH ESBETH 3"].system = "SYSTEM: ARA ARA";
	rooms["SOUTH ESBETH 3"].westExit = "SOUTH ESBETH 2";
	rooms["SOUTH ESBETH 3"].eastExit = "SOUTHEAST ESBETH";
	rooms["SOUTH ESBETH 3"].northExit = "PENNY'S OFFICE";
	rooms["SOUTH ESBETH 3"].addFlag(GLOBAL.OUTDOOR);
		
	//11. The Southeast Corner of Esbeth
	rooms["SOUTHEAST ESBETH"] = new RoomClass(this);
	rooms["SOUTHEAST ESBETH"].roomName = "SOUTHEAST\nESBETH";
	rooms["SOUTHEAST ESBETH"].description = "The packed earth of Esbeth’s only path veers north and west away from you on its circuit of the town. To the southeast, you can see a simple tower built of plain girders that supports an automated turret. It swivels this way and that, a silent sentinel that protects the town from whatever horrors lurk in the jungle. There are blessedly few craters around the burned-out periphery, indicating that they haven’t had to fire all that often, thankfully.";
	rooms["SOUTHEAST ESBETH"].planet = "PLANET: MHEN'GA";
	rooms["SOUTHEAST ESBETH"].system = "SYSTEM: ARA ARA";
	rooms["SOUTHEAST ESBETH"].northExit = "EAST ESBETH";
	rooms["SOUTHEAST ESBETH"].westExit = "SOUTH ESBETH 3";
	rooms["SOUTHEAST ESBETH"].addFlag(GLOBAL.OUTDOOR);

	//12. Esbeth’s Eastern Path
	rooms["EAST ESBETH"] = new RoomClass(this);
	rooms["EAST ESBETH"].roomName = "EAST\nESBETH";
	rooms["EAST ESBETH"].description = "There are few people around this area of town and even fewer houses. Perhaps this is due to this place’s proximity to the town’s eastern exit. Just to the north, a path splits off to the east towards the jungle. Now and again, you can see individuals like yourself venturing out to brave the dangers and discover what treasures they can. Watchtowers guard the town’s safekeeping, and the jungle has been burnt back far enough to give the autoguns on top of them a good sight line. You suppose this town is about as safe a place as you can find in the untamed wilderness.\n\nThere is a small shack to the east painted pure, alabaster white. The door has a crimson cross, the universal symbol for medical aid, adhered to it. It must be what passes for a hospital on this planet.";
	rooms["EAST ESBETH"].planet = "PLANET: MHEN'GA";
	rooms["EAST ESBETH"].system = "SYSTEM: ARA ARA";
	rooms["EAST ESBETH"].southExit = "SOUTHEAST ESBETH";
	rooms["EAST ESBETH"].eastExit = "ESBETH MEDICAL OFFICE";
	rooms["EAST ESBETH"].northExit = "EAST ESBETH ENTRANCE";
	rooms["EAST ESBETH"].addFlag(GLOBAL.OUTDOOR);

	//13. Esbeth’s Eastern Path at the Entrance
	rooms["EAST ESBETH ENTRANCE"] = new RoomClass(this);
	rooms["EAST ESBETH ENTRANCE"].roomName = "EAST ESBETH\nENTRANCE";
	rooms["EAST ESBETH ENTRANCE"].description = "The entrance to Esbeth is positioned just to the east of here. It is only an entrance in name, however. The town has no proper walls just yet, just a sets of towers providing overwatch against the ever-growing foliage. The entrance is a narrow, barely-trod path that disappears into the trees to the east. Midway towards the forest, there’s a small sign staked, though you’re still too far away to read it. Esbeth’s circuitous path continues north and south from here, following the edge of the town.";
	rooms["EAST ESBETH ENTRANCE"].planet = "PLANET: MHEN'GA";
	rooms["EAST ESBETH ENTRANCE"].system = "SYSTEM: ARA ARA";
	rooms["EAST ESBETH ENTRANCE"].southExit = "EAST ESBETH";
	rooms["EAST ESBETH ENTRANCE"].northExit = "NORTHEAST ESBETH";
	rooms["EAST ESBETH ENTRANCE"].eastExit = "EAST ESBETH EXIT";
	rooms["EAST ESBETH ENTRANCE"].addFlag(GLOBAL.OUTDOOR);

	//14. The Northeastern Corner of Esbeth
	rooms["NORTHEAST ESBETH"] = new RoomClass(this);
	rooms["NORTHEAST ESBETH"].roomName = "NORTHEAST\nESBETH";
	rooms["NORTHEAST ESBETH"].description = "Esbeth’s single road twists to the south and west here, spoking out in straight lines that run in those directions. The path here is as barren and burned-out as everywhere else in town, but the houses on either side are fresh and new, though a few show places of rust already. To the south, you can see the eastern exit of town splitting off from the roadway. There are occasional other adventurers, like you on their way, but they pay you no mind.";
	rooms["NORTHEAST ESBETH"].planet = "PLANET: MHEN'GA";
	rooms["NORTHEAST ESBETH"].system = "SYSTEM: ARA ARA";
	rooms["NORTHEAST ESBETH"].westExit = "NORTH ESBETH 1";
	rooms["NORTHEAST ESBETH"].southExit = "EAST ESBETH ENTRANCE";
	rooms["NORTHEAST ESBETH"].addFlag(GLOBAL.OUTDOOR);

	//15. Esbeth’s Northern Path
	rooms["NORTH ESBETH 1"] = new RoomClass(this);
	rooms["NORTH ESBETH 1"].roomName = "NORTH\nESBETH";
	rooms["NORTH ESBETH 1"].description = "Prefabricated structures line this busy road to the north and south. It’s busier here than it is much further east, most likely due to the mead hall that lies northwest of here. The other buildings all appear to be residences, with closed, locked doors. Either their owners are out and about or they don’t wish to be disturbed by a random explorer. A guard tower can be seen to the northeast, looming over the city to provide protection.";
	rooms["NORTH ESBETH 1"].planet = "PLANET: MHEN'GA";
	rooms["NORTH ESBETH 1"].system = "SYSTEM: ARA ARA";
	rooms["NORTH ESBETH 1"].westExit = "NORTH ESBETH 2";
	rooms["NORTH ESBETH 1"].eastExit = "NORTHEAST ESBETH";
	rooms["NORTH ESBETH 1"].addFlag(GLOBAL.OUTDOOR);

	//16. Esbeth’s Northern Path
	rooms["NORTH ESBETH 2"] = new RoomClass(this);
	rooms["NORTH ESBETH 2"].roomName = "NORTH\nESBETH";
	rooms["NORTH ESBETH 2"].description = "The simple path you tread upon heads straight to the east and west from here. Foot traffic is high here, either because of the customs building to the northwest or the bar to the north. Closer inspection reveals the northern building to actually be a mead hall of some description - “Burt’s Badass Mead Hall” it says on the sign. This building actually integrates some wood from the jungle into its construction, contrasting quite noticeably with its neighbors.";
	rooms["NORTH ESBETH 2"].planet = "PLANET: MHEN'GA";
	rooms["NORTH ESBETH 2"].system = "SYSTEM: ARA ARA";
	rooms["NORTH ESBETH 2"].westExit = "ESBETH'S NORTH PATH";
	rooms["NORTH ESBETH 2"].eastExit = "NORTH ESBETH 1";
	rooms["NORTH ESBETH 2"].northExit = "BURT'S MAIN HALL";
	rooms["NORTH ESBETH 2"].addFlag(GLOBAL.OUTDOOR);


	//17. Burt’s Badass Whatever
	rooms["BURT'S MAIN HALL"] = new RoomClass(this);
	rooms["BURT'S MAIN HALL"].roomName = "BURT'S BADASS\nMEAD HALL";
	rooms["BURT'S MAIN HALL"].description = "A cloud of smoky inhalants hangs around the rafters of this high-ceilinged chamber to lend this place an air of mystery. The obnoxious music playing from an illuminated audio system in the corner along with the noisy beeps of a gaming system dispel that notion immediately. A huge bar lines the western wall, shining dully in the artificial lighting. It's obviously the most well-maintained and cared for object in the entire establishment. A doorway to the south leads back out onto the streets of Mhen'ga.";
	rooms["BURT'S MAIN HALL"].planet = "PLANET: MHEN'GA";
	rooms["BURT'S MAIN HALL"].system = "SYSTEM: ARA ARA";
	rooms["BURT'S MAIN HALL"].southExit = "NORTH ESBETH 2";
	rooms["BURT'S MAIN HALL"].northExit = "BURT'S BACK END";
	rooms["BURT'S MAIN HALL"].runOnEnter = burtsBarFunc;
	rooms["BURT'S MAIN HALL"].addFlag(GLOBAL.INDOOR);
	rooms["BURT'S MAIN HALL"].addFlag(GLOBAL.BAR);

	//"18". Burt’s Badass Whatever Part. II
	rooms["BURT'S BACK END"] = new RoomClass(this);
	rooms["BURT'S BACK END"].roomName = "THE BACK\nOF BURT'S";
	rooms["BURT'S BACK END"].description = "This secluded area of the bar is mostly empty. The few people bothering to hang out back here don't seem to have any interest in communicating, leaving you with only the darkness for company. Empty tables abound, but the better-lit hall to the south looks infinitely more companionable.";
	rooms["BURT'S BACK END"].planet = "PLANET: MHEN'GA";
	rooms["BURT'S BACK END"].system = "SYSTEM: ARA ARA";
	rooms["BURT'S BACK END"].southExit = "BURT'S MAIN HALL";
	rooms["BURT'S BACK END"].addFlag(GLOBAL.INDOOR);
	// Amusing naming FTW

	//19. The Eastern Exit of Esbeth
	rooms["EAST ESBETH EXIT"] = new RoomClass(this);
	rooms["EAST ESBETH EXIT"].roomName = "EAST ESBETH\nEXIT";
	rooms["EAST ESBETH EXIT"].description = "This scorched path is half as wide as the ones in the town of Esbeth. Grass is already growing back along the edges of it. Jutting up alongside, a single sign post warns: <i>Danger! Do not enter the jungle unarmed. Native creatures are proven to be both hostile and extremely sexual.</i> Huge trees loom up to the east where the burn-out ends, swallowing the path as it winds between them. If you go east, you’ll be in the jungle. The town of Esbeth lies a short walk to the west.";
	rooms["EAST ESBETH EXIT"].planet = "PLANET: MHEN'GA";
	rooms["EAST ESBETH EXIT"].system = "SYSTEM: ARA ARA";
	rooms["EAST ESBETH EXIT"].westExit = "EAST ESBETH ENTRANCE";
	rooms["EAST ESBETH EXIT"].eastExit = "JUNGLE EDGE";	
	rooms["EAST ESBETH EXIT"].addFlag(GLOBAL.OUTDOOR);

	//20. The Edge of the Jungle
	rooms["JUNGLE EDGE"] = new RoomClass(this);
	rooms["JUNGLE EDGE"].roomName = "JUNGLE\nEDGE";
	rooms["JUNGLE EDGE"].description = "The shadows of alien trees shroud you in darkness here, though your eyes soon adjust. The path, which is obviously man-made on its way back to the west. Here, it has an offshoot to the south and a simple footpath to the east. Neither seems particularly straight, perhaps due to the huge trees, some of which are well over ten feet around. Foreign howls, birdcalls, and rustling vegetation keep your nerves on end. <b>This is not a safe place.</b>";
	rooms["JUNGLE EDGE"].planet = "PLANET: MHEN'GA";
	rooms["JUNGLE EDGE"].system = "SYSTEM: ARA ARA";
	rooms["JUNGLE EDGE"].eastExit = "FERNGROWTH PATH 1";
	rooms["JUNGLE EDGE"].westExit = "EAST ESBETH EXIT";
	rooms["JUNGLE EDGE"].southExit = "PURPLE FLOWERS 4";
	rooms["JUNGLE EDGE"].addFlag(GLOBAL.OUTDOOR);

	//21. A Bend in the Fern-Shrouded Path
	rooms["FERNGROWTH PATH 1"] = new RoomClass(this);
	rooms["FERNGROWTH PATH 1"].roomName = "FERNGROWTH\nPATH";
	rooms["FERNGROWTH PATH 1"].description = "Stepping carefully through the brush, you do your best to stay on the trail. The foliage is so thick that if you were to leave it, you’d be lost in no time. Huge, alien ferns gird the sides of the path, and you can see that something has been cutting them back to keep the path clear. Whether other adventurers from Esbeth are responsible or some of the locals is unclear. The air is humid and hot, not oppressively so. The path winds northward, deeper into the jungle, and west, back towards the open air around Esbeth.";
	rooms["FERNGROWTH PATH 1"].planet = "PLANET: MHEN'GA";
	rooms["FERNGROWTH PATH 1"].system = "SYSTEM: ARA ARA";
	rooms["FERNGROWTH PATH 1"].northExit = "FERNGROWTH PATH 2";
	rooms["FERNGROWTH PATH 1"].westExit = "JUNGLE EDGE";
	rooms["FERNGROWTH PATH 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["FERNGROWTH PATH 1"].addFlag(GLOBAL.HAZARD);
	rooms["FERNGROWTH PATH 1"].runOnEnter = jungleEncounterChances;

	//22. A Fern-Shrouded Path
	rooms["FERNGROWTH PATH 2"] = new RoomClass(this);
	rooms["FERNGROWTH PATH 2"].roomName = "FERNGROWTH\nPATH";
	rooms["FERNGROWTH PATH 2"].description = "The air here is thick with pollen, nearly bringing a sneeze to your nose as you look about. Dozens of gigantic trees stretch toward the sky, so high that you’re not even sure how high they reach. You’d need some decent equipment to even begin to hazard a guess. Ferns nearly as tall as you have grown up on all sides. The path itself is narrow and packed hard by traffic, unlike the soft earth alongside it.";
	rooms["FERNGROWTH PATH 2"].planet = "PLANET: MHEN'GA";
	rooms["FERNGROWTH PATH 2"].system = "SYSTEM: ARA ARA";
	rooms["FERNGROWTH PATH 2"].southExit = "FERNGROWTH PATH 1";
	rooms["FERNGROWTH PATH 2"].northExit = "FERNGROWTH BEND 1";
	rooms["FERNGROWTH PATH 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["FERNGROWTH PATH 2"].addFlag(GLOBAL.HAZARD);
	rooms["FERNGROWTH PATH 2"].runOnEnter = jungleEncounterChances;

	//23. Ferngrowth Bend
	rooms["FERNGROWTH BEND 1"] = new RoomClass(this);
	rooms["FERNGROWTH BEND 1"].roomName = "FERNGROWTH\nBEND";
	rooms["FERNGROWTH BEND 1"].description = "The claustrophobic path twists here, cocked to wind north and west around the trunk of a giant, gray-barked tree. The lower branches are covered with leaves of the deepest purple, large, wet looking leaves that seem to dip under their own weight. No sunlight reaches past the upper canopy to fall on them, but the tree is producing them all the same. The ferns around the path are tall and alien but undoubtedly similar to Earth's. Convergent evolution at work, you suppose.";
	rooms["FERNGROWTH BEND 1"].planet = "PLANET: MHEN'GA";
	rooms["FERNGROWTH BEND 1"].system = "SYSTEM: ARA ARA";
	rooms["FERNGROWTH BEND 1"].southExit = "FERNGROWTH PATH 2";
	rooms["FERNGROWTH BEND 1"].eastExit = "FERNGROWTH PATH 3";
	rooms["FERNGROWTH BEND 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["FERNGROWTH BEND 1"].addFlag(GLOBAL.HAZARD);
	rooms["FERNGROWTH BEND 1"].runOnEnter = jungleEncounterChances;

	//24. A Fern-Shrouded Path
	rooms["FERNGROWTH PATH 3"] = new RoomClass(this);
	rooms["FERNGROWTH PATH 3"].roomName = "FERNGROWTH\nPATH";
	rooms["FERNGROWTH PATH 3"].description = "Hanging ominously overhead, gigantic ferns tower over the path. While this casts the area into deep shadow, it also broadens the navigable area quite nicely, allowing you to see something besides bushy green leaves for a chance. The ground on either side is a deep, rich brown, and moist with water that constantly seems to drip from the plants above. It is bare except for the ferns and flat, round disks that you surmise are mushroom-like in nature.";
	rooms["FERNGROWTH PATH 3"].planet = "PLANET: MHEN'GA";
	rooms["FERNGROWTH PATH 3"].system = "SYSTEM: ARA ARA";
	rooms["FERNGROWTH PATH 3"].westExit = "FERNGROWTH BEND 1";
	rooms["FERNGROWTH PATH 3"].eastExit = "FERNGROWTH PATH 4";
	rooms["FERNGROWTH PATH 3"].addFlag(GLOBAL.OUTDOOR);
	rooms["FERNGROWTH PATH 3"].addFlag(GLOBAL.HAZARD);
	rooms["FERNGROWTH PATH 3"].runOnEnter = jungleEncounterChances;

	//25. A Fern-Shrouded Path
	rooms["FERNGROWTH PATH 4"] = new RoomClass(this);
	rooms["FERNGROWTH PATH 4"].roomName = "FERNGROWTH\nPATH";
	rooms["FERNGROWTH PATH 4"].description = "Ferns sprout up on all sides of the path, but for some reason, they haven't encroached on it just yet. These particular specimens reach up about four feet, but just to the west there is a patch of them so giant that they tower overhead. You can also see that the vegetation and terrain around the path changes wildly to the east. There, the paths are much more open and the vegetation less dense. How odd.";
	rooms["FERNGROWTH PATH 4"].planet = "PLANET: MHEN'GA";
	rooms["FERNGROWTH PATH 4"].system = "SYSTEM: ARA ARA";
	rooms["FERNGROWTH PATH 4"].westExit = "FERNGROWTH PATH 3";
	rooms["FERNGROWTH PATH 4"].eastExit = "FERNS AT LICHENS 1";
	rooms["FERNGROWTH PATH 4"].addFlag(GLOBAL.OUTDOOR);
	rooms["FERNGROWTH PATH 4"].addFlag(GLOBAL.HAZARD);
	rooms["FERNGROWTH PATH 4"].runOnEnter = jungleEncounterChances;

	//26. The Intersection of Ferns and Lichens
	rooms["FERNS AT LICHENS 1"] = new RoomClass(this);
	rooms["FERNS AT LICHENS 1"].roomName = "FERNS AND\nLICHENS";
	rooms["FERNS AT LICHENS 1"].description = "The ferns that hug the pathway to the west die off here under the weight of some very aggressive lichens that have scoured them away. The western path fades here, but the ground is open to the north and south so that you can tread across soft earth in whichever direction you like. A copse of gray trees covered in bioluminescent lichens grows to the east, the trunks so close together that there's no decent way to travel past them. The colorful composite organisms also carpet the ground in a blanket of shifting, almost psychedelic hues.";
	rooms["FERNS AT LICHENS 1"].planet = "PLANET: MHEN'GA";
	rooms["FERNS AT LICHENS 1"].system = "SYSTEM: ARA ARA";
	rooms["FERNS AT LICHENS 1"].northExit = "LICHENS 4";
	rooms["FERNS AT LICHENS 1"].southExit = "LICHENS BEND 1";
	rooms["FERNS AT LICHENS 1"].westExit = "FERNGROWTH PATH 4";
	rooms["FERNS AT LICHENS 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["FERNS AT LICHENS 1"].addFlag(GLOBAL.HAZARD);
	rooms["FERNS AT LICHENS 1"].runOnEnter = jungleEncounterChances;

	//27. A Bend in the Lichens
	rooms["LICHENS BEND 1"] = new RoomClass(this);
	rooms["LICHENS BEND 1"].roomName = "LICHENS\nBEND";
	rooms["LICHENS BEND 1"].description = "Twisting away, the wall of grown-over trees curves north and east from here, leaving you free to walk in either direction unhindered. Unfortunately, thorny bushes nearly six-feet high have grown up out of the lichen-covered ground to the west and south. What little you can see beyond them seems deeper, darker, and danker than the area you now inhabit. Glowing yellow lichens bathe the area around you in gentle luminance as you weigh your options.";
	rooms["LICHENS BEND 1"].planet = "PLANET: MHEN'GA";
	rooms["LICHENS BEND 1"].system = "SYSTEM: ARA ARA";
	rooms["LICHENS BEND 1"].northExit = "FERNS AT LICHENS 1";
	rooms["LICHENS BEND 1"].eastExit = "LICHENS 1";
	rooms["LICHENS BEND 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["LICHENS BEND 1"].addFlag(GLOBAL.HAZARD);
	rooms["LICHENS BEND 1"].runOnEnter = jungleEncounterChances;

	//28. The Lichen-Covered Jungle
	rooms["LICHENS 1"] = new RoomClass(this);
	rooms["LICHENS 1"].roomName = "LICHEN\nJUNGLE";
	rooms["LICHENS 1"].description = "Hardly anything seems to grow here but trees, thorns, and lichens, and the lichens have grown over both of the former. The trees grow so closely together to the north that it would be impossible to squeeze between, while the thorns to the south are so large and thick that getting through them would be a huge pain. Purplish lights twinkle from some of the lichens around you, and it seems like every new step exposes you to a new color or trait from the oddly earth-like, indigenous life-form.";
	rooms["LICHENS 1"].planet = "PLANET: MHEN'GA";
	rooms["LICHENS 1"].system = "SYSTEM: ARA ARA";
	rooms["LICHENS 1"].westExit = "LICHENS BEND 1";
	rooms["LICHENS 1"].eastExit = "LICHENS AT IRONWOODS 1";
	rooms["LICHENS 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["LICHENS 1"].addFlag(GLOBAL.HAZARD);
	rooms["LICHENS 1"].runOnEnter = jungleEncounterChances;

	//29. The Intersection of Lichens and Giant Ironwoods
	rooms["LICHENS AT IRONWOODS 1"] = new RoomClass(this);
	rooms["LICHENS AT IRONWOODS 1"].roomName = "IRONWOODS\nAND LICHENS";
	rooms["LICHENS AT IRONWOODS 1"].description = "Here, dozens of multihued lichens clash against a larger and entirely different type of jungle life. Gigantic trees, each at least a dozen feet around, tower over you. Their rusty red bark gives them a surprisingly familiar appearance until you brush your hand against one. The stuff flakes right off on your fingers! Underneath where you touched shines a silvery metallic color. These trees' bark is literally iron hard.";
	rooms["LICHENS AT IRONWOODS 1"].planet = "PLANET: MHEN'GA";
	rooms["LICHENS AT IRONWOODS 1"].system = "SYSTEM: ARA ARA";
	rooms["LICHENS AT IRONWOODS 1"].westExit = "LICHENS 1";
	rooms["LICHENS AT IRONWOODS 1"].northExit = "LICHENS AND IRONWOODS 1";
	rooms["LICHENS AT IRONWOODS 1"].southExit = "IRON AND DARK CORNER 1";
	rooms["LICHENS AT IRONWOODS 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["LICHENS AT IRONWOODS 1"].addFlag(GLOBAL.HAZARD);
	rooms["LICHENS AT IRONWOODS 1"].runOnEnter = jungleEncounterChances;

	//30.Between Lichens and Ironwoods
	rooms["LICHENS AND IRONWOODS 1"] = new RoomClass(this);
	rooms["LICHENS AND IRONWOODS 1"].roomName = "IRONWOODS\nAND LICHENS";
	rooms["LICHENS AND IRONWOODS 1"].description = "There's plenty of space to explore on this north-south causeway thanks to the lichen that seems to have eaten back most of the other plant-life. Tight clusters of trees block the way west, and another gigantic variety sprouts up to the east, covered in rust-red bark that closer inspection reveals to be actual iron. The lichens bathe everything but the trees to the east in gentle bioluminescence. They can't seem to grow on the ferrous coverings of the eastern trunks and die off that way.";
	rooms["LICHENS AND IRONWOODS 1"].planet = "PLANET: MHEN'GA";
	rooms["LICHENS AND IRONWOODS 1"].system = "SYSTEM: ARA ARA";
	rooms["LICHENS AND IRONWOODS 1"].southExit = "LICHENS AT IRONWOODS 1";
	rooms["LICHENS AND IRONWOODS 1"].northExit = "LICHENS AND IRONWOODS 2";
	rooms["LICHENS AND IRONWOODS 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["LICHENS AND IRONWOODS 1"].addFlag(GLOBAL.HAZARD);
	rooms["LICHENS AND IRONWOODS 1"].runOnEnter = jungleEncounterChances;

	//31. Between Lichens and Ironwoods
	rooms["LICHENS AND IRONWOODS 2"] = new RoomClass(this);
	rooms["LICHENS AND IRONWOODS 2"].roomName = "IRONWOODS\nAND LICHENS";
	rooms["LICHENS AND IRONWOODS 2"].description = "Springing lightly under your [pc.feet] as you move, the soft soil and lichenous mulch below makes your journey surprisingly pleasant, aside from the omnipresent humidity. A wall of gray trees blocks the way west, and a trunk as big as three tanks put together blocks the east. Buzzing insects swirl around everywhere, busy on their own errands. Thankful they don't seem to have much interest in you, perhaps due to your alien physiology.";
	rooms["LICHENS AND IRONWOODS 2"].planet = "PLANET: MHEN'GA";
	rooms["LICHENS AND IRONWOODS 2"].system = "SYSTEM: ARA ARA";
	rooms["LICHENS AND IRONWOODS 2"].southExit = "LICHENS AND IRONWOODS 1";
	rooms["LICHENS AND IRONWOODS 2"].northExit = "LICHENS AND IRONWOODS 3";
	rooms["LICHENS AND IRONWOODS 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["LICHENS AND IRONWOODS 2"].addFlag(GLOBAL.HAZARD);
	rooms["LICHENS AND IRONWOODS 2"].runOnEnter = jungleEncounterChances;

	//32. Between Lichens and Ironwoods
	rooms["LICHENS AND IRONWOODS 3"] = new RoomClass(this);
	rooms["LICHENS AND IRONWOODS 3"].roomName = "IRONWOODS\nAND LICHENS";
	rooms["LICHENS AND IRONWOODS 3"].description = "The jungle here is marvelously colorful. Hues of verdant green swim between vibrant yellows and lurid reds, shining up from the interwoven lichens in a rainbow of beauteous light. Whenever you press down upon some of it, the light brightens, lighting the way as you go. Ferrous trees as big as buildings rise up to the east, and smaller gray ones to the west cluster so tightly that you cannot go in that direction.";
	rooms["LICHENS AND IRONWOODS 3"].planet = "PLANET: MHEN'GA";
	rooms["LICHENS AND IRONWOODS 3"].system = "SYSTEM: ARA ARA";
	rooms["LICHENS AND IRONWOODS 3"].southExit = "LICHENS AND IRONWOODS 2";
	rooms["LICHENS AND IRONWOODS 3"].northExit = "LICHENS AT IRONWOODS 2";
	rooms["LICHENS AND IRONWOODS 3"].addFlag(GLOBAL.OUTDOOR);
	rooms["LICHENS AND IRONWOODS 3"].addFlag(GLOBAL.HAZARD);
	rooms["LICHENS AND IRONWOODS 3"].runOnEnter = jungleEncounterChances;

	//33. An Intersection of Lichens and Ironwoods
	rooms["LICHENS AT IRONWOODS 2"] = new RoomClass(this);
	rooms["LICHENS AT IRONWOODS 2"].roomName = "IRONWOODS\nAND LICHENS";
	rooms["LICHENS AT IRONWOODS 2"].description = "While the path you now tread is fairly devoid of undergrowth due to some aggressive, alien lichens, there is no shortage of tree life to bar your way. A copse of gray trunks so thick that a child would be challenged to squeeze between them stands defiantly among the lichens to the southwest, even if there's a path that circumnavigates their northern edge to your west. To the east, huge trees at least thirty feet around dot the landscape, covered in what appears to be rusty red bark. If you touch it, the red comes away like old rust, revealing a gleaming, metallic tree-trunk below.";
	rooms["LICHENS AT IRONWOODS 2"].planet = "PLANET: MHEN'GA";
	rooms["LICHENS AT IRONWOODS 2"].system = "SYSTEM: ARA ARA";
	rooms["LICHENS AT IRONWOODS 2"].northExit = "IRONWOODS 1";
	rooms["LICHENS AT IRONWOODS 2"].westExit = "LICHENS 2";
	rooms["LICHENS AT IRONWOODS 2"].southExit = "LICHENS AND IRONWOODS 3";
	rooms["LICHENS AT IRONWOODS 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["LICHENS AT IRONWOODS 2"].addFlag(GLOBAL.HAZARD);
	rooms["LICHENS AT IRONWOODS 2"].runOnEnter = jungleEncounterChances;

	//34. The Lichen-Covered Jungle
	rooms["LICHENS 2"] = new RoomClass(this);
	rooms["LICHENS 2"].roomName = "LICHEN\nJUNGLE";
	rooms["LICHENS 2"].description = "There is little plant-growth here aside from the multi-hued lichens that drape everything in their almost luminescent hues, yet somehow a group of gray-barked trees has managed to endure in the center of it all, clustered closely enough to block anyone not driving a lumber harvester. Thick thorns obscure the way north from view. Luckily, the open path you now stand upon continues both east and west of here, though it opens up for more in the former direction.";
	rooms["LICHENS 2"].planet = "PLANET: MHEN'GA";
	rooms["LICHENS 2"].system = "SYSTEM: ARA ARA";
	rooms["LICHENS 2"].eastExit = "LICHENS AT IRONWOODS 2";
	rooms["LICHENS 2"].westExit = "LICHENS BEND 2";
	rooms["LICHENS 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["LICHENS 2"].addFlag(GLOBAL.HAZARD);
	rooms["LICHENS 2"].runOnEnter = jungleEncounterChances;

	//35. A Bend in the Lichens
	rooms["LICHENS BEND 2"] = new RoomClass(this);
	rooms["LICHENS BEND 2"].roomName = "LICHEN\nBEND";
	rooms["LICHENS BEND 2"].description = "You nearly stumble face first into a mess of brambles, hidden behind a camouflaging layer of brown-green lichens that covers them like camo netting. They seem to go on forever to the north and west, effectively arresting any travel in that direction for now. Meanwhile, the path you're now striding across twists away to the east and south, both directions equally overgrown with the odd life.";
	rooms["LICHENS BEND 2"].planet = "PLANET: MHEN'GA";
	rooms["LICHENS BEND 2"].system = "SYSTEM: ARA ARA";
	rooms["LICHENS BEND 2"].eastExit = "LICHENS 2";
	rooms["LICHENS BEND 2"].southExit = "LICHENS 3";
	rooms["LICHENS BEND 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["LICHENS BEND 2"].addFlag(GLOBAL.HAZARD);
	rooms["LICHENS BEND 2"].runOnEnter = jungleEncounterChances;

	//36. The Lichen-Covered Jungle
	rooms["LICHENS 3"] = new RoomClass(this);
	rooms["LICHENS 3"].roomName = "LICHEN\nJUNGLE";
	rooms["LICHENS 3"].description = "Glowing lights of all colors assault your senses as you travel through this segment of humid forest, nearly dazzling you with their natural variations and shifting palettes. The lichens that have overgrown everything here are the source of the unearthly auras. At least you have something pretty to look at while you explore. Between the durable brambles to the west and some dense, boring-looking trees to the east, you're hemmed onto the surprisingly open path you now tread. It leads north and south.";
	rooms["LICHENS 3"].planet = "PLANET: MHEN'GA";
	rooms["LICHENS 3"].system = "SYSTEM: ARA ARA";
	rooms["LICHENS 3"].northExit = "LICHENS BEND 2";
	rooms["LICHENS 3"].southExit = "LICHENS 4";
	rooms["LICHENS 3"].addFlag(GLOBAL.OUTDOOR);
	rooms["LICHENS 3"].addFlag(GLOBAL.HAZARD);
	rooms["LICHENS 3"].runOnEnter = jungleEncounterChances;

	//37. The Lichen-Covered Jungle
	rooms["LICHENS 4"] = new RoomClass(this);
	rooms["LICHENS 4"].roomName = "LICHEN\nJUNGLE";
	rooms["LICHENS 4"].description = "As you travel through the glowing vegetation, it reacts to you in certain places, brightening as you near some lichenous outcroppings and dimming as you approach others. Regardless, the stuff has grown over everything, even the tough-looking trees that bar the way to the east like silent sentinels and thick, prickly thorn bushes that have grown as tall as you to the west. The lichen-carpeted path between the two travels north and south.";
	rooms["LICHENS 4"].planet = "PLANET: MHEN'GA";
	rooms["LICHENS 4"].system = "SYSTEM: ARA ARA";
	rooms["LICHENS 4"].northExit = "LICHENS 3";
	rooms["LICHENS 4"].southExit = "FERNS AT LICHENS 1";
	rooms["LICHENS 4"].addFlag(GLOBAL.OUTDOOR);
	rooms["LICHENS 4"].addFlag(GLOBAL.HAZARD);
	rooms["LICHENS 4"].runOnEnter = jungleEncounterChances;

	//38. The Ironwoods
	rooms["IRONWOODS 1"] = new RoomClass(this);
	rooms["IRONWOODS 1"].roomName = "THE\nIRONWOODS";
	rooms["IRONWOODS 1"].description = "There really isn't any name more fitting for this section of Mhen'ga's wilderness than the ironwoods. The trees here are gigantic enough to be awe-inspiring and tough enough to give more than a few lumber harvesting devices trouble. Rust is caked all over their bark, but if you brush it away, you can expose the silvery sheen of their metallic bark. The natural path you follow between them is barely obstructed by any brush as the dense canopy high above keeps things shaded enough to discourage new growth.";
	rooms["IRONWOODS 1"].planet = "PLANET: MHEN'GA";
	rooms["IRONWOODS 1"].system = "SYSTEM: ARA ARA";
	rooms["IRONWOODS 1"].northExit = "IRONWOODS BEND 1";
	rooms["IRONWOODS 1"].southExit = "LICHENS AT IRONWOODS 2";
	rooms["IRONWOODS 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["IRONWOODS 1"].addFlag(GLOBAL.HAZARD);
	rooms["IRONWOODS 1"].runOnEnter = jungleEncounterChances;

	//39. Bending Through the Ironwoods
	rooms["IRONWOODS BEND 1"] = new RoomClass(this);
	rooms["IRONWOODS BEND 1"].roomName = "IRONWOODS\nBEND";
	rooms["IRONWOODS BEND 1"].description = "Turning a sharp corner, the way between these gigantic trees veers away to the east and south. They grow like walls in their own right thanks to their tremendous size, and the branches above are so high that ones as thick as terran tree trunks look like little more than twigs. You shudder at the scale of it all as you plan your next move.";
	rooms["IRONWOODS BEND 1"].planet = "PLANET: MHEN'GA";
	rooms["IRONWOODS BEND 1"].system = "SYSTEM: ARA ARA";
	rooms["IRONWOODS BEND 1"].eastExit = "IRONWOODS 2";
	rooms["IRONWOODS BEND 1"].southExit = "IRONWOODS 1";
	rooms["IRONWOODS BEND 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["IRONWOODS BEND 1"].addFlag(GLOBAL.HAZARD);
	rooms["IRONWOODS BEND 1"].runOnEnter = jungleEncounterChances;

	//40. The Ironwoods
	rooms["IRONWOODS 2"] = new RoomClass(this);
	rooms["IRONWOODS 2"].roomName = "THE\nIRONWOODS";
	rooms["IRONWOODS 2"].description = "A fair amount of underbrush has grown here, and the soil is fairly damp. As you might expect, you can hear the babbling of a gentle-sounding brook somewhere to the east. It is likely responsible for the surge in vegetation around you, even in the dim light the ironwoods allow to reach the jungle floor. There's still enough open ground to move to the east and the west without much issue.";
	rooms["IRONWOODS 2"].planet = "PLANET: MHEN'GA";
	rooms["IRONWOODS 2"].system = "SYSTEM: ARA ARA";
	rooms["IRONWOODS 2"].eastExit = "BABBLING BROOK 1";
	rooms["IRONWOODS 2"].westExit = "IRONWOODS BEND 1";
	rooms["IRONWOODS 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["IRONWOODS 2"].addFlag(GLOBAL.HAZARD);
	rooms["IRONWOODS 2"].runOnEnter = jungleEncounterChances;

	//41. The Babbling Brook
	rooms["BABBLING BROOK 1"] = new RoomClass(this);
	rooms["BABBLING BROOK 1"].roomName = "BABBLING\nBROOK";
	rooms["BABBLING BROOK 1"].description = "Gleaming waters ripple as they flow past you, travelling from north to south in a winding torrent of liquid refreshment. Of course, this is a jungle, so the waters are probably full of parasites in spite of their apparent clarity. Ferns, bushes, and flowers of exotic colorations and appearances line the banks, and the stream itself is only a few inches deep. You should be able to cross it without issue. The path picks up on the other side, winding east and west past the gigantic ironwoods that seem so prevalent here.";
	rooms["BABBLING BROOK 1"].planet = "PLANET: MHEN'GA";
	rooms["BABBLING BROOK 1"].system = "SYSTEM: ARA ARA";
	rooms["BABBLING BROOK 1"].eastExit = "IRONWOODS 3";
	rooms["BABBLING BROOK 1"].westExit = "IRONWOODS 2";
	rooms["BABBLING BROOK 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["BABBLING BROOK 1"].addFlag(GLOBAL.HAZARD);
	rooms["BABBLING BROOK 1"].runOnEnter = jungleEncounterChances;

	//42. The Ironwoods
	rooms["IRONWOODS 3"] = new RoomClass(this);
	rooms["IRONWOODS 3"].roomName = "THE\nIRONWOODS";
	rooms["IRONWOODS 3"].description = "Between the huge trunks of the red-tinted ironwoods, a large amount of vegetation has grown. Exotic bushes two feet high rustle on either side of the damp path, their leaves a matte blue. You can hear the sound of running water to the west, indicating the stream you crossed to get out this far. You idly brush a flake of rust from your [pc.skinFurScales] as you walk, frowning up at the tree that's shedding such filth. You can go east and west.";
	rooms["IRONWOODS 3"].planet = "PLANET: MHEN'GA";
	rooms["IRONWOODS 3"].system = "SYSTEM: ARA ARA";
	rooms["IRONWOODS 3"].eastExit = "IRONWOODS BEND 2";
	rooms["IRONWOODS 3"].westExit = "BABBLING BROOK 1";
	rooms["IRONWOODS 3"].addFlag(GLOBAL.OUTDOOR);
	rooms["IRONWOODS 3"].addFlag(GLOBAL.HAZARD);
	rooms["IRONWOODS 3"].runOnEnter = jungleEncounterChances;

	//43. A Bend in the Ironwoods
	rooms["IRONWOODS BEND 2"] = new RoomClass(this);
	rooms["IRONWOODS BEND 2"].roomName = "IRONWOODS\nBEND";
	rooms["IRONWOODS BEND 2"].description = "A trunk as wide as a small graffball court towers above to the northeast, and the winding little trail you've been following curves around to the west and south. This seems to be the last of the immense rusty trunks if you go south, though a great many can be seen along the way to the west. Orange-leaved plants glimmer along either side of this trail to the south. You even spot some tracks, though you are unable to determine what kind of animal left them. They definitely don't belong to any species you're familiar with.";
	rooms["IRONWOODS BEND 2"].planet = "PLANET: MHEN'GA";
	rooms["IRONWOODS BEND 2"].system = "SYSTEM: ARA ARA";
	rooms["IRONWOODS BEND 2"].westExit = "IRONWOODS 3";
	rooms["IRONWOODS BEND 2"].southExit = "DENSE ORANGE 1";
	rooms["IRONWOODS BEND 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["IRONWOODS BEND 2"].addFlag(GLOBAL.HAZARD);
	rooms["IRONWOODS BEND 2"].runOnEnter = jungleEncounterChances;

	//44. The Dense Orange
	//10m travel time?
	rooms["DENSE ORANGE 1"] = new RoomClass(this);
	rooms["DENSE ORANGE 1"].roomName = "THE DENSE\nORANGE";
	rooms["DENSE ORANGE 1"].description = "Orange-hued plants of all descriptions grow thickly here, forcing you to struggle past crimson vines and trample the occasional green sprout on your way. It's rough traveling, but at least there's still the path. It seems to have been kept clear by animals of some kind; more than a few vibrant leaves have bite-shaped chunks missing out of them. The path struggles through to the north and south.";
	rooms["DENSE ORANGE 1"].planet = "PLANET: MHEN'GA";
	rooms["DENSE ORANGE 1"].system = "SYSTEM: ARA ARA";
	rooms["DENSE ORANGE 1"].northExit = "IRONWOODS BEND 2";
	rooms["DENSE ORANGE 1"].southExit = "DENSE ORANGE 2";
	rooms["DENSE ORANGE 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["DENSE ORANGE 1"].addFlag(GLOBAL.HAZARD);
	rooms["DENSE ORANGE 1"].runOnEnter = jungleMiddleEncounters;

	//45. The Dense Orange
	rooms["DENSE ORANGE 2"] = new RoomClass(this);
	rooms["DENSE ORANGE 2"].roomName = "THE DENSE\nORANGE";
	rooms["DENSE ORANGE 2"].description = "The jungle on either side is flooded with orangish plants of all sizes and descriptions. There are waist-high, peach-colored ferns. There are trees with tangerine vines covering their trunks. There's even tufts of round-bladed, orange grass under[pc.foot]. The way through this mess of spectacularly hued organic growth looks well traveled, though no obvious tracks reveal themselves. You can continue north and south from here.";
	rooms["DENSE ORANGE 2"].planet = "PLANET: MHEN'GA";
	rooms["DENSE ORANGE 2"].system = "SYSTEM: ARA ARA";
	rooms["DENSE ORANGE 2"].northExit = "DENSE ORANGE 1";
	rooms["DENSE ORANGE 2"].southExit = "DENSE ORANGE 3";
	rooms["DENSE ORANGE 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["DENSE ORANGE 2"].addFlag(GLOBAL.HAZARD);
	rooms["DENSE ORANGE 2"].runOnEnter = jungleMiddleEncounters;

	//46. The Dense Orange
	rooms["DENSE ORANGE 3"] = new RoomClass(this);
	rooms["DENSE ORANGE 3"].roomName = "THE DENSE\nORANGE";
	rooms["DENSE ORANGE 3"].description = "Caterpillars as big as your thumb are swarming all over a crimson-trunked tree. A closer look reveals that the arboreal victim is already missing all its leaves and likely dead. The odd insects chitter noisily as they devour the bark, completely oblivious to your presence. You leave them and consider the trail before you; it snakes north-south through the vibrant jungle. The babbling of a brook or river can be heard distantly to the west, but there is no way through the brush in that direction.";
	rooms["DENSE ORANGE 3"].planet = "PLANET: MHEN'GA";
	rooms["DENSE ORANGE 3"].system = "SYSTEM: ARA ARA";
	rooms["DENSE ORANGE 3"].northExit = "DENSE ORANGE 2";
	rooms["DENSE ORANGE 3"].southExit = "DENSE ORANGE 4";
	rooms["DENSE ORANGE 3"].addFlag(GLOBAL.OUTDOOR);
	rooms["DENSE ORANGE 3"].addFlag(GLOBAL.HAZARD);
	rooms["DENSE ORANGE 3"].runOnEnter = jungleMiddleEncounters;

	//47. The Dense Orange
	rooms["DENSE ORANGE 4"] = new RoomClass(this);
	rooms["DENSE ORANGE 4"].roomName = "THE DENSE\nORANGE";
	rooms["DENSE ORANGE 4"].description = "Treading carefully, you do your best to traverse Mhen'ga's less-than-hospitable terrain without injuring yourself, and thus far, it's going fairly well. This small trail is the only way through the dense orange undergrowth that surrounds it. With enough time and effort it might be possible to blaze your own trail through the shimmering, peach-hued leaves, but it would take so long that by the time you got anywhere, the planet rush would be over and Mhen'ga colonized. You can follow the path north and south.";
	rooms["DENSE ORANGE 4"].planet = "PLANET: MHEN'GA";
	rooms["DENSE ORANGE 4"].system = "SYSTEM: ARA ARA";
	rooms["DENSE ORANGE 4"].northExit = "DENSE ORANGE 3";
	rooms["DENSE ORANGE 4"].southExit = "ORANGE INTERSECTION 1";
	rooms["DENSE ORANGE 4"].addFlag(GLOBAL.OUTDOOR);
	rooms["DENSE ORANGE 4"].addFlag(GLOBAL.HAZARD);
	rooms["DENSE ORANGE 4"].runOnEnter = jungleMiddleEncounters;

	//48. An Orange Intersection
	rooms["ORANGE INTERSECTION 1"] = new RoomClass(this);
	rooms["ORANGE INTERSECTION 1"].roomName = "ORANGE\nINTERSECTION";
	rooms["ORANGE INTERSECTION 1"].description = "The tangerine-dyed foilage is split by the meeting of two paths here. One, a narrow, old path, travels north and south through the candy-colored growth. The other snakes off to the east. It looks much less traveled. Indeed, you might not have noticed it if the gap in the plant-life wasn't so obviously illuminated thanks to the dayglow tone of the surrounding leaves.";
	rooms["ORANGE INTERSECTION 1"].planet = "PLANET: MHEN'GA";
	rooms["ORANGE INTERSECTION 1"].system = "SYSTEM: ARA ARA";
	rooms["ORANGE INTERSECTION 1"].northExit = "DENSE ORANGE 4";
	rooms["ORANGE INTERSECTION 1"].southExit = "DENSE ORANGE 5";
	rooms["ORANGE INTERSECTION 1"].eastExit = "NARROW PATH 1";
	rooms["ORANGE INTERSECTION 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["ORANGE INTERSECTION 1"].addFlag(GLOBAL.HAZARD);
	rooms["ORANGE INTERSECTION 1"].runOnEnter = jungleMiddleEncounters;

	//49. The Dense Orange
	rooms["DENSE ORANGE 5"] = new RoomClass(this);
	rooms["DENSE ORANGE 5"].roomName = "THE DENSE\nORANGE";
	rooms["DENSE ORANGE 5"].description = "Orange plants of every shape and size grow in droves around you. Though some bear fruit of crimson or green, most types are a nearly matching shade of tangerine, perhaps to camouflage them against their peers or some other unknown purpose. Regardless, the path you're standing on leads north towards an intersection and south towards a westward bend.";
	rooms["DENSE ORANGE 5"].planet = "PLANET: MHEN'GA";
	rooms["DENSE ORANGE 5"].system = "SYSTEM: ARA ARA";
	rooms["DENSE ORANGE 5"].northExit = "ORANGE INTERSECTION 1";
	rooms["DENSE ORANGE 5"].southExit = "DARK ORANGE CORNER 1";
	rooms["DENSE ORANGE 5"].addFlag(GLOBAL.OUTDOOR);
	rooms["DENSE ORANGE 5"].addFlag(GLOBAL.HAZARD);
	rooms["DENSE ORANGE 5"].runOnEnter = jungleMiddleEncounters;

	//50. Dark Orange Corner
	rooms["DARK ORANGE CORNER 1"] = new RoomClass(this);
	rooms["DARK ORANGE CORNER 1"].roomName = "DARK ORANGE\nCORNER";
	rooms["DARK ORANGE CORNER 1"].description = "You stand on the edge of darkness and light (relative to this jungle, anyway). If you follow the path to the west, the forest turns almost unacceptably dark. The canopy above that part of the woods is so dense that only a few, weak beams of light penetrate down to the forest floor. To the north, the woods lighten to a dramatic degree thanks to brilliant, almost neon plant-life that grows on all sides of the well-trod path.";
	rooms["DARK ORANGE CORNER 1"].planet = "PLANET: MHEN'GA";
	rooms["DARK ORANGE CORNER 1"].system = "SYSTEM: ARA ARA";
	rooms["DARK ORANGE CORNER 1"].northExit = "DENSE ORANGE 5";
	rooms["DARK ORANGE CORNER 1"].westExit = "DEEP FOREST 1";
	rooms["DARK ORANGE CORNER 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["DARK ORANGE CORNER 1"].addFlag(GLOBAL.HAZARD);
	rooms["DARK ORANGE CORNER 1"].runOnEnter = jungleMiddleEncounters;

	//51. Deep Forest
	rooms["DEEP FOREST 1"] = new RoomClass(this);
	rooms["DEEP FOREST 1"].roomName = "DEEP\nFOREST";
	rooms["DEEP FOREST 1"].description = "Navigation is tricky with so little light to illuminate the way, but the lack of visible light assists you in other ways, keeping brush and undergrowth to an absolute minimum. If you were so inclined, you could easily wander around the gloomy wood. It would be wise not to wander too far, however; you don't want to get lost on such a wild planet. The woodland trail makes a straight line east to west. In the former direction, the forest lightens. In the latter, a small brook crosses the trail. The waters are crystal clear and shallow enough to cross without issue.";
	rooms["DEEP FOREST 1"].planet = "PLANET: MHEN'GA";
	rooms["DEEP FOREST 1"].system = "SYSTEM: ARA ARA";
	rooms["DEEP FOREST 1"].eastExit = "DARK ORANGE CORNER 1";
	rooms["DEEP FOREST 1"].westExit = "DEEP INTERSECTION 1";
	rooms["DEEP FOREST 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["DEEP FOREST 1"].addFlag(GLOBAL.HAZARD);
	rooms["DEEP FOREST 1"].runOnEnter = jungleMiddleEncounters;

	//52. Deep Intersection
	rooms["DEEP INTERSECTION 1"] = new RoomClass(this);
	rooms["DEEP INTERSECTION 1"].roomName = "DEEP\nINTERSECTION";
	rooms["DEEP INTERSECTION 1"].description = "The well-packed earth splits off in a 'T' intersection - an east fork, a south fork, and a west fork. In the east-west route, the trail remains steady and smooth through the near darkness. To the south, you can see shafts of sunlight flickering down through the treetops, but it also smells thick and damp with humidity, pollen, and spores. A babbling brook crosses the path just east of here. It's barely a few inches deep and so placid that the crossing would be little more than a damp footnote on your journey.";
	rooms["DEEP INTERSECTION 1"].planet = "PLANET: MHEN'GA";
	rooms["DEEP INTERSECTION 1"].system = "SYSTEM: ARA ARA";
	rooms["DEEP INTERSECTION 1"].eastExit = "DEEP FOREST 1";
	rooms["DEEP INTERSECTION 1"].westExit = "DEEP FOREST 2";
	rooms["DEEP INTERSECTION 1"].southExit = "DEEP JUNGLE 1";
	rooms["DEEP INTERSECTION 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["DEEP INTERSECTION 1"].addFlag(GLOBAL.HAZARD);
	rooms["DEEP INTERSECTION 1"].runOnEnter = jungleMiddleEncounters;

	//53. Deep Forest
	rooms["DEEP FOREST 2"] = new RoomClass(this);
	rooms["DEEP FOREST 2"].roomName = "DEEP\nFOREST";
	rooms["DEEP FOREST 2"].description = "The shadows here move with a kind of unnerving motion, twisting this way and that as unseen breezes rustle the leaves some hundreds of feet above. You continually flick your gaze around, and in a way, you're thankful that the darkness has kept the bushes down to minimum here. There's less places for potential foes to lurk. Unless... they're above you? You jerk back, staring at the trees in alarm. Emptiness. Well, you can always follow the path east through the darkness or west towards a more illuminated bend.";
	rooms["DEEP FOREST 2"].planet = "PLANET: MHEN'GA";
	rooms["DEEP FOREST 2"].system = "SYSTEM: ARA ARA";
	rooms["DEEP FOREST 2"].eastExit = "DEEP INTERSECTION 1";
	rooms["DEEP FOREST 2"].westExit = "IRON AND DARK CORNER 1";
	rooms["DEEP FOREST 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["DEEP FOREST 2"].addFlag(GLOBAL.HAZARD);
	rooms["DEEP FOREST 2"].runOnEnter = jungleMiddleEncounters;

	//54. Corner of Iron and Dark
	rooms["IRON AND DARK CORNER 1"] = new RoomClass(this);
	rooms["IRON AND DARK CORNER 1"].roomName = "IRONWOOD &\nDARK CORNER";
	rooms["IRON AND DARK CORNER 1"].description = "Twisting, the path curves away to the north and the east. To the east, the canopy above has grown in so thick that the forest floor is in a perpetual nightfall. To the north, strange, reddish trees clash with all varieties of colored lichens. Bits of sunlight do stream down to illuminate the area you're standing in, but it is neither as bright or as gloomy as the north and the east respectively.";
	rooms["IRON AND DARK CORNER 1"].planet = "PLANET: MHEN'GA";
	rooms["IRON AND DARK CORNER 1"].system = "SYSTEM: ARA ARA";
	rooms["IRON AND DARK CORNER 1"].northExit = "LICHENS AT IRONWOODS 1";
	rooms["IRON AND DARK CORNER 1"].eastExit = "DEEP FOREST 2";
	rooms["IRON AND DARK CORNER 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["IRON AND DARK CORNER 1"].addFlag(GLOBAL.HAZARD);
	rooms["IRON AND DARK CORNER 1"].runOnEnter = jungleMiddleEncounters;

	//55. Narrow Path
	rooms["NARROW PATH 1"] = new RoomClass(this);
	rooms["NARROW PATH 1"].roomName = "NARROW\nPATH";
	rooms["NARROW PATH 1"].description = "There's so much plant-life surrounding this path that it's very difficult to follow. Under[pc.foot], you spot recently trampled grasses and mushroom-like growth. Whoever blazed this trail did it not so long ago, and judging by how some of the vegetation is growing back in, there hasn't been enough traffic to keep the jungle from coming in to reclaim it. A junction with a more travelled route lies to the west. To the east, the narrow way continues.";
	rooms["NARROW PATH 1"].planet = "PLANET: MHEN'GA";
	rooms["NARROW PATH 1"].system = "SYSTEM: ARA ARA";
	rooms["NARROW PATH 1"].westExit = "ORANGE INTERSECTION 1";
	rooms["NARROW PATH 1"].eastExit = "NARROW BEND 1";
	rooms["NARROW PATH 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["NARROW PATH 1"].addFlag(GLOBAL.HAZARD);
	rooms["NARROW PATH 1"].runOnEnter = jungleMiddleEncounters;

	//56. Narrow Bend
	rooms["NARROW BEND 1"] = new RoomClass(this);
	rooms["NARROW BEND 1"].roomName = "NARROW\nBEND";
	rooms["NARROW BEND 1"].description = "This unkempt, small trail bends south and west here. The foliage on either side is closing in dangerously, making it difficult to move forward without much risk, and the air here is rather stuffy. High above, you can see a number of broken branches and the odd scorch marks here and there. They seem to descend towards the south - the same direction this path is leading. You can go south, deeper into the humid jungle, or west, where the air is a little clearer.";
	rooms["NARROW BEND 1"].planet = "PLANET: MHEN'GA";
	rooms["NARROW BEND 1"].system = "SYSTEM: ARA ARA";
	rooms["NARROW BEND 1"].westExit = "NARROW PATH 1";
	rooms["NARROW BEND 1"].southExit = "NARROW PATH 2";
	rooms["NARROW BEND 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["NARROW BEND 1"].addFlag(GLOBAL.HAZARD);
	rooms["NARROW BEND 1"].runOnEnter = jungleMiddleEncounters;

	//57. Narrow Jungle Path
	//DEEP JURGLE
	rooms["NARROW PATH 2"] = new RoomClass(this);
	rooms["NARROW PATH 2"].roomName = "NARROW\nJUNGLE PATH";
	rooms["NARROW PATH 2"].description = "The scorch marks that marred the trees high above to the north continue down and to the south here. You can see them dipping closer and closer to the jungle floor, and it truly is a jungle here. The air is far more humid than it is to the north. The buzz from the myriad life-forms, many of them insectile, is nearly deafening this deep in the jungle. The trunks of the trees seem thicker, the plant-life denser. This is unquestionably what you'd classify as 'deep jungle'. To the north, the path to a slightly less overgrown area. To the south, the jungle worsens.";
	rooms["NARROW PATH 2"].planet = "PLANET: MHEN'GA";
	rooms["NARROW PATH 2"].system = "SYSTEM: ARA ARA";
	rooms["NARROW PATH 2"].northExit = "NARROW BEND 1";
	rooms["NARROW PATH 2"].southExit = "NARROW PATH 3";
	rooms["NARROW PATH 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["NARROW PATH 2"].addFlag(GLOBAL.HAZARD);
	rooms["NARROW PATH 2"].runOnEnter = jungleMiddleEncounters;

	//58. Narrow Jungle Path
	rooms["NARROW PATH 3"] = new RoomClass(this);
	rooms["NARROW PATH 3"].roomName = "NARROW\nJUNGLE PATH";
	rooms["NARROW PATH 3"].description = "Droplets of water fall from higher up in this verdant, almost claustrophobic jungle. Everything seems to be coated in a fine layer of humidity from the omnipresent moisture. Perhaps it would explain why the scorched leaves on either side of the path never caught fire. A divot in the ground starts here, burrowing away to the south. It doesn't look to get much deeper, but it does look to have charred the earth with carbon as it went. The source lies to the south.";
	rooms["NARROW PATH 3"].planet = "PLANET: MHEN'GA";
	rooms["NARROW PATH 3"].system = "SYSTEM: ARA ARA";
	rooms["NARROW PATH 3"].northExit = "NARROW PATH 2";
	rooms["NARROW PATH 3"].southExit = "METAL POD 1";
	rooms["NARROW PATH 3"].addFlag(GLOBAL.OUTDOOR);
	rooms["NARROW PATH 3"].addFlag(GLOBAL.HAZARD);
	rooms["NARROW PATH 3"].runOnEnter = jungleMiddleEncounters;

	//59. Dead End
	rooms["METAL POD 1"] = new RoomClass(this);
	rooms["METAL POD 1"].roomName = "METAL\nPOD";
	rooms["METAL POD 1"].description = "Buried halfway in a small crater of its own creation sits an oblong metal pod, perhaps ten feet long and three across. The surface is still glossy after its obviously hot reentry; you can see the way it blackened the ground and the plants around it. You immediately recognize it as one of the probes your father sent out - one of the keys to his fortune.";
	rooms["METAL POD 1"].planet = "PLANET: MHEN'GA";
	rooms["METAL POD 1"].system = "SYSTEM: ARA ARA";
	rooms["METAL POD 1"].northExit = "NARROW PATH 3";
	rooms["METAL POD 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["METAL POD 1"].addFlag(GLOBAL.HAZARD);
	rooms["METAL POD 1"].runOnEnter = approachRivalOnMhenga;

	//60. Deep\nJungle
	rooms["DEEP JUNGLE 1"] = new RoomClass(this);
	rooms["DEEP JUNGLE 1"].roomName = "DEEP\nJUNGLE";
	rooms["DEEP JUNGLE 1"].description = "There is so much pollen in the air here that you can't help but stifle a series of uncontrollable sneezes. The entire place is covered in vines, flowers, and overgrowth that lacks a decent word in your language to describe it. Some of the dangling cords of plant matter even appear to be prehensile, twitching to grap a fist-sized insect out of the air. You hear the crack of an exoskeleton break after. <b>You had best be on guard here.</b>";
	rooms["DEEP JUNGLE 1"].planet = "PLANET: MHEN'GA";
	rooms["DEEP JUNGLE 1"].system = "SYSTEM: ARA ARA";
	rooms["DEEP JUNGLE 1"].northExit = "DEEP INTERSECTION 1";
	rooms["DEEP JUNGLE 1"].southExit = "DEEP JUNGLE 2";
	rooms["DEEP JUNGLE 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["DEEP JUNGLE 1"].addFlag(GLOBAL.HAZARD);
	rooms["DEEP JUNGLE 1"].runOnEnter = jungleDeepEncounters;

	//61. Deep\nJungle
	rooms["DEEP JUNGLE 2"] = new RoomClass(this);
	rooms["DEEP JUNGLE 2"].roomName = "DEEP\nJUNGLE";
	rooms["DEEP JUNGLE 2"].description = "Bending here, the only opening in this incredibly overgrown vegetation arcs to the north and west. You doubt you could climb through the walls of plant-matter in the other direction if you tried. Besides, you have no idea just what kinds of carnivorous plants or animals live there. Small shafts of sunlight sometimes illuminate the odd patch of forest floor, but they are more like candles on a dark night than floodlights you desire.";
	rooms["DEEP JUNGLE 2"].planet = "PLANET: MHEN'GA";
	rooms["DEEP JUNGLE 2"].system = "SYSTEM: ARA ARA";
	rooms["DEEP JUNGLE 2"].northExit = "DEEP JUNGLE 1";
	rooms["DEEP JUNGLE 2"].westExit = "FORKED DEEP JUNGLE 1";
	rooms["DEEP JUNGLE 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["DEEP JUNGLE 2"].addFlag(GLOBAL.HAZARD);
	rooms["DEEP JUNGLE 2"].runOnEnter = jungleDeepEncounters;

	//62. Forked\nJungle
	rooms["FORKED DEEP JUNGLE 1"] = new RoomClass(this);
	rooms["FORKED DEEP JUNGLE 1"].roomName = "DEEP JUNGLE\nFORK";
	rooms["FORKED DEEP JUNGLE 1"].description = "There's three distinct paths that you could follow from this point: one to east, one to the south, and one to the west. The latter two show a distinct difference in the bordering plant-life; it's almost entirely vines covered in flowers. You can spot the odd tree-trunk here or there, but they're completely overgrown by the green tendrils. They seem almost... strangled. It would be wise not to stray too far from the openings in that direction. To the east, the trail looks a little less threatening, but it is still in the deep, dark jungle.";
	rooms["FORKED DEEP JUNGLE 1"].planet = "PLANET: MHEN'GA";
	rooms["FORKED DEEP JUNGLE 1"].system = "SYSTEM: ARA ARA";
	rooms["FORKED DEEP JUNGLE 1"].eastExit = "DEEP JUNGLE 2";
	rooms["FORKED DEEP JUNGLE 1"].southExit = "VINED JUNGLE 1";
	rooms["FORKED DEEP JUNGLE 1"].westExit = "VINED JUNGLE 6";
	rooms["FORKED DEEP JUNGLE 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["FORKED DEEP JUNGLE 1"].addFlag(GLOBAL.HAZARD);
	rooms["FORKED DEEP JUNGLE 1"].runOnEnter = jungleDeepEncounters;

	//63. Vined Jungle
	rooms["VINED JUNGLE 1"] = new RoomClass(this);
	rooms["VINED JUNGLE 1"].roomName = "VINED\nJUNGLE";
	rooms["VINED JUNGLE 1"].description = "A vine lashes out at your [pc.foot]. Kicking it away, you briefly stumble, but nothing seems to capitalize on your momentary loss of balance. You're probably not the prey it was looking for. There's so many of those plant-like tentacles here that they may as well be impenetrable walls of squirming flesh. Something has been keeping them pruned back from this path enough to navigate. You can go north and south from here.";
	rooms["VINED JUNGLE 1"].planet = "PLANET: MHEN'GA";
	rooms["VINED JUNGLE 1"].system = "SYSTEM: ARA ARA";
	rooms["VINED JUNGLE 1"].northExit = "FORKED DEEP JUNGLE 1";
	rooms["VINED JUNGLE 1"].southExit = "VINED JUNGLE 2";
	rooms["VINED JUNGLE 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["VINED JUNGLE 1"].addFlag(GLOBAL.HAZARD);
	rooms["VINED JUNGLE 1"].runOnEnter = jungleDeepEncounters;

	//64. Vined Jungle/Corner
	rooms["VINED JUNGLE 2"] = new RoomClass(this);
	rooms["VINED JUNGLE 2"].roomName = "VINED\nJUNGLE";
	rooms["VINED JUNGLE 2"].description = "The path through the tentacles takes a gentle curve to the north and east underfoot. It seems almost mechanical in the smoothness of its arc, and the none of the vines bother you in the slightest as you consider your options. You hear the crack of an insect falling prey to the wriggling plantlife, ominously encouraging you to leave this place behind.";
	rooms["VINED JUNGLE 2"].planet = "PLANET: MHEN'GA";
	rooms["VINED JUNGLE 2"].system = "SYSTEM: ARA ARA";
	rooms["VINED JUNGLE 2"].northExit = "VINED JUNGLE 1";
	rooms["VINED JUNGLE 2"].westExit = "VINED JUNGLE 3";
	rooms["VINED JUNGLE 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["VINED JUNGLE 2"].addFlag(GLOBAL.HAZARD);
	rooms["VINED JUNGLE 2"].runOnEnter = jungleDeepEncounters;

	//65. Vined\nJungle
	rooms["VINED JUNGLE 3"] = new RoomClass(this);
	rooms["VINED JUNGLE 3"].roomName = "VINED\nJUNGLE";
	rooms["VINED JUNGLE 3"].description = "The unnatural, squirming walls on either side undulate like the waves of an ocean stuck on its side. It's enough to set one's nerves on edge, and the darkness of the deep jungle's atmosphere doesn't really help. A lazily buzzing bug with at least twelve finger-sized legs crosses your way, but it doesn't stop to pay you any attention. To the west, the vines thin. To the east, the both the tendrils and the path continue on much the same.";
	rooms["VINED JUNGLE 3"].planet = "PLANET: MHEN'GA";
	rooms["VINED JUNGLE 3"].system = "SYSTEM: ARA ARA";
	rooms["VINED JUNGLE 3"].eastExit = "VINED JUNGLE 2";
	rooms["VINED JUNGLE 3"].westExit = "OVERGROWN ROCK 1";
	rooms["VINED JUNGLE 3"].addFlag(GLOBAL.OUTDOOR);
	rooms["VINED JUNGLE 3"].addFlag(GLOBAL.HAZARD);
	rooms["VINED JUNGLE 3"].runOnEnter = jungleDeepEncounters;

	//66. Overgrown\nRock
	rooms["OVERGROWN ROCK 1"] = new RoomClass(this);
	rooms["OVERGROWN ROCK 1"].roomName = "GIGANTIC\nROCK";
	rooms["OVERGROWN ROCK 1"].description = "A rock, almost mountain-like in proportions, towers overhead to the west of here. It's so tall that you would be in its shadow if it everything wasn't already so deeply steeped in darkness. You wager it rises up at least a few hundred feet into the air, its walls almost completely sheer. It's been there long enough to have accumulated a healthy covering of mosses, fungus, and other growths. You can go north and south around it or east on a trail that's surrounded by tentacles.";
	rooms["OVERGROWN ROCK 1"].planet = "PLANET: MHEN'GA";
	rooms["OVERGROWN ROCK 1"].system = "SYSTEM: ARA ARA";
	rooms["OVERGROWN ROCK 1"].northExit = "OVERGROWN ROCK 2";
	rooms["OVERGROWN ROCK 1"].eastExit = "VINED JUNGLE 3";
	rooms["OVERGROWN ROCK 1"].southExit = "OVERGROWN ROCK 4";
	rooms["OVERGROWN ROCK 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["OVERGROWN ROCK 1"].addFlag(GLOBAL.HAZARD);
	rooms["OVERGROWN ROCK 1"].runOnEnter = jungleDeepEncounters;

	//67. Overgrown\nRock
	rooms["OVERGROWN ROCK 2"] = new RoomClass(this);
	rooms["OVERGROWN ROCK 2"].roomName = "GIGANTIC\nROCK";
	rooms["OVERGROWN ROCK 2"].description = "You stand at what could be called the corner of the mountainous boulder if it was less jagged and more orderly in its change of direction. There's enough clear space around it for you to keep going to the south or the west along the rock face. An infestation of vines, more tentacles really, blocks the way to the north and the east. Looking at how they move, you don't have any desire to get too close to them.";
	rooms["OVERGROWN ROCK 2"].planet = "PLANET: MHEN'GA";
	rooms["OVERGROWN ROCK 2"].system = "SYSTEM: ARA ARA";
	rooms["OVERGROWN ROCK 2"].southExit = "OVERGROWN ROCK 1";
	rooms["OVERGROWN ROCK 2"].westExit = "OVERGROWN ROCK 3";
	rooms["OVERGROWN ROCK 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["OVERGROWN ROCK 2"].addFlag(GLOBAL.HAZARD);
	rooms["OVERGROWN ROCK 2"].runOnEnter = jungleDeepEncounters;

	//68. Overgrown\nRock
	rooms["OVERGROWN ROCK 3"] = new RoomClass(this);
	rooms["OVERGROWN ROCK 3"].roomName = "GIGANTIC\nROCK";
	rooms["OVERGROWN ROCK 3"].description = "A flat, almost featureless rock wall rises up to the south of here, towering over you by hundreds of feet. Its cracks and crevices are almost entirely filled with colorful forms of plant life, but for some reason, nothing has grown that close to it, enabled you to walk by it to the east and the west as you wish. To the north, there's thousands of vines bundled together. Most hang there limply, yet some are moving, squirming like tentacles. A path leads north between them, if you dare head through them.";
	rooms["OVERGROWN ROCK 3"].planet = "PLANET: MHEN'GA";
	rooms["OVERGROWN ROCK 3"].system = "SYSTEM: ARA ARA";
	rooms["OVERGROWN ROCK 3"].northExit = "VINED JUNGLE 4";
	rooms["OVERGROWN ROCK 3"].eastExit = "OVERGROWN ROCK 2";
	rooms["OVERGROWN ROCK 3"].westExit = "OVERGROWN ROCK 12";
	rooms["OVERGROWN ROCK 3"].addFlag(GLOBAL.OUTDOOR);
	rooms["OVERGROWN ROCK 3"].addFlag(GLOBAL.HAZARD);
	rooms["OVERGROWN ROCK 3"].runOnEnter = jungleDeepEncounters;

	//69. Vined\nJungle
	rooms["VINED JUNGLE 4"] = new RoomClass(this);
	rooms["VINED JUNGLE 4"].roomName = "VINED\nJUNGLE";
	rooms["VINED JUNGLE 4"].description = "There's so many vines here that you can barely see the trees responsible for the light-obscuring canopy high above. One thing you can be sure of is that there are almost no other kinds of plants this low to the ground; the wriggling mass of botanical tentacles has consumed it all. One snaps into the air to snag a fist-sized bug as you walk, popping its exoskeleton a moment later. It lowers its prey out of sight before you can see any more. The path opens up next to a large rock to the south, or you can follow the trail to the east, through the vines.";
	rooms["VINED JUNGLE 4"].planet = "PLANET: MHEN'GA";
	rooms["VINED JUNGLE 4"].system = "SYSTEM: ARA ARA";
	rooms["VINED JUNGLE 4"].southExit = "OVERGROWN ROCK 3";
	rooms["VINED JUNGLE 4"].eastExit = "VINED JUNGLE 5";
	rooms["VINED JUNGLE 4"].addFlag(GLOBAL.OUTDOOR);
	rooms["VINED JUNGLE 4"].addFlag(GLOBAL.HAZARD);
	rooms["VINED JUNGLE 4"].runOnEnter = jungleDeepEncounters;

	//70. Vined\nJungle
	rooms["VINED JUNGLE 5"] = new RoomClass(this);
	rooms["VINED JUNGLE 5"].roomName = "VINED\nJUNGLE";
	rooms["VINED JUNGLE 5"].description = "Placing your [pc.feet] very carefully, you take great pains not to step on any of the vines around you, lest they turn out to be predatory monstrosities. Whatever cleared the path must have instilled a healthy fear in the tendrils, because while some flail through the air above or alongside you, none reach out after you. You suspect you are mostly safe so long as you stay on the path. It leads east and west away from here.";
	rooms["VINED JUNGLE 5"].planet = "PLANET: MHEN'GA";
	rooms["VINED JUNGLE 5"].system = "SYSTEM: ARA ARA";
	rooms["VINED JUNGLE 5"].westExit = "VINED JUNGLE 4";
	rooms["VINED JUNGLE 5"].eastExit = "VINED JUNGLE 6";
	rooms["VINED JUNGLE 5"].addFlag(GLOBAL.OUTDOOR);
	rooms["VINED JUNGLE 5"].addFlag(GLOBAL.HAZARD);
	rooms["VINED JUNGLE 5"].runOnEnter = jungleDeepEncounters;

	//71. Vined\nJungle
	rooms["VINED JUNGLE 6"] = new RoomClass(this);
	rooms["VINED JUNGLE 6"].roomName = "VINED\nJUNGLE";
	rooms["VINED JUNGLE 6"].description = "Between the darkness, the squirming plants, and the gigantic bugs that constantly flit by, you're ready to step somewhere that doesn't seem so obviously dangerous. A few rays of amber sunlight do trickle down, but they only serve to highlight the moist sheen that covers the green mounds. To the east, there appears to be three-way fork. The path continues to the west unbroken.";
	rooms["VINED JUNGLE 6"].planet = "PLANET: MHEN'GA";
	rooms["VINED JUNGLE 6"].system = "SYSTEM: ARA ARA";
	rooms["VINED JUNGLE 6"].westExit = "VINED JUNGLE 5";
	rooms["VINED JUNGLE 6"].eastExit = "FORKED DEEP JUNGLE 1";
	rooms["VINED JUNGLE 6"].addFlag(GLOBAL.OUTDOOR);
	rooms["VINED JUNGLE 6"].addFlag(GLOBAL.HAZARD);
	rooms["VINED JUNGLE 6"].runOnEnter = jungleDeepEncounters;

	//MORE ROOM CODING!
	//72. Overgrown\nRock
	rooms["OVERGROWN ROCK 4"] = new RoomClass(this);
	rooms["OVERGROWN ROCK 4"].roomName = "GIGANTIC\nROCK";
	rooms["OVERGROWN ROCK 4"].description = "The rock face is jagged and uneven as you crest this corner of the mountainous boulder. Its craggy surface is rough and broken, and a number of boulders have fallen into a crude pile around it. There's about fifteen feet of relatively clear space hugging its base that you can easily travel through. To the south, the jungle is so thick and dense that it would be difficult if not impossible to traverse without first burning back the overgrowth. The air here is almost as dank as the visibility is poor.";
	rooms["OVERGROWN ROCK 4"].planet = "PLANET: MHEN'GA";
	rooms["OVERGROWN ROCK 4"].system = "SYSTEM: ARA ARA";
	rooms["OVERGROWN ROCK 4"].westExit = "OVERGROWN ROCK 5";
	rooms["OVERGROWN ROCK 4"].northExit = "OVERGROWN ROCK 1";
	rooms["OVERGROWN ROCK 4"].addFlag(GLOBAL.OUTDOOR);
	rooms["OVERGROWN ROCK 4"].addFlag(GLOBAL.HAZARD);
	rooms["OVERGROWN ROCK 4"].runOnEnter = jungleDeepEncounters;

	//73. Overgrown\nRock
	rooms["OVERGROWN ROCK 5"] = new RoomClass(this);
	rooms["OVERGROWN ROCK 5"].roomName = "GIGANTIC\nROCK";
	rooms["OVERGROWN ROCK 5"].description = "Climbing high up into the canopy, this gray-colored, monolithic slab of rock almost seems to have burst from the grown ages ago, perhaps forced out by Mhen'ga's unearthly subterranean forces. Its surface is relatively unmarked aside from some tiny fissures that the plants have worked into it. The open space around it continues to the east and west; in the latter direction, the rock has broken apart enough to create a pile of rocks around its base.";
	rooms["OVERGROWN ROCK 5"].planet = "PLANET: MHEN'GA";
	rooms["OVERGROWN ROCK 5"].system = "SYSTEM: ARA ARA";
	rooms["OVERGROWN ROCK 5"].westExit = "OVERGROWN ROCK 6";
	rooms["OVERGROWN ROCK 5"].eastExit = "OVERGROWN ROCK 4";
	rooms["OVERGROWN ROCK 5"].addFlag(GLOBAL.OUTDOOR);
	rooms["OVERGROWN ROCK 5"].addFlag(GLOBAL.HAZARD);
	rooms["OVERGROWN ROCK 5"].runOnEnter = jungleDeepEncounters;

	//74. Overgrown\nRock
	rooms["OVERGROWN ROCK 6"] = new RoomClass(this);
	rooms["OVERGROWN ROCK 6"].roomName = "GIGANTIC\nROCK";
	rooms["OVERGROWN ROCK 6"].description = "The humidity is almost overpowering here. It makes the ground damp, it makes the rock shine, and it makes your [pc.skinFurScales] uncomfortably clammy. Leaves the size of small cars hang off the side of a trunk as big around as a small room. You could probably push past them if it wasn't for the thorny bushes and toothed flowers underneath. Even if you cut into the deep jungle that way, you'd be lost in no time. It'd be better to follow the open space along the sides of this rock to the east and west.";
	rooms["OVERGROWN ROCK 6"].planet = "PLANET: MHEN'GA";
	rooms["OVERGROWN ROCK 6"].system = "SYSTEM: ARA ARA";
	rooms["OVERGROWN ROCK 6"].westExit ="OVERGROWN ROCK 7";
	rooms["OVERGROWN ROCK 6"].eastExit = "OVERGROWN ROCK 5";
	rooms["OVERGROWN ROCK 6"].addFlag(GLOBAL.OUTDOOR);
	rooms["OVERGROWN ROCK 6"].addFlag(GLOBAL.HAZARD);
	rooms["OVERGROWN ROCK 6"].runOnEnter = findOxoniumOnMhenga;

	//75. Overgrown\nRock
	rooms["OVERGROWN ROCK 7"] = new RoomClass(this);
	rooms["OVERGROWN ROCK 7"].roomName = "GIGANTIC\nROCK";
	rooms["OVERGROWN ROCK 7"].description = "A nest of overgrown beetles erupts off the side of the rock like water from a geyser, exploding out in all directions. Their translucent wings shimmer where they cross some of the few rays of light lucky enough to penetrate this far. You wait for them to flutter off before advancing much farther, wiping some of the accumulated moisture from your brow. You can follow along the rock to the east and west. It blocks the way north, and going south into the rustling wall of alien plants would likely be a bad idea.";
	rooms["OVERGROWN ROCK 7"].planet = "PLANET: MHEN'GA";
	rooms["OVERGROWN ROCK 7"].system = "SYSTEM: ARA ARA";
	rooms["OVERGROWN ROCK 7"].westExit = "OVERGROWN ROCK 8";
	rooms["OVERGROWN ROCK 7"].eastExit = "OVERGROWN ROCK 6";
	rooms["OVERGROWN ROCK 7"].addFlag(GLOBAL.OUTDOOR);
	rooms["OVERGROWN ROCK 7"].addFlag(GLOBAL.HAZARD);
	rooms["OVERGROWN ROCK 7"].runOnEnter = jungleDeepEncounters;

	//76. Overgrown\nRock
	rooms["OVERGROWN ROCK 8"] = new RoomClass(this);
	rooms["OVERGROWN ROCK 8"].roomName = "GIGANTIC\nROCK";
	rooms["OVERGROWN ROCK 8"].description = "There's a series of half-broken, hard corners around the edge of this granite-like monolith. You can follow it to the north and east; there's plenty of room around it to walk, so long as you don't mind the humidity and darkness of this part of the jungle. High as it is, the column-like trees stretch higher still and cover it all with their dense wall of greenery. You doubt that even if you had the means to climb up there that there would be any more illumination to be found. You'll have to find your way out of the deep jungle if you ever want decent lighting again.";
	rooms["OVERGROWN ROCK 8"].planet = "PLANET: MHEN'GA";
	rooms["OVERGROWN ROCK 8"].system = "SYSTEM: ARA ARA";
	rooms["OVERGROWN ROCK 8"].northExit = "OVERGROWN ROCK 9";
	rooms["OVERGROWN ROCK 8"].eastExit = "OVERGROWN ROCK 7";
	rooms["OVERGROWN ROCK 8"].addFlag(GLOBAL.OUTDOOR);
	rooms["OVERGROWN ROCK 8"].addFlag(GLOBAL.HAZARD);
	rooms["OVERGROWN ROCK 8"].runOnEnter = jungleDeepEncounters;

	//77. Overgrown\nRock
	rooms["OVERGROWN ROCK 9"] = new RoomClass(this);
	rooms["OVERGROWN ROCK 9"].roomName = "GIGANTIC\nROCK";
	rooms["OVERGROWN ROCK 9"].description = "Following alongside the stone protrusion, you're treated to all manner of exotic sights and sounds. You hear animal calls that sound like high-pitched whistles. There's a bird whose squawk reminds you of the sound of discharge of a laser weapon. You even see a flower that pivots to follow you, its petals glowing an almost ultraviolet color. This truly is a strange and wonderful planet, but a touch dangerous too. The path leads north and south.";
	rooms["OVERGROWN ROCK 9"].planet = "PLANET: MHEN'GA";
	rooms["OVERGROWN ROCK 9"].system = "SYSTEM: ARA ARA";
	rooms["OVERGROWN ROCK 9"].northExit = "OVERGROWN ROCK 10";
	rooms["OVERGROWN ROCK 9"].southExit = "OVERGROWN ROCK 8";
	rooms["OVERGROWN ROCK 9"].addFlag(GLOBAL.OUTDOOR);
	rooms["OVERGROWN ROCK 9"].addFlag(GLOBAL.HAZARD);
	rooms["OVERGROWN ROCK 9"].runOnEnter = jungleDeepEncounters;

	//78. Overgrown\nRock
	rooms["OVERGROWN ROCK 10"] = new RoomClass(this);
	rooms["OVERGROWN ROCK 10"].roomName = "GIGANTIC\nROCK";
	rooms["OVERGROWN ROCK 10"].description = "You stand at one corner of the giant stone. From where you're standing, you can't even make out the top, but you can see that it's surface is riddled with mosses and lichen-like growths. You wager that it has been here for quite a long time, though you'd need a geologist for an accurate guess. The surrounding plant life has stayed away from the rocky protrusion for some reason, leaving a fifteen foot wide path that you can follow around it. There is also a small, maybe three foot wide, trail in between a few dozen person-sized leaves.";
	rooms["OVERGROWN ROCK 10"].planet = "PLANET: MHEN'GA";
	rooms["OVERGROWN ROCK 10"].system = "SYSTEM: ARA ARA";
	rooms["OVERGROWN ROCK 10"].southExit = "OVERGROWN ROCK 9";
	rooms["OVERGROWN ROCK 10"].eastExit = "OVERGROWN ROCK 11";
	rooms["OVERGROWN ROCK 10"].westExit = "GIANT LEAVES 1";
	rooms["OVERGROWN ROCK 10"].addFlag(GLOBAL.OUTDOOR);
	rooms["OVERGROWN ROCK 10"].addFlag(GLOBAL.HAZARD);
	rooms["OVERGROWN ROCK 10"].runOnEnter = jungleDeepEncounters;

	//79. Overgrown\nRock
	rooms["OVERGROWN ROCK 11"] = new RoomClass(this);
	rooms["OVERGROWN ROCK 11"].roomName = "GIGANTIC\nROCK";
	rooms["OVERGROWN ROCK 11"].description = "There's a gigantic rock here; its sheer walls almost stretch up to the canopy itself. Though covered in moss and small vines, it does not look to have succumbed to the jungle's clutches just yet. There is a path around it, leading east and west, and another path leads away to the north. That trail leads between an army of blooming purple flowers. There's so many of them that it looks almost like a sea of amethyst, rustling slightly in gentle breezes.";
	rooms["OVERGROWN ROCK 11"].planet = "PLANET: MHEN'GA";
	rooms["OVERGROWN ROCK 11"].system = "SYSTEM: ARA ARA";
	rooms["OVERGROWN ROCK 11"].westExit = "OVERGROWN ROCK 10";
	rooms["OVERGROWN ROCK 11"].eastExit = "OVERGROWN ROCK 12";
	rooms["OVERGROWN ROCK 11"].northExit = "PURPLE FLOWERS 1";
	rooms["OVERGROWN ROCK 11"].addFlag(GLOBAL.OUTDOOR);
	rooms["OVERGROWN ROCK 11"].addFlag(GLOBAL.HAZARD);
	rooms["OVERGROWN ROCK 11"].runOnEnter = jungleDeepEncounters;

	//80. Overgrown\nRock
	rooms["OVERGROWN ROCK 12"] = new RoomClass(this);
	rooms["OVERGROWN ROCK 12"].roomName = "GIGANTIC\nROCK";
	rooms["OVERGROWN ROCK 12"].description = "The jungle to the north of this stone behemoth looks increasingly odd the further you go to the east. Giant flowers and vines give way to squirming masses of tentacles, some of which appear to be predatory from the way they swat at some of the passing bugs. The smooth, mossy surface of the rock is here to the south as always, and the loamy dirt alongside it never seems to become too tangled with growth. You can go east and west from here.";
	rooms["OVERGROWN ROCK 12"].planet = "PLANET: MHEN'GA";
	rooms["OVERGROWN ROCK 12"].system = "SYSTEM: ARA ARA";
	rooms["OVERGROWN ROCK 12"].westExit = "OVERGROWN ROCK 11";
	rooms["OVERGROWN ROCK 12"].eastExit = "OVERGROWN ROCK 3";
	rooms["OVERGROWN ROCK 12"].addFlag(GLOBAL.OUTDOOR);
	rooms["OVERGROWN ROCK 12"].addFlag(GLOBAL.HAZARD);
	rooms["OVERGROWN ROCK 12"].runOnEnter = jungleDeepEncounters;

	//81. Giant\nLeaves
	rooms["GIANT LEAVES 1"] = new RoomClass(this);
	rooms["GIANT LEAVES 1"].roomName = "GIANT\nLEAVES";
	rooms["GIANT LEAVES 1"].description = "Leaves of the deepest emerald surround you on all sides, growing off of corded stalks that resemble miniature trees. Moisture beads off the leaves, trickling down into muddy puddles around their base. To the east of here, you can make out what looks like a cliff wall towering up into the canopy. Winding south, the gap between the leaves leads even deeper into this humid jungle.";
	rooms["GIANT LEAVES 1"].planet = "PLANET: MHEN'GA";
	rooms["GIANT LEAVES 1"].system = "SYSTEM: ARA ARA";
	rooms["GIANT LEAVES 1"].southExit = "GIANT LEAVES 2";
	rooms["GIANT LEAVES 1"].eastExit = "OVERGROWN ROCK 10";
	rooms["GIANT LEAVES 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["GIANT LEAVES 1"].addFlag(GLOBAL.HAZARD);
	rooms["GIANT LEAVES 1"].runOnEnter = jungleDeepEncounters;

	//82. Giant\nLeaves
	rooms["GIANT LEAVES 2"] = new RoomClass(this);
	rooms["GIANT LEAVES 2"].roomName = "GIANT\nLEAVES";
	rooms["GIANT LEAVES 2"].description = "You can see that the leaves to either side into you have been chewed away, probably by some native herbivore. Threading between them, the path rolls on to the north and to the south. The ground is mushy and soft with the amount of humidity, almost like mud, and the leaves grow in even thicker the farther south you go.";
	rooms["GIANT LEAVES 2"].planet = "PLANET: MHEN'GA";
	rooms["GIANT LEAVES 2"].system = "SYSTEM: ARA ARA";
	rooms["GIANT LEAVES 2"].northExit = "GIANT LEAVES 1";
	rooms["GIANT LEAVES 2"].southExit = "GIANT LEAVES 3";
	rooms["GIANT LEAVES 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["GIANT LEAVES 2"].addFlag(GLOBAL.HAZARD);
	rooms["GIANT LEAVES 2"].runOnEnter = jungleDeepEncounters;

	//83. Giant\nLeaves
	rooms["GIANT LEAVES 3"] = new RoomClass(this);
	rooms["GIANT LEAVES 3"].roomName = "GIANT\nLEAVES";
	rooms["GIANT LEAVES 3"].description = "There's nothing but leaves in every direction except north. Every other way is just a wall of torso-sized, shimmering fronds. They're even above you, glistening dully with collected moisture. It looks like a dead end, for now. You can either hang around here or go back through the dense plants to the north.";
	rooms["GIANT LEAVES 3"].planet = "PLANET: MHEN'GA";
	rooms["GIANT LEAVES 3"].system = "SYSTEM: ARA ARA";
	rooms["GIANT LEAVES 3"].northExit = "GIANT LEAVES 2";
	rooms["GIANT LEAVES 3"].addFlag(GLOBAL.OUTDOOR);
	rooms["GIANT LEAVES 3"].addFlag(GLOBAL.HAZARD);
	rooms["GIANT LEAVES 3"].runOnEnter = carlsEncounterStart;


	//84. Purple\nFlowers
	rooms["PURPLE FLOWERS 1"] = new RoomClass(this);
	rooms["PURPLE FLOWERS 1"].roomName = "PURPLE\nFLOWERS";
	rooms["PURPLE FLOWERS 1"].description = "You're on a path that winds its way through masses of purple blooms of all sizes and descriptions. Some are almost as big as an average man, others are so tiny you could fit two or three on a pinky finger. Insects swarm around them, content to harvest the flower's nectar instead of bothering you. You're grateful; some of them seem to be packing dangerous-looking stingers. You can go south and west along the path.";
	rooms["PURPLE FLOWERS 1"].planet = "PLANET: MHEN'GA";
	rooms["PURPLE FLOWERS 1"].system = "SYSTEM: ARA ARA";
	rooms["PURPLE FLOWERS 1"].westExit = "PURPLE FLOWERS 2";
	rooms["PURPLE FLOWERS 1"].southExit = "OVERGROWN ROCK 11";
	rooms["PURPLE FLOWERS 1"].addFlag(GLOBAL.OUTDOOR);
	rooms["PURPLE FLOWERS 1"].addFlag(GLOBAL.HAZARD);
	rooms["PURPLE FLOWERS 1"].runOnEnter = jungleDeepEncounters;

	//85. Purple\nFlowers
	rooms["PURPLE FLOWERS 2"] = new RoomClass(this);
	rooms["PURPLE FLOWERS 2"].roomName = "PURPLE\nFLOWERS";
	rooms["PURPLE FLOWERS 2"].description = "The air is almost sickeningly sweet here. Between the humid jungle air and the densely packed flowering plants, it feels almost as if there's no oxygen in here to breathe! Something - or someone - has kept the blooming plants from encroaching onto this trail. You're secretly thankful for whatever has kept the plants pruned back as you consider your options: east or west.";
	rooms["PURPLE FLOWERS 2"].planet = "PLANET: MHEN'GA";
	rooms["PURPLE FLOWERS 2"].system = "SYSTEM: ARA ARA";
	rooms["PURPLE FLOWERS 2"].westExit = "PURPLE FLOWERS 3";
	rooms["PURPLE FLOWERS 2"].eastExit = "PURPLE FLOWERS 1";
	rooms["PURPLE FLOWERS 2"].addFlag(GLOBAL.OUTDOOR);
	rooms["PURPLE FLOWERS 2"].addFlag(GLOBAL.HAZARD);
	rooms["PURPLE FLOWERS 2"].runOnEnter = jungleDeepEncounters;

	//86. Purple\nFlowers
	rooms["PURPLE FLOWERS 3"] = new RoomClass(this);
	rooms["PURPLE FLOWERS 3"].roomName = "PURPLE\nFLOWERS";
	rooms["PURPLE FLOWERS 3"].description = "Both sides of the trail are ringed in curtains of amethyst blooms. The violet flowers are so densely packed, and the air so humid and heavily scented, that you can barely breathe. Their smell would normally be pleasant, but there are just too many of them! The local bugs don't seem to mind; they're here in droves. You can pass through the buzzing insects to the east, deeper into the deep jungle, or go north to Esbeth.";
	rooms["PURPLE FLOWERS 3"].planet = "PLANET: MHEN'GA";
	rooms["PURPLE FLOWERS 3"].system = "SYSTEM: ARA ARA";
	rooms["PURPLE FLOWERS 3"].northExit = "PURPLE FLOWERS 4";
	rooms["PURPLE FLOWERS 3"].eastExit = "PURPLE FLOWERS 2";
	rooms["PURPLE FLOWERS 3"].addFlag(GLOBAL.OUTDOOR);
	rooms["PURPLE FLOWERS 3"].addFlag(GLOBAL.HAZARD);
	rooms["PURPLE FLOWERS 3"].runOnEnter = jungleDeepEncounters;

	//87. Purple\nFlowers
	rooms["PURPLE FLOWERS 4"] = new RoomClass(this);
	rooms["PURPLE FLOWERS 4"].roomName = "PURPLE\nFLOWERS";
	rooms["PURPLE FLOWERS 4"].description = "All around this gently winding woodpath, there are numerous flowers growing, all in bloom. It isn't too bad here. They tint the air pleasantly with their sweet aroma, and they haven't grown up enough to truly stop you from wandering off the trail if you wanted. However, the jungle changes to the south. The trees are taller, the canopy is thicker, the air is humid, and the flowers have overgrown everything except the path. You could back north, toward Esbeth, or south, into the <b>deep jungle</b>.";
	rooms["PURPLE FLOWERS 4"].planet = "PLANET: MHEN'GA";
	rooms["PURPLE FLOWERS 4"].system = "SYSTEM: ARA ARA";
	rooms["PURPLE FLOWERS 4"].northExit = "JUNGLE EDGE";
	rooms["PURPLE FLOWERS 4"].southExit = "PURPLE FLOWERS 3";
	rooms["PURPLE FLOWERS 4"].addFlag(GLOBAL.OUTDOOR);
	rooms["PURPLE FLOWERS 4"].addFlag(GLOBAL.HAZARD);
	rooms["PURPLE FLOWERS 4"].runOnEnter = jungleEncounterChances;
	
	//88. Scrapyard Maintenance - see scrapyard.as for more info!
	rooms["SCRAPYARD MAINTENANCE"] = new RoomClass(this);
	rooms["SCRAPYARD MAINTENANCE"].roomName = "SCRAPYARD\nMAINTENANCE";
	rooms["SCRAPYARD MAINTENANCE"].description = "";
	rooms["SCRAPYARD MAINTENANCE"].runOnEnter = scrapyardMaintenance;
	rooms["SCRAPYARD MAINTENANCE"].planet = "PLANET: MHEN'GA";
	rooms["SCRAPYARD MAINTENANCE"].system = "SYSTEM: ARA ARA";
	rooms["SCRAPYARD MAINTENANCE"].northExit = "SOUTH ESBETH 1";
	rooms["SCRAPYARD MAINTENANCE"].addFlag(GLOBAL.INDOOR);
	rooms["SCRAPYARD MAINTENANCE"].addFlag(GLOBAL.COMMERCE);

	//89. Penny's Office. See Penny.as for more info. - see scrapyard.as for more info!
	rooms["PENNY'S OFFICE"] = new RoomClass(this);
	rooms["PENNY'S OFFICE"].roomName = "U.G.C. PEACE-\nKEEPERS";
	rooms["PENNY'S OFFICE"].description = "This interior of this office is painted a cool, soothing blue, but even that can't hide the fact that nobody wants to have to spend much time here. The whole place looks stout and secure, even the doors and windows. The latter of which bear solid metal bars. A few doors occupy the far side of the room, but they're on the opposite side of a large, imposing desk. Computer equipment sits in a high pile, capped with an inactive light, the kind of which you'd expect to see on top of a hovercar or police cruiser.";
	rooms["PENNY'S OFFICE"].runOnEnter = pennysOffice;
	rooms["PENNY'S OFFICE"].planet = "PLANET: MHEN'GA";
	rooms["PENNY'S OFFICE"].system = "SYSTEM: ARA ARA";
	rooms["PENNY'S OFFICE"].southExit = "SOUTH ESBETH 3";
	rooms["PENNY'S OFFICE"].addFlag(GLOBAL.INDOOR);
	rooms["PENNY'S OFFICE"].addFlag(GLOBAL.NPC);

	//90. Kelly's Office - dat secretary
	rooms["KELLY'S OFFICE"] = new RoomClass(this);
	rooms["KELLY'S OFFICE"].roomName = "XENOGEN\nOFFICE";
	rooms["KELLY'S OFFICE"].description = "The inside of this office is decorated in the style of high class terrans, with wood grain floors and eggshell-toned walls illuminated by angled glowbulbs. A few potted plants sit around the periphery, obviously non-native. Well-conceiled vents in the ceilings feed a steady influx of purified, cooled air into this chamber to keep it comfortable. Across the room is an expansive desk equipped with everything you would expect to find on a classy secretary's desk: a terminal, old-fashioned writing utensils, holopaper, and even a small statue of a busty centaur. A monolithic white door sits framed in the western wall and a simpler one on the south, leading back outside.";
	rooms["KELLY'S OFFICE"].planet = "PLANET: MHEN'GA";
	rooms["KELLY'S OFFICE"].system = "SYSTEM: ARA ARA";
	rooms["KELLY'S OFFICE"].westExit = "JULIAN'S OFFICE";
	rooms["KELLY'S OFFICE"].southExit = "SOUTH ESBETH 2";
	rooms["KELLY'S OFFICE"].runOnEnter = kellysOfficeBonusFunction;
	rooms["KELLY'S OFFICE"].addFlag(GLOBAL.INDOOR);
	rooms["KELLY'S OFFICE"].addFlag(GLOBAL.NPC);

	//91. Julian's Office
	rooms["JULIAN'S OFFICE"] = new RoomClass(this);
	rooms["JULIAN'S OFFICE"].roomName = "SCIENTIST'S\nOFFICE";
	rooms["JULIAN'S OFFICE"].description = "The pure white, self-illuminating walls, floor, and ceiling provide a perfectly uniform distribution of luminance, lending the whole space a dream-like, heavenly quality. More strange than the lighting is the desk that curves through the northern half of this chamber. It's carved from one solid piece of translucent material that reflects the light into dazzling patterns of hypnotizing shine. The doorway to the east is the same featureless alabaster. It doesn't even have a doorknob, instead relying on proximity scanners and motorized retractors to slide it out of the way and into the wall. This place feels nothing like the rest of Esbeth.";
	rooms["JULIAN'S OFFICE"].runOnEnter = juliansOffice;
	rooms["JULIAN'S OFFICE"].planet = "PLANET: MHEN'GA";
	rooms["JULIAN'S OFFICE"].system = "SYSTEM: ARA ARA";
	rooms["JULIAN'S OFFICE"].eastExit = "KELLY'S OFFICE";
	rooms["JULIAN'S OFFICE"].addFlag(GLOBAL.INDOOR);
	rooms["JULIAN'S OFFICE"].addFlag(GLOBAL.NPC);
	
	//92. Crazy Carls
	rooms["CRAZY CARLS"] = new RoomClass(this);
	rooms["CRAZY CARLS"].roomName = "CRAZY\nCARL'S";
	rooms["CRAZY CARLS"].description = "";
	rooms["CRAZY CARLS"].runOnEnter = carlsShopDescription;
	rooms["CRAZY CARLS"].planet = "PLANET: MHEN'GA";
	rooms["CRAZY CARLS"].system = "SYSTEM: ARA ARA";
	rooms["CRAZY CARLS"].westExit = "WEST ESBETH 1";
	rooms["CRAZY CARLS"].addFlag(GLOBAL.INDOOR);
	rooms["CRAZY CARLS"].addFlag(GLOBAL.COMMERCE);

	//93. Medical Office
	rooms["ESBETH MEDICAL OFFICE"] = new RoomClass(this);
	rooms["ESBETH MEDICAL OFFICE"].roomName = "MEDICAL\nOFFICE";
	rooms["ESBETH MEDICAL OFFICE"].description = "The inside of the medical office is about as ramshackle and rundown as the outside of the shack. Standard manufactured alumiplate forms the walls, and the floor is made of the same bland, reflective stuff. Discarded wrappers and bits of clothing are scattered everywhere. There isn't even a trash receptacle anywhere to clean it up with. More importantly, a single bed is built into the east wall, covered in fresh fabric of some kind or another. The only piece of equipment that looks moderately well-maintained is a seemingly worn chair close to the bed.\n\nThe door to the west leads back to the streets of Esbeth.";
	rooms["ESBETH MEDICAL OFFICE"].runOnEnter = mhengaMedicalThingerBonusFunc;
	rooms["ESBETH MEDICAL OFFICE"].planet = "PLANET: MHEN'GA";
	rooms["ESBETH MEDICAL OFFICE"].system = "SYSTEM: ARA ARA";
	rooms["ESBETH MEDICAL OFFICE"].westExit = "EAST ESBETH";
	rooms["ESBETH MEDICAL OFFICE"].addFlag(GLOBAL.INDOOR);
	rooms["ESBETH MEDICAL OFFICE"].addFlag(GLOBAL.MEDICAL);

	// And this is why I want to kinda write a debugging area for game features :P
	//rooms["WEST ESBETH 1"].westExit = "DEBUG1";
	
	//#1 Ship Hangar
	rooms["201"] = new RoomClass(this);
	rooms["201"].roomName = "SHIP\nHANGAR";
	rooms["201"].description = "You're in the main dock of Novahome, the starship wreckage that currently serves as the raskvel home city. Several dozen of the little scaly creatures are running around, helping to load or offload other ships as they come and go from the Nova's dock. Most of them are heading east across the suitably massive hangar; you'll have to walk for some time to traverse the whole of it. Distantly, you can make out a service corridor next to a broken-down cargo-elevator. That'd be your ticket anywhere.";
	rooms["201"].runOnEnter = firstTimeOnTarkusBonus;
	rooms["201"].eastExit = "202";
	rooms["201"].planet = "PLANET: TARKUS";
	rooms["201"].system = "SYSTEM: REDACTED";
	rooms["201"].addFlag(GLOBAL.INDOOR);
	rooms["201"].addFlag(GLOBAL.SHIPHANGAR);

	//#2 Eastern Hangar
	rooms["202"] = new RoomClass(this);
	rooms["202"].roomName = "EASTERN\nHANGAR";
	rooms["202"].description = "This huge, open air hangar could easily hold whole squadrons of fighters or a dozen much larger ships. It's obvious that the craft that once called this place home have long-since departed, either scrapped or looted ages ago. In their place are ships of every shape and size, many obviously owned by planet-rushers, but there are a few cobbled-together junk-heaps standing on rusted landing struts that must belong to locals. Further to the west, you can make out the distinctive outline of your own ship. Most of the foot traffic is going north into an access tunnel; the nearby cargo elevator sits askew in its brackets, obviously nonfunctional.";
	rooms["202"].runOnEnter = undefined;
	rooms["202"].westExit = "201";
	rooms["202"].northExit = "203";
	rooms["202"].planet = "PLANET: TARKUS";
	rooms["202"].system = "SYSTEM: REDACTED";
	rooms["202"].addFlag(GLOBAL.INDOOR);

	//#3 UPPER STAIRWELL
	rooms["203"] = new RoomClass(this);
	rooms["203"].roomName = "UPPER\nSTAIRWELL";
	rooms["203"].description = "You're standing inside a wide corridor labelled as \"Starewell\" in painted script. The writing is as crude as it is misspelled. It isn't even accurate to this location; the corridor is a corkscrew-shaped ramp that twists down into the belly of the ship. There's no stairs anywhere that you can see. In spite of the terrible labeling, large numbers of the diminutive raskvel are scurrying up and down the passage, bearing all kinds of cargo. There are even some robots carrying tanks of fuel or driving small carts on their way. You can do down into the ship or south out into the hangar.";
	rooms["203"].runOnEnter = undefined;
	rooms["203"].southExit = "202";
	rooms["203"].outExit = "204";
	rooms["203"].outText = "Down";
	rooms["203"].planet = "PLANET: TARKUS";
	rooms["203"].system = "SYSTEM: REDACTED";
	rooms["203"].addFlag(GLOBAL.INDOOR);

	//#4 LOWER STAIRWELL
	rooms["204"] = new RoomClass(this);
	rooms["204"].roomName = "LOWER\nSTAIRWELL";
	rooms["204"].description = "There's a crudely written sign hanging above a spiralling ramp. It reads, \"Stairwill.\" You're pretty sure that whoever wrote it meant to write \"Stairwell,\" but even so, there isn't a stair to be seen. The smooth metal deckplates arc up around a central column in a huge ramp, leading to the Nova's middle decks where the hangar is located. An access corridor stretches away to the east. Faded texts indicate that it was once used for maintenance, but nowadays, it seems to be the main route between Novahome and the ship's hangar-turned-landing-pad.";
	rooms["204"].runOnEnter = undefined;
	rooms["204"].eastExit = "205";
	rooms["204"].inExit = "203";
	rooms["204"].inText = "Up";
	rooms["204"].planet = "PLANET: TARKUS";
	rooms["204"].system = "SYSTEM: REDACTED";
	rooms["204"].addFlag(GLOBAL.INDOOR);

	//#5 SHIP CORRIDOR
	rooms["205"] = new RoomClass(this);
	rooms["205"].roomName = "SHIP\nCORRIDOR";
	rooms["205"].description = "You're in the middle of a bend in a massive, maintenance access corridor. Once, long ago, it was used by work robots to move between various sections of the ship unseen. Now, with much of the ship in disrepair, it's the main thoroughfare between Novahome's central corridor and the hangar. The raskvel streaming by you seem excited to have all the offworlders around, stopping them to jabber questions almost nonstop. You narrowly escape the same fate as you go on your way. A ramp is visible to the west, and a the corridor stretches south towards Novahome proper, glowing faintly.";
	rooms["205"].runOnEnter = undefined;
	rooms["205"].westExit = "204";
	rooms["205"].southExit = "206";
	rooms["205"].planet = "PLANET: TARKUS";
	rooms["205"].system = "SYSTEM: REDACTED";
	rooms["205"].addFlag(GLOBAL.INDOOR);
	
	//#6 GLOWING CORRIDOR
	rooms["206"] = new RoomClass(this);
	rooms["206"].roomName = "GLOWING\nCORRIDOR";
	rooms["206"].description = "The power in this section of the ship is working, amazingly. Flicking incandescence bathes the ancient metal in amber-tinged light as busy little aliens trundle by, many carrying wrenches or multi-tools in one hand. North of here, the tunnel bends west. From the excited babble around you, you pick up that the hangar lies in that direction. The glowing corridor opens up into a huge east-west tunnel a little further south, the main thoroughfare of Novahome.";
	rooms["206"].runOnEnter = undefined;
	rooms["206"].northExit = "205";
	rooms["206"].southExit = "207";
	rooms["206"].planet = "PLANET: TARKUS";
	rooms["206"].system = "SYSTEM: REDACTED";
	rooms["206"].addFlag(GLOBAL.INDOOR);
	
	//#7 NOVAHOME
	rooms["207"] = new RoomClass(this);
	rooms["207"].roomName = "\nNOVAHOME";
	rooms["207"].description = "Here in the central tunnel of the Nova, the ceiling is at least forty feet tall, and the walls are wide enough to handle a football field. This vessel could easily match the biggest dreadnaughts in the terran navy pound for pound, but it's obvious from its unique internal structure that it was not a ship meant for war. Whatever its original purpose, the raskvel have turned it into their home. Metallic structures have sprung up on all sides, though the central part of the tunnel remains clear, leading east and west from here. A maintenance corridor to the north leads back toward the hangar.";
	rooms["207"].runOnEnter = undefined;
	rooms["207"].northExit = "206";
	rooms["207"].eastExit = "208";
	rooms["207"].westExit = "210";
	rooms["207"].planet = "PLANET: TARKUS";
	rooms["207"].system = "SYSTEM: REDACTED";
	rooms["207"].addFlag(GLOBAL.INDOOR);
	
	//#8 NOVAHOME
	rooms["208"] = new RoomClass(this);
	rooms["208"].roomName = "\nNOVAHOME";
	rooms["208"].description = "You are in the central tunnel of Novahome. Once a gigantic tunnel in the core of an ancient ship, it's now packed with houses and shops of all styles and sizes. On one side, there's shack made from stapled-together, rusted plates, while on the north lies a structure of all hard, angled starship parts. You can continue east or west from here, though a huge wall looms in the former direction before long.";
	rooms["208"].runOnEnter = undefined;
	rooms["208"].eastExit = "209";
	rooms["208"].westExit = "207";
	rooms["208"].planet = "PLANET: TARKUS";
	rooms["208"].system = "SYSTEM: REDACTED";
	rooms["208"].addFlag(GLOBAL.INDOOR);
	
	//#9 EAST NOVAHOME
	rooms["209"] = new RoomClass(this);
	rooms["209"].roomName = "EAST\nNOVAHOME";
	rooms["209"].description = "The Novahome tunnel comes to an abrupt end here, closed off by a wall of solid metal and rusted-shut hatch doors. You can spot places where repairs have been attempted, but none of the entrances seem to be in a working state. There's still plenty of buildings around, and a clear path leads west, back the way you came. A few open-air stalls are even set up here, where you suppose the property values are low.";
	rooms["209"].runOnEnter = undefined;
	rooms["209"].westExit = "208";
	rooms["209"].planet = "PLANET: TARKUS";
	rooms["209"].system = "SYSTEM: REDACTED";
	rooms["209"].addFlag(GLOBAL.INDOOR);
	
	//#10 NOVAHOME
	rooms["210"] = new RoomClass(this);
	rooms["210"].roomName = "\nNOVAHOME";
	rooms["210"].description = "You're almost smack in the middle of the tremendous passageway that runs through the center of this starship-turned-town. It would take at least fifteen minutes of walking to reach either end, and there's plenty of lateral room as well. Such a huge, central void would make this ship poorly suited for combat, but perhaps it served some other purpose back in its day. Now, it's being used as a place of residence and business, filled with raskvel of every color and variety. Shafts of outside light cut into the artificial brilliance of the tunnel's lamps to the west, indicating a way outside.";
	rooms["210"].runOnEnter = undefined;
	rooms["210"].eastExit = "207";
	rooms["210"].westExit = "211";
	rooms["210"].planet = "PLANET: TARKUS";
	rooms["210"].system = "SYSTEM: REDACTED";
	rooms["210"].addFlag(GLOBAL.INDOOR);
	
	//#11 NOVAHOME
	rooms["211"] = new RoomClass(this);
	rooms["211"].roomName = "\nNOVAHOME";
	rooms["211"].description = "The section of deck upon which you now stand is undoubtedly the busiest place in all of Novahome, either because of its central location or the access tunnel that opens up to the south, leading out onto Tarkus' surface. Before you can get to the windswept junkyards, you'll have to walk across a wobbling gangplank made of hundreds of welded-together metal plates. The aliens pay it no mind. You could also go to the east or west if you wanted to explore Novahome and the people within.";
	rooms["211"].runOnEnter = undefined;
	rooms["211"].eastExit = "210";
	rooms["211"].westExit = "212";
	rooms["211"].southExit = "215";
	rooms["211"].planet = "PLANET: TARKUS";
	rooms["211"].system = "SYSTEM: REDACTED";
	rooms["211"].addFlag(GLOBAL.INDOOR);
	
	//#12 NOVAHOME
	rooms["212"] = new RoomClass(this);
	rooms["212"].roomName = "\nNOVAHOME";
	rooms["212"].description = "You're definitely in the third of the ship closest to the fore. The tunnel is narrowing a little bit with every step to the west and broadening to the east. There's still plenty of room, though. Where you're standing, the immense chamber is at least eighty yards across and thirty-five feet tall - plenty of room for the short aliens to populate the area with a half-dozen buildings. A steady stream of raskvel are coming and going from inside a cavernous chamber to the north, clearly marked \"MESS\" in large, white letters. A pair of large windows on either side of the door are currently obstructed thanks to a pair of gigantic sandwich boards set up with some crudely-drawn caricatures of soups, sandwiches, and steaks beside prices in the local currency.";
	rooms["212"].runOnEnter = undefined;
	rooms["212"].eastExit = "211";
	rooms["212"].westExit = "213";
	rooms["212"].northExit = "301";
	rooms["212"].planet = "PLANET: TARKUS";
	rooms["212"].system = "SYSTEM: REDACTED";
	rooms["212"].addFlag(GLOBAL.INDOOR);
	
	//#13 NOVAHOME
	rooms["213"] = new RoomClass(this);
	rooms["213"].roomName = "\nNOVAHOME";
	rooms["213"].description = "The Nova's internal lighting flickers gently with its own asynchronous rhythm. To the east, the illumination is brighter and more steady. You estimate the ship's powerplants are located in the aft of the ship, near its engines, and the power conduits are in less than pristine condition. Further west, where the corridor ends, it's even dimmer, oddly reminiscent of just minutes after sunset.";
	rooms["213"].runOnEnter = undefined;
	rooms["213"].eastExit = "212";
	rooms["213"].westExit = "214";
	rooms["213"].planet = "PLANET: TARKUS";
	rooms["213"].system = "SYSTEM: REDACTED";
	rooms["213"].addFlag(GLOBAL.INDOOR);
	
	//#14 WEST NOVAHOME
	rooms["214"] = new RoomClass(this);
	rooms["214"].roomName = "WEST\nNOVAHOME";
	rooms["214"].description = "West Novahome is the located near the fore of the ship, where the power is weak and the lighting dim. You can see that the tunnel is narrower here than to the east as well. Even the western wall is in disrepair; it's covered in years of rust despite recent attempts to repair it. Even now, raskvel mechanics are toiling away alongside a nonfunctional hatch. Maybe someday they'll actually get this junker working again. The rest of Novahome stretches away to the east.";
	rooms["214"].runOnEnter = undefined;
	rooms["214"].eastExit = "213";
	rooms["214"].planet = "PLANET: TARKUS";
	rooms["214"].system = "SYSTEM: REDACTED";
	rooms["214"].addFlag(GLOBAL.INDOOR);

	//#15 MAKESHIFT GANGPLANK
	rooms["215"] = new RoomClass(this);
	rooms["215"].roomName = "MAKESHIFT\nGANGPLANK";
	rooms["215"].description = "With every step you take out onto this gangplank, you hear the telltale groans of metal straining. You can feel it flexing from the combined foot traffic of dozens of raskvel scavengers, droids, and other rushers as they move along the improvised structure. You'd be more worried if it wasn't so thick and the welds didn't look so solid. All you have to do is stay away from the edges and keep your balance. If you follow it up to the north, you'll find yourself back inside the Nova, now Novahome. Continuing south will deposit you on the surface of Tarkus.";
	rooms["215"].runOnEnter = undefined;
	rooms["215"].northExit = "211";
	rooms["215"].southExit = "216";
	rooms["215"].planet = "PLANET: TARKUS";
	rooms["215"].system = "SYSTEM: REDACTED";
	rooms["215"].addFlag(GLOBAL.OUTDOOR);
	
	//#16 RUST FIELDS
	rooms["216"] = new RoomClass(this);
	rooms["216"].roomName = "RUST\nFIELDS";
	rooms["216"].description = "You're standing the middle of the Tarkus' famed rust fields, so called thanks to the endless tracks of discarded, rusting machinery. Reddish flakes blow by your [pc.feet] on arid, metallic-tasting breezes, and the unmistakable tang of ancient pollution clings to your tongue with every breath. The place is a ruin of wasted potential and shattered dreams with the only visible sign of civilization rising up to the north: Novahome, a starship-turned native city.";
	rooms["216"].runOnEnter = rustPlainsEncounters;
	rooms["216"].northExit = "215";
	rooms["216"].westExit = "217";
	//rooms["216"].eastExit = "264";
	rooms["216"].southExit = "239";
	rooms["216"].planet = "PLANET: TARKUS";
	rooms["216"].system = "SYSTEM: REDACTED";
	rooms["216"].addFlag(GLOBAL.OUTDOOR);
	rooms["216"].addFlag(GLOBAL.HAZARD);
	
	//#17 RUST FIELDS
	rooms["217"] = new RoomClass(this);
	rooms["217"].roomName = "RUST\nFIELDS";
	rooms["217"].description = "Mounds of rusted machinery, ancient hulks, and plastics pile up around you into trackless dunes to the east, south, and west. Your every movement is chased by the soft crunching of metal flakes breaking under[pc.foot], and you're constantly spotting new oddities in the mess. They're all too damaged, rotten, or rusted to be useful. Here in the shadow of the Nova, it's likely the area has been picked clean of valuables.";
	rooms["217"].runOnEnter = rustPlainsEncounters;
	rooms["217"].westExit = "218";
	rooms["217"].eastExit = "216";
	rooms["217"].southExit = "238";
	rooms["217"].planet = "PLANET: TARKUS";
	rooms["217"].system = "SYSTEM: REDACTED";
	rooms["217"].addFlag(GLOBAL.OUTDOOR);
	rooms["217"].addFlag(GLOBAL.HAZARD);
	
	//#18 RUST FIELDS
	rooms["218"] = new RoomClass(this);
	rooms["218"].roomName = "RUST\nFIELDS";
	rooms["218"].description = "This close to the nova, you can't help but be impressed by its sheer size and durability. Even though the hull is heavily scaled with rust, the metal appears sound underneath the crusty, red-flecked layer. This is clearly a ship that was meant to last a very, very long time, and it has. All around, small, uneven dunes of dirt, dust, and rust rise up, hiding half-buried garbage from a variety of different races. You can walk across them to the east, west, and south. The Nova blocks passage to the north.";
	rooms["218"].runOnEnter = rustPlainsEncounters;
	rooms["218"].westExit = "219";
	rooms["218"].eastExit = "217";
	rooms["218"].southExit = "237";
	rooms["218"].planet = "PLANET: TARKUS";
	rooms["218"].system = "SYSTEM: REDACTED";
	rooms["218"].addFlag(GLOBAL.OUTDOOR);
	rooms["218"].addFlag(GLOBAL.HAZARD);

	//#19 RUST FIELDS
	rooms["219"] = new RoomClass(this);
	rooms["219"].roomName = "RUST\nFIELDS";
	rooms["219"].description = "An unstable pile of rusted ships and gutted battle tanks has been built up to the southwest, perhaps stacked there by natives sorting through the junk for still-usable treasures. Regardless, the massive mound is too sheer and rusted to climb. If you tried, you'd either tip it over onto yourself or just cut yourself on erosion-sharpened metal. You can traverse around it by going west or south, or you could head east in the shadow of the Nova.";
	rooms["219"].runOnEnter = rustPlainsEncounters;
	rooms["219"].westExit = "220";
	rooms["219"].eastExit = "218";
	rooms["219"].southExit = "236";
	rooms["219"].planet = "PLANET: TARKUS";
	rooms["219"].system = "SYSTEM: REDACTED";
	rooms["219"].addFlag(GLOBAL.OUTDOOR);
	rooms["219"].addFlag(GLOBAL.HAZARD);

	//#20 RUST CANYON
	rooms["220"] = new RoomClass(this);
	rooms["220"].roomName = "RUST\nCANYON";
	rooms["220"].description = "You're standing in the shadow of two different mounds of metal. To the northeast, the Nova towers above you. To the south and west, a huge pile of busted machinery has been stacked at least thirty feet into the air. Well-trod paths have been worn through the metallic dust between the two obstacles, leading north between the monolithic wreckages. You can also travel east to get out of this narrow, ferrous valley and out into the rust fields.";
	rooms["220"].runOnEnter = rustPlainsEncounters;
	rooms["220"].northExit = "221";
	rooms["220"].eastExit = "219";
	rooms["220"].planet = "PLANET: TARKUS";
	rooms["220"].system = "SYSTEM: REDACTED";
	rooms["220"].addFlag(GLOBAL.OUTDOOR);
	rooms["220"].addFlag(GLOBAL.HAZARD);
	
	//#21 RUST CANYON
	rooms["221"] = new RoomClass(this);
	rooms["221"].roomName = "RUST\nCANYON";
	rooms["221"].description = "The path between the Nova and the piled detritus is almost punishingly narrow here. You have to duck and weave to navigate around the angled prow of the colossal starship. The air is thick with dust and stagnant. There isn't even that much light down here; the piled metal hulks above are leaning against the much larger hull of the Nova, keeping this area perpetually dark. You can squeeze south or west from here. Both directions are far more open and well lit.";
	rooms["221"].runOnEnter = rustPlainsEncounters;
	rooms["221"].westExit = "222";
	rooms["221"].southExit = "220";
	rooms["221"].planet = "PLANET: TARKUS";
	rooms["221"].system = "SYSTEM: REDACTED";
	rooms["221"].addFlag(GLOBAL.OUTDOOR);
	rooms["221"].addFlag(GLOBAL.HAZARD);
	
	//#22 NEXT TO\nA JUNK PILE
	rooms["222"] = new RoomClass(this);
	rooms["222"].roomName = "NEXT TO\nA JUNK PILE";
	rooms["222"].description = "The air here smells vaguely of molten metal and pollution, stronger than many other places on Tarkus. The flakes of iron and other ferrous-based materials that make up the dusty soil are fine, so small you could almost mistake it for reddish-brown dirt if you didn't look to closely. You could head north around the prow of the Nova, east alongside a towering pile of junk, or west to the other side of the heap.";
	rooms["222"].runOnEnter = rustPlainsEncounters;
	rooms["222"].eastExit = "221";
	rooms["222"].northExit = "223";
	rooms["222"].westExit = "229";
	rooms["222"].planet = "PLANET: TARKUS";
	rooms["222"].system = "SYSTEM: REDACTED";
	rooms["222"].addFlag(GLOBAL.OUTDOOR);
	rooms["222"].addFlag(GLOBAL.HAZARD);
	
	//#23 NOVA\nPOINT
	rooms["223"] = new RoomClass(this);
	rooms["223"].roomName = "NOVA\nPOINT";
	rooms["223"].description = "You're standing directly under the nose of the Nova. Around you hang stalactites of ancient, corroded metal, testaments to corrosive forces that have seen fit to grace the ship with a beard worthy of father time. In spite of that, the hull looks thick enough to remain spaceworthy. It was obviously built to withstand an obscene amount of punishment. The ground here is relatively flat. Why, there's barely even any junk sticking up out of the \"soil!\" You can amble around similar terrain to the north and west. Heading south would put you on a path alongside a mound of twisted wreckage.";
	rooms["223"].runOnEnter = rustPlainsEncounters;
	rooms["223"].southExit = "222";
	rooms["223"].westExit = "228";
	rooms["223"].northExit = "224";
	rooms["223"].planet = "PLANET: TARKUS";
	rooms["223"].system = "SYSTEM: REDACTED";
	rooms["223"].addFlag(GLOBAL.OUTDOOR);
	rooms["223"].addFlag(GLOBAL.HAZARD);
	
	//#24 SHIPSIDE\nFIELD
	rooms["224"] = new RoomClass(this);
	rooms["224"].roomName = "SHIPSIDE\nFIELD";
	rooms["224"].description = "The surrounding expanse of flat, dusty fields is about as desolate as it gets, but even that hasn't stopped life, at least not yet. There's a few silvery plant stalks capped with iridescent blue leaves waving gently in the polluted breezes, somehow still here in spite of all this place has gone through. Stepping gingerly, you could go south or west from here. The Nova blocks passage to the east, and gray cliffs stretch up towards a cloudless sky to the north.";
	rooms["224"].runOnEnter = rustPlainsEncounters;
	rooms["224"].southExit = "223";
	rooms["224"].westExit = "225";
	rooms["224"].planet = "PLANET: TARKUS";
	rooms["224"].system = "SYSTEM: REDACTED";
	rooms["224"].addFlag(GLOBAL.OUTDOOR);
	rooms["224"].addFlag(GLOBAL.HAZARD);

	//#25 POLLUTED\nBEACH
	rooms["225"] = new RoomClass(this);
	rooms["225"].roomName = "POLLUTED\nBEACH";
	rooms["225"].description = "Gurgling faintly to the west, a sea of sludge, filth, and corruption laps against a oily beach. Here, the pollution is not quite so bad, but it's still thick enough to make the flaky \"sand\" clump together around your [pc.feet]. You can go west or south if you want to experience the pollution firsthand. Otherwise, the Nova's fore is visible a few minutes to the east, dangling reddish stalactites off its chin.";
	rooms["225"].runOnEnter = undefined;
	rooms["225"].southExit = "228";
	rooms["225"].westExit = "226";
	rooms["225"].eastExit = "224";
	rooms["225"].planet = "PLANET: TARKUS";
	rooms["225"].system = "SYSTEM: REDACTED";
	rooms["225"].addFlag(GLOBAL.OUTDOOR);
	rooms["225"].addFlag(GLOBAL.HAZARD);
	
	//#26 OIL SEA\nBEACH
	rooms["226"] = new RoomClass(this);
	rooms["226"].roomName = "OIL SEA\nBEACH";
	rooms["226"].description = "Here on the beach of the Oil Sea, you can't help but be aware of its stunning, unnatural beauty, a property lent to it by the glossy, metallic materials that comprise its slowly rolling waves. The smell is obscenely clingy. You can practically feel the tainted air sticking to the roof of your mouth, lending credence to the worrying thoughts that are assailing your mind, wondering how quickly this place is poisoning you. You can travel along the beach to the south, or you could head east away from the liquid's edge. A sheer cliff face blocks travel north, and you don't even want to think about trying to swim through the sludge to the west.";
	rooms["226"].runOnEnter = undefined;
	rooms["226"].southExit = "227";
	rooms["226"].eastExit = "225";
	rooms["226"].planet = "PLANET: TARKUS";
	rooms["226"].system = "SYSTEM: REDACTED";
	rooms["226"].addFlag(GLOBAL.OUTDOOR);
	rooms["226"].addFlag(GLOBAL.HAZARD);
	
	//#27 OIL SEA\nBEACH
	rooms["227"] = new RoomClass(this);
	rooms["227"].roomName = "OIL SEA\nBEACH";
	rooms["227"].description = "The silver-black surface of the Oil Sea rolls with slow, almost malevolent purpose just to the south and west. Some exotic material inside those murky swells must be much thicker than water; they never crest or foam like seawater does, and the frequency and amplitude of their motions seems subtly wrong to you. You can follow the beach north or east from here.";
	rooms["227"].runOnEnter = undefined;
	rooms["227"].northExit = "226";
	rooms["227"].eastExit = "228";
	rooms["227"].planet = "PLANET: TARKUS";
	rooms["227"].system = "SYSTEM: REDACTED";
	rooms["227"].addFlag(GLOBAL.OUTDOOR);
	rooms["227"].addFlag(GLOBAL.HAZARD);

	//#28 OIL SEA\nBEACH
	rooms["228"] = new RoomClass(this);
	rooms["228"].roomName = "OIL SEA\nBEACH";
	rooms["228"].description = "Here, at the tip of a small, oily inlet, the beach is even more blackened than elsewhere, perhaps due to collection sludge and sediment carried on the waves. You can actually spot pools of tar alongside silvery swirls and reddish quagmires, each of them as beautiful as they are deadly. It's hard not to feel like this whole planet is a spectacle of pollution and rot taken heaped upon itself until it's gained its own sense of obscene beauty. Surely there's something of value left on this planet - perhaps half-buried in the beach to the south or west. Maybe you could find something to the east, near the nose of the Nova or to the north under the cliffs.";
	rooms["228"].runOnEnter = undefined;
	rooms["228"].northExit = "225";
	rooms["228"].eastExit = "223";
	rooms["228"].southExit = "229";
	rooms["228"].westExit = "227";
	rooms["228"].planet = "PLANET: TARKUS";
	rooms["228"].system = "SYSTEM: REDACTED";
	rooms["228"].addFlag(GLOBAL.OUTDOOR);
	rooms["228"].addFlag(GLOBAL.HAZARD);

	//#29 OIL SEA\nBEACH
	rooms["229"] = new RoomClass(this);
	rooms["229"].roomName = "OIL SEA\nBEACH";
	rooms["229"].description = "You have to stop to yank your [pc.foot] out of the muck at least once in order to continue on. Like brackish swamp water, mercurial deposits of tar and filth have gathered in every depression on the crimson tinged beach. You tread carefully as you navigate the unearthly landscape, keeping a wary eye on the slow waves of pollution that lap at the rusted shores. The beach leads north and south. To the east, you can spot a trail around a twisted mountain of wrecked machinery.";
	rooms["229"].runOnEnter = undefined;
	rooms["229"].northExit = "228";
	rooms["229"].eastExit = "222";
	rooms["229"].southExit = "230";
	rooms["229"].planet = "PLANET: TARKUS";
	rooms["229"].system = "SYSTEM: REDACTED";
	rooms["229"].addFlag(GLOBAL.OUTDOOR);
	rooms["229"].addFlag(GLOBAL.HAZARD);
	
	//#30 OIL SEA\nBEACH
	rooms["230"] = new RoomClass(this);
	rooms["230"].roomName = "OIL SEA\nBEACH";
	rooms["230"].description = "This narrow strip of beach is made all the more precarious by a looming pile of wasted hulks and gutted spaceships. Someone went through all the trouble of scrounging them for useful parts and stacking the corroded leftovers into a pile, and whoever it was didn't even have the foresight to make it a little further away from the beach. You'll be forced to squeeze between the metal and the viscous waves numerous times if you want to go north or south, the only passable directions.";
	rooms["230"].runOnEnter = undefined;
	rooms["230"].northExit = "229";
	rooms["230"].southExit = "231";
	rooms["230"].planet = "PLANET: TARKUS";
	rooms["230"].system = "SYSTEM: REDACTED";
	rooms["230"].addFlag(GLOBAL.OUTDOOR);
	rooms["230"].addFlag(GLOBAL.HAZARD);

	//#31 OIL SEA\nBEACH
	rooms["231"] = new RoomClass(this);
	rooms["231"].roomName = "OIL SEA\nBEACH";
	rooms["231"].description = "A slurping sound announces the languid connection of a minor waterway to the beach. The sluggish water pours an irregular stream into the contaminated water, creating a chunky froth. Fat-like chunks of scum litter the sand, looking like greasy, gray-black stones, already blistering in the elements. The smell of baked crude oil saturates the air, making it hard to breathe. You pick your way carefully through the deposits, holding your breath as one crumbles with your passing, filling the air with visible fumes. The wall stacked junkers blocking off the northeast doesn't help either. You can follow the beach to the north and east.";
	rooms["231"].runOnEnter = undefined;
	rooms["231"].northExit = "230";
	rooms["231"].eastExit = "232";
	rooms["231"].planet = "PLANET: TARKUS";
	rooms["231"].system = "SYSTEM: REDACTED";
	rooms["231"].addFlag(GLOBAL.OUTDOOR);
	rooms["231"].addFlag(GLOBAL.HAZARD);

	//#32 OIL SEA\nBEACH
	rooms["232"] = new RoomClass(this);
	rooms["232"].roomName = "OIL SEA\nBEACH";
	rooms["232"].description = "The world around you gradually turns red. You rub your eyes, blaming fatigue for the sudden crimson shift. After blinking several times, you realize, no, the world has actually gone red. The sands are an unhealthy red-black, silicates tossed with metal particulates, and the entire stretch of water here looks uncomfortably like blood. Something massive is corroding off shore on this beach. You can see the mirror stillness of the \"water\" several yards out from where you stand, and try to shake off the impression of some oceanic titan bleeding to death. The beach curves around to the sound and west while twisting, creaking mass of forgotten wrecks has been stacked to the north and east, blocking your way.";
	rooms["232"].runOnEnter = undefined;
	rooms["232"].westExit = "231";
	rooms["232"].southExit = "233";
	rooms["232"].planet = "PLANET: TARKUS";
	rooms["232"].system = "SYSTEM: REDACTED";
	rooms["232"].addFlag(GLOBAL.OUTDOOR);
	rooms["232"].addFlag(GLOBAL.HAZARD);
	
	//#33 OIL SEA\nBEACH
	rooms["233"] = new RoomClass(this);
	rooms["233"].roomName = "OIL SEA\nBEACH";
	rooms["233"].description = "While your first and second step onto the sand here are stable enough, your third nearly pitches you forward. The sand beneath your [pc.feet] crumbles away, leaving a black, fluid-filled depression a foot deep. Fumes rising from the pool make you think of cheap, chemical batteries. You notice a black underlayer to the water here and realize that the beach is slowly dissolving. It’s safe enough for now, but from this point on, you carefully test each step before committing your weight to it. Towering over you, a picked-through collection of ancient battle tanks twists in the breeze. Someone took the time to cut out all the valuable components and pile the gutted remains together. You can follow the beach north and east.";
	rooms["233"].runOnEnter = undefined;
	rooms["233"].eastExit = "234";
	rooms["233"].northExit = "232";
	rooms["233"].planet = "PLANET: TARKUS";
	rooms["233"].system = "SYSTEM: REDACTED";
	rooms["233"].addFlag(GLOBAL.OUTDOOR);
	rooms["233"].addFlag(GLOBAL.HAZARD);
	
	//#34 OIL SEA\nBEACH
	rooms["234"] = new RoomClass(this);
	rooms["234"].roomName = "OIL SEA\nBEACH";
	rooms["234"].description = "The silence of your walk is interrupted by a chattering of high pitched tones. You glance around quickly, looking for the source of the ringing notes. You see nothing but the yellow-tinged fluid of the sea and this area's glittering sand. It is not until you begin walking that you hear the tinkling notes once more. You take a few more experimental steps forward, then look down, feeling awed and foolish at the same time. Chemical reactions here have crystallized the sand into miniscule, interlocking crystals. Each step snaps hundreds of them, resulting in the sound of scattered bells. The waterside twists away to the south and west, but you could head east into the rust fields if you wanted.";
	rooms["234"].runOnEnter = undefined;
	rooms["234"].eastExit = "235";
	rooms["234"].westExit = "233";
	rooms["234"].southExit = "245";
	rooms["234"].planet = "PLANET: TARKUS";
	rooms["234"].system = "SYSTEM: REDACTED";
	rooms["234"].addFlag(GLOBAL.OUTDOOR);
	rooms["234"].addFlag(GLOBAL.HAZARD);
	
	//#35 RUST\nPATH
	rooms["235"] = new RoomClass(this);
	rooms["235"].roomName = "RUST\nPATH";
	rooms["235"].description = "Sandwiched between two different, tall mounds of junk, is a single, winding path. Ominous creaks of strained, failing metal slip out of the rusted ships and machinery stacked to the west with every errant gust of bone-dry breeze. Across the way, arms, legs, and treads spread akimbo, sticking out of a mass of rusted torsos, dead eyes, and forgotten power plants. Someone took the time to gather them all together, perhaps so that they could dig through the rust elsewhere. Heading north will take you between the piles. You could also travel south alongside the eerie, robotic graveyard or west beside the ancient, stripped starships.";
	rooms["235"].runOnEnter = rustPlainsEncounters;
	rooms["235"].northExit = "236";
	rooms["235"].westExit = "234";
	rooms["235"].southExit = "244";
	rooms["235"].planet = "PLANET: TARKUS";
	rooms["235"].system = "SYSTEM: REDACTED";
	rooms["235"].addFlag(GLOBAL.OUTDOOR);
	rooms["235"].addFlag(GLOBAL.HAZARD);
	
	//#36 RUST\nPATH
	rooms["236"] = new RoomClass(this);
	rooms["236"].roomName = "RUST\nPATH";
	rooms["236"].description = "It is hard not to feel a little claustrophobic when you're standing in the shadows of two giants. It's even harder when those giants are two rusted skeletons of torn-up, corroded machinery. To the west, one pile all stripped-down tanks and the occasional ship or crane. To the east, the mound is comprised of thousands upon thousands of broken-down robots and androids, their valuable components removed, their bodies left to rot. You could follow the path south between them, north alongside the larger ship pile, or east beside those poor robots.";
	rooms["236"].runOnEnter = rustPlainsEncounters;
	rooms["236"].northExit = "219";
	rooms["236"].eastExit = "237";
	rooms["236"].southExit = "235";
	rooms["236"].planet = "PLANET: TARKUS";
	rooms["236"].system = "SYSTEM: REDACTED";
	rooms["236"].addFlag(GLOBAL.OUTDOOR);
	rooms["236"].addFlag(GLOBAL.HAZARD);
	
	//#37 NEXT TO\nA JUNK PILE
	//Busted-ass robots with all useful parts stripped
	rooms["237"] = new RoomClass(this);
	rooms["237"].roomName = "NEXT TO\nA JUNK PILE";
	rooms["237"].description = "The massive hulk a few yards away is the mass grave of robots. Metallic arms reach up from the mound, frozen in mid-grasp, entreating the scorched sky. The shadows they cast fall on your path, striping the road ahead with skeletal shadows. As you walk past, you catch a flicker of movement. You whip your head around, glaring at the still mound of shattered bots. Your eyes are playing tricks on you - it almost looks like the arms are reaching for you as soon as your back is turned. You can head east or west and stay beside the forgotten automatons, or you could go north into the rust fields beside the Nova.";
	rooms["237"].runOnEnter = rustPlainsEncounters;
	rooms["237"].northExit = "218";
	rooms["237"].westExit = "236";
	rooms["237"].eastExit = "238";
	rooms["237"].planet = "PLANET: TARKUS";
	rooms["237"].system = "SYSTEM: REDACTED";
	rooms["237"].addFlag(GLOBAL.OUTDOOR);
	rooms["237"].addFlag(GLOBAL.HAZARD);

	//#38 NEXT TO\nA JUNK PILE
	//Busted-ass robots with all useful parts stripped
	rooms["238"] = new RoomClass(this);
	rooms["238"].roomName = "NEXT TO\nA JUNK PILE";
	rooms["238"].description = "A blast of wind carries a storm of rusted flakes off the jumble of broken robots. You shield your eyes just in time as a it throws a bucket’s worth of rust over you. You taste blood and spit repeatedly, trying to get the oxidized metal out of your mouth. The wind rocks a precarious steel skeleton atop the pile, making it lurch forward repeatedly, almost as if it were silently laughing at your misfortune. You flip a rude gesture at the inanimate robot, then, feeling a bit silly, continue on your way. The automaton pile arcs away to the south and west. You can also head north into the rust fields near the Nova or east towards a different, smaller crashed ship.";
	rooms["238"].runOnEnter = rustPlainsEncounters;
	rooms["238"].northExit = "217";
	rooms["238"].westExit = "237";
	rooms["238"].eastExit = "239";
	rooms["238"].southExit = "241";
	rooms["238"].planet = "PLANET: TARKUS";
	rooms["238"].system = "SYSTEM: REDACTED";
	rooms["238"].addFlag(GLOBAL.OUTDOOR);
	rooms["238"].addFlag(GLOBAL.HAZARD);

	//#39 NEXT TO\nA CRASHED SHIP
	rooms["239"] = new RoomClass(this);
	rooms["239"].roomName = "NEXT TO A\nCRASHED SHIP";
	rooms["239"].description = "Like a giant, orange egg, a rust-covered, ancient craft of alien design sits half-buried in Tarkus' iron-scaled surface. It seems that even alien metals are no match for the corrosive properties of this planet's atmosphere. What few hatches you can see are either sealed shut or only cracked open enough to let the elements into the interior, their hinges or mechanisms long since seized into immobility. You could circle around it to the north or south. Alternatively, you could travel west towards a pile of shattered robots.";
	rooms["239"].runOnEnter = rustPlainsEncounters;
	rooms["239"].northExit = "216";
	rooms["239"].westExit = "238";
	rooms["239"].southExit = "240";
	rooms["239"].planet = "PLANET: TARKUS";
	rooms["239"].system = "SYSTEM: REDACTED";
	rooms["239"].addFlag(GLOBAL.OUTDOOR);
	rooms["239"].addFlag(GLOBAL.HAZARD);
	
	//#40 NEXT TO\nA CRASHED SHIP
	//SW corner of crashed ship
	rooms["240"] = new RoomClass(this);
	rooms["240"].roomName = "NEXT TO A\nCRASHED SHIP";
	rooms["240"].description = "Flakes of corroded metal break off the egg-shaped hull of a crashed, alien ship in the slow, dry breezes that occasionally gust by, scratching at you as they travel by. You brush a few off your shoulder as you regard the ancient machinery. It is clear that the ship has been here so long that it's never going to be spaceworthy again. Some of the hatches are hanging open, frozen by rust, while others are staunchly sealed shut, virtually welded in place by time. You can head north or east around the ship, or you could head west toward a pile of discarded robots. To the south, there's an open area of the rust fields.";
	rooms["240"].runOnEnter = rustPlainsEncounters;
	rooms["240"].northExit = "239";
	//rooms["240"].eastExit = "255";
	rooms["240"].westExit = "241";
	//rooms["240"].southExit = "253";
	rooms["240"].planet = "PLANET: TARKUS";
	rooms["240"].system = "SYSTEM: REDACTED";
	rooms["240"].addFlag(GLOBAL.OUTDOOR);
	rooms["240"].addFlag(GLOBAL.HAZARD);
	
	//#41 NEXT TO\nA JUNK PILE
	//E side of robot pile - fukkin robosexuals
	rooms["241"] = new RoomClass(this);
	rooms["241"].roomName = "NEXT TO\nA JUNK PILE";
	rooms["241"].description = "A skeletal-looking arm with titanium-composite bones covered in cake-on hydraulic fluid nearly whacks you in the head as you walk alongside a stockpile of forgotten, looted automatons. You look closer until you spot a pair of dead eyes looking back at you, and suitably unnerved, you decide it'd be best not to look too close. If you walk a little ways to the east, you could come up alongside a crusty-looking ship. You could also go north or south if you wanted to stay next to the creepy-looking junkpile.";
	rooms["241"].runOnEnter = rustPlainsEncounters;
	rooms["241"].northExit = "238";
	rooms["241"].eastExit = "240";
	rooms["241"].southExit = "242";
	rooms["241"].planet = "PLANET: TARKUS";
	rooms["241"].system = "SYSTEM: REDACTED";
	rooms["241"].addFlag(GLOBAL.OUTDOOR);
	rooms["241"].addFlag(GLOBAL.HAZARD);
	
	//#42 NEXT TO\nA JUNK PILE
	rooms["242"] = new RoomClass(this);
	rooms["242"].roomName = "NEXT TO\nA JUNK PILE";
	rooms["242"].description = "A load of batteries has calcified this portion of the robot pile. One of the android’s power cells, likely a cheap chemical battery of some kind, has leaked down from the top of the heap. The burst chest plate of this hulking android is a flower of torn metal, and the gout of calcification creates the impression of a mouth frozen mid-vomit. The corrosion has seared and blistered the metal of the robots below it, creating a frozen waterfall of white, corroded metal. Bars of bone-white residue pour cage-like rivulets down the cybernetic hecatomb. You give the silent cascade a sideways look as you hurry on your way.";
	rooms["242"].runOnEnter = rustPlainsEncounters;
	rooms["242"].northExit = "241";
	//rooms["242"].eastExit = "253";
	rooms["242"].westExit = "243";
	//rooms["242"].southExit = "251";
	rooms["242"].planet = "PLANET: TARKUS";
	rooms["242"].system = "SYSTEM: REDACTED";
	rooms["242"].addFlag(GLOBAL.OUTDOOR);
	rooms["242"].addFlag(GLOBAL.HAZARD);
	
	//#43 NEXT TO\nA JUNK PILE
	rooms["243"] = new RoomClass(this);
	rooms["243"].roomName = "NEXT TO\nA JUNK PILE";
	rooms["243"].description = "You gape at this section of the robot pile. Different parts have been loosely arranged into different heaps. You’re aware that it was likely someone sorting through the scrap, but the end result is extremely unnerving. A tangle of limbs, rusted pistons, snapped and bent bars, makes up the largest pile, a thicket of malformed pincers and robotic hands. Next to them is a heap of chassis of varying colors, smeared with the fungal encroach of rust and verdigris. Most unnerving, though, is the pile of heads next to the path. You know it to be act of a scrapper, but you just can’t shake the vaguely threatening feel of a stack of two dozen severed, metal heads pointed at you. The gathered robots continue to loom above you to the east and west. Distantly to the south, you can see huge, metal blades sticking up out of the metal-flaked earth.";
	rooms["243"].runOnEnter = rustPlainsEncounters;
	rooms["243"].eastExit = "242";
	rooms["243"].westExit = "244";
	//rooms["243"].southExit = "249";
	rooms["243"].planet = "PLANET: TARKUS";
	rooms["243"].system = "SYSTEM: REDACTED";
	rooms["243"].addFlag(GLOBAL.OUTDOOR);
	rooms["243"].addFlag(GLOBAL.HAZARD);
	
	//#44 NEXT TO\nA JUNK PILE
	rooms["244"] = new RoomClass(this);
	rooms["244"].roomName = "NEXT TO\nA JUNK PILE";
	rooms["244"].description = "Skeletal robots lay sprawled across the heap, interlocked in a still, rusted orgy. Most are of stripped of their chassis, their interiors bare to the elements. What heads remain stare blankly at corrosion-streaked sky, silent observers of the slow death of the planet. You know that they were simply piled here, but you can’t help but imagine some accidental meaning to the coiling of coolant tubes, the criss-crossing of arms, and the gape of silent jaw joints. Despite no real change in temperature, you shiver, resolving to walk faster past this section of the pile. If you head north or east, you'll stay alongside this artificial graveyard. You can also west from here, towards a polluted beach, or south, towards a monolithic, metal blade that sticks up out of the ground like a shiny, gigantic rib.";
	rooms["244"].runOnEnter = rustPlainsEncounters;
	rooms["244"].northExit = "235";
	rooms["244"].eastExit = "243";
	rooms["244"].westExit = "245";
	//rooms["244"].southExit = "248";
	rooms["244"].planet = "PLANET: TARKUS";
	rooms["244"].system = "SYSTEM: REDACTED";
	rooms["244"].addFlag(GLOBAL.OUTDOOR);
	rooms["244"].addFlag(GLOBAL.HAZARD);

	//#45 OIL SEA\nBEACH
	rooms["245"] = new RoomClass(this);
	rooms["245"].roomName = "OIL SEA\nBEACH";
	rooms["245"].description = "Are those... sharks? Standing on the oxidized sand, you squint at the oily-yellow sea. Several dark, triangular “fins” cut through the surface just offshore. It takes you a few moments of squinting and holding up your thumb to realize that they’re not moving, and the space of several yards to see that they’re simply shards of metal standing upright in the sea. The irregular pulse of the tide had made them seem as if they were moving. You scold yourself for the flight of fancy. Sharks in the water! What’s next? Mistaking that twist of wire for a pair of glasses?";
	rooms["245"].runOnEnter = undefined;
	rooms["245"].northExit = "234";
	rooms["245"].eastExit = "244";
	rooms["245"].southExit = "246";
	rooms["245"].planet = "PLANET: TARKUS";
	rooms["245"].system = "SYSTEM: REDACTED";
	rooms["245"].addFlag(GLOBAL.OUTDOOR);
	rooms["245"].addFlag(GLOBAL.HAZARD);
	
	//#46 OIL SEA\nBEACH
	rooms["246"] = new RoomClass(this);
	rooms["246"].roomName = "OIL SEA\nBEACH";
	rooms["246"].description = "An acrid cloud announces this stretch of beach before you really see it. The stuttered pulse of tidal actions slap a watery, greenish fluid against the ashy-white sand. With every half-formed push of the sea, the corrosive fluid pushes against the sand, burning away handfuls at a time, creating a noxious curtain of fumes at the sea’s edge. It smells like some ungodly blend of citrus, diesel, and urine. You nearly gag before you think to hold your breath. The beach runs north and south from here, but you can journey east into the rust fields as well.";
	rooms["246"].runOnEnter = undefined;
	rooms["246"].northExit = "245";
	//rooms["246"].eastExit = "248";
	rooms["246"].southExit = "247";
	rooms["246"].planet = "PLANET: TARKUS";
	rooms["246"].system = "SYSTEM: REDACTED";
	rooms["246"].addFlag(GLOBAL.OUTDOOR);
	rooms["246"].addFlag(GLOBAL.HAZARD);
	
	//#47 OIL SEA\nBEACH
	rooms["247"] = new RoomClass(this);
	rooms["247"].roomName = "OIL SEA\nBEACH";
	rooms["247"].description = "You are momentarily puzzled by the sound of a church bell. Could some alien culture have actually built a place of worship on this planet? And why in whoever’s name would they put it on this beach? A step around another battered hull exposes the mystery, but does nothing to dispel the oddity. As you watch, a cylindrical section of a ship, likely a spent fuel tank, rolls down a slope of metallic sand into the sea of chemicals. Rhythmically, the idiot tide shoves it back. The thick, syrupy waves push it up the slope far enough to clang the house-sized tank against a half-buried engine core, lodged in the shore. You wonder, in passing, how long this accidental bell has peeled, summoning it’s nonexistent flock. A blade of metal the size of a small skyscraper blocks travel to the south and east, leaving north the only passable direction.";
	rooms["247"].runOnEnter = undefined;
	rooms["247"].northExit = "246";
	rooms["247"].planet = "PLANET: TARKUS";
	rooms["247"].system = "SYSTEM: REDACTED";
	rooms["247"].addFlag(GLOBAL.OUTDOOR);
	rooms["247"].addFlag(GLOBAL.HAZARD);
	
	rooms["301"] = new RoomClass(this);
	rooms["301"].roomName = "THE\nMESS";
	rooms["301"].description = "The Mess sure lives up to its name. Once the ship's mess hall, a vessel of this size would have had a large cafeteria, and this place doesn't disappoint. Easily large enough to seat several hundred raskvel (and it currently is), the Mess is dimly lit and smoky, thanks to a combination of tall, hookah-like devices set up on several tables as well as a pillar of woodsmoke coming from the kitchen, which is exposed to the mess hall thanks to a busted-in bulkhead. Several raskvel chefs in cute white aprons are running around trying to tend to dozens of orders at once. The wait-staff are hurrying about, trying to deliver their goods as fast as they can. Strangely, most of the waiters and waitresses are human, each bearing the emblem of the Carver Catering Company - three C's across the breast and back of their sheer black uniforms.\n\nOn the far side of the Mess, there's another room sealed off from the restaurant by a pair of heavy doors and glass windows. By its dark interior and the off-worlders coming and going, you reckon that's the way to the local tavern.";
	rooms["301"].runOnEnter = messBonusFunction;
	rooms["301"].southExit = "212";
	rooms["301"].westExit = "302";
	rooms["301"].planet = "PLANET: TARKUS";
	rooms["301"].system = "SYSTEM: REDACTED";
	rooms["301"].addFlag(GLOBAL.INDOOR);
	rooms["301"].addFlag(GLOBAL.COMMERCE);

	rooms["302"] = new RoomClass(this);
	rooms["302"].roomName = "THE\nMESS";
	rooms["302"].description = "You're in the Mess's attached bar, thankfully separated from the deafening din of the open hall by a sturdy wall and thick windows. Though still smoky, the bar has a much calmer, friendlier atmosphere, and you're quickly able to find a seat thanks to a hostess at the door, wearing a strikingly skimpy version of the Carver uniform: a simple black vest, a thong, and fishnets to cover most of her body. The rest of the staff seems to be just as scantily clad, if not more so: a stage has been erected on one wall, where a topless ausar girl in nothing but her fishnets and a pair of pasties is currently singing to the accompaniment of an old-earth jazz band made up of raskvel in little tuxedos. The bar here is clearly catering to a higher-class clientele, and most of the people lounging around are fellow spacers and pioneers coming in for the planet rush, while others have the air of off-duty U.G.C. scouts and engineers. Almost everyone has a drink or a half-nude server in their lap, maybe both. This place is a weird mesh of retro earth and sensuality, that's for sure.";
	rooms["302"].runOnEnter = barBonusFunction;
	rooms["302"].eastExit = "301";
	rooms["302"].planet = "PLANET: TARKUS";
	rooms["302"].system = "SYSTEM: REDACTED";
	rooms["302"].addFlag(GLOBAL.INDOOR);
	rooms["302"].addFlag(GLOBAL.BAR);
	
	//DEBUG
	rooms["DEBUG1"] = new RoomClass(this);
	rooms["DEBUG1"].roomName = "\nDEBUG ROOM";
	rooms["DEBUG1"].description = "";
	rooms["DEBUG1"].planet = "PLANET: MHEN'GA";
	rooms["DEBUG1"].system = "SYSTEM: ARA ARA";
	rooms["DEBUG1"].eastExit = "WEST ESBETH 1";
	rooms["WEST ESBETH 1"].westExit = "DEBUG1";
	//rooms["DEBUG1"].southExit = "DEBUG2";
	//rooms["DEBUG1"].westExit = "DEBUG3";
	rooms["DEBUG1"].addFlag(GLOBAL.INDOOR);
	rooms["DEBUG1"].runOnEnter = debugMenus;
}

/*
Fern, Lichens, and Ironwoods:
Man/FemZil, Cuntsnake

Dense Orange, Dark, Narrow Path
Naleen, Cuntsnake, Venus Pitchers

Deep Jungle Biome:
Naleen, Venus Pitchers, Elder Venus Pitchers, Zil
*/