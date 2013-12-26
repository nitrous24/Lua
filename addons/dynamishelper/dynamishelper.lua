   --Copyright (c) 2013, Krizz
--All rights reserved.

--Redistribution and use in source and binary forms, with or without
--modification, are permitted provided that the following conditions are met:

--	* Redistributions of source code must retain the above copyright
--  	notice, this list of conditions and the following disclaimer.
--	* Redistributions in binary form must reproduce the above copyright
--  	notice, this list of conditions and the following disclaimer in the
--  	documentation and/or other materials provided with the distribution.
--	* Neither the name of Dynamis Helper nor the
--  	names of its contributors may be used to endorse or promote products
--  	derived from this software without specific prior written permission.

--THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
--ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
--WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
--DISCLAIMED. IN NO EVENT SHALL KRIZZ BE LIABLE FOR ANY
--DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
--(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
--LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
--ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
--(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
--SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--Features
-- Stagger timer
-- Currency tracker
-- Proc identifier
-- Lot currency

_addon.name = 'DynamisHelper'
_addon.author = 'Krizz'
_addon.commands = {'DynamisHelper','dh'}
_addon.version = '1.0.1.0'

local config = require 'config'

-- Variables
staggers = T{}
staggers['morning'] = T{}
staggers['morning']['ja'] = {"Kindred Thief", "Kindred Beastmaster", "Kindred Monk", "Kindred Ninja", "Kindred Ranger", "Hydra Thief", "Hydra Beastmaster", "Hydra Monk", "Hydra Ninja", "Hydra Ranger", "Nightmare Bugard", "Nightmare Crawler", "Nightmare Fly", "Nightmare Flytrap", "Nightmare Funguar", "Nightmare Gaylas", "Nightmare Hornet", "Nightmare Kraken", "Nightmare Raven", "Nightmare Roc", "Nightmare Uragnite", "Vanguard Ambusher", "Vanguard Assassin", "Vanguard Beasttender", "Vanguard Footsoldier", "Vanguard Gutslasher", "Vanguard Hitman", "Vanguard Impaler", "Vanguard Kusa", "Vanguard Liberator", "Vanguard Mason", "Vanguard Militant", "Vanguard Neckchopper", "Vanguard Ogresoother", "Vanguard Pathfinder", "Vanguard Pitfighter", "Vanguard Purloiner", "Vanguard Salvager","Vanguard Sentinel","Vanguard Trooper","Vanguard Welldigger"}
staggers['morning']['magic'] = {"Kindred White Mage", "Kindred Bard", "Kindred Summoner", "Kindred Black Mage", "Kindred Red Mage", "Hydra White Mage", "Hydra Bard", "Hydra Summoner", "Hydra Black Mage", "Hydra Red Mage", "Nightmare Bunny", "Nightmare Cluster", "Nightmare Eft", "Nightmare Hippogryph", "Nightmare Makara", "Nightmare Mandragora", "Nightmare Sabotender", "Nightmare Sheep", "Nightmare Snoll", "Nightmare Stirge", "Nightmare Weapon", "Vanguard Alchemist", "Vanguard Amputator", "Vanguard Bugler", "Vanguard Chanter", "Vanguard Constable", "Vanguard Dollmaster", "Vanguard Enchanter", "Vanguard Maestro", "Vanguard Mesmerizer", "Vanguard Minstrel", "Vanguard Necromancer", "Vanguard Oracle", "Vanguard Prelate", "Vanguard Priest", "Vanguard Protector", "Vanguard Shaman", "Vanguard Thaumaturge", "Vanguard Undertaker", "Vanguard Vexer", "Vanguard Visionary"}
staggers['morning']['ws'] = {"Kindred Paladin", "Kindred Warrior", "Kindred Samurai", "Kindred Dragoon", "Kindred Dark Knight", "Hydra Paladin", "Hydra Warrior", "Hydra Samurai", "Hydra Dragoon", "Hydra Dark Knight", "Nightmare Crab", "Nightmare Dhalmel", "Nightmare Diremite", "Nightmare Goobbue", "Nightmare Leech", "Nightmare Manticore", "Nightmare Raptor", "Nightmare Scorpion", "Nightmare Tiger", "Nightmare Treant", "Nightmare Worm", "Vanguard Armorer", "Vanguard Backstabber", "Vanguard Defender", "Vanguard Dragontamer", "Vanguard Drakekeeper", "Vanguard Exemplar", "Vanguard Grappler", "Vanguard Hatamoto", "Vanguard Hawker", "Vanguard Inciter", "Vanguard Partisan", "Vanguard Persecutor", "Vanguard Pillager", "Vanguard Predator", "Vanguard Ronin", "Vanguard Skirmisher", "Vanguard Smithy", "Vanguard Tinkerer", "Vanguard Vigilante", "Vanguard Vindicator"}
staggers['morning']['random'] = {"Ascetox Ratgums", "Be'Zhe Keeprazer", "Bhuu Wjato the Firepool", "Bordox Kittyback", "Brewnix Bittypupils", "Caa Xaza the Madpiercer", "Cobraclaw Buchzvotch", "De'Bho Pyrohand", "Deathcaller Bidfbid", "Drakefeast Wubmfub", "Draklix Scalecrust", "Droprix Granitepalms", "Elvaanlopper Grokdok", "Foo Peku the Bloodcloak", "Ga'Fho Venomtouch", "Galkarider Retzpratz", "Gibberox Pimplebeak", "Go'Tyo Magenapper", "Gu'Khu Dukesniper", "Gu'Nha Wallstormer", "Guu Waji the Preacher", "Heavymail Djidzbad", "Hee Mida the Meticulous", "Humegutter Adzjbadj", "Jeunoraider Gepkzip", "Ji'Fhu Infiltrator", "Ji'Khu Towercleaver", "Knii Hoqo the Bisector", "Koo Saxu the Everfast", "Kuu Xuka the Nimble", "Lockbuster Zapdjipp", "Maa Zaua the Wyrmkeeper", "Mi'Rhe Whisperblade", "Mithraslaver Debhabob", "Moltenox Stubthumbs", "Morblox Chubbychin", "Mu'Gha Legionkiller", "Na'Hya Floodmaker", "Nee Huxa the Judgmental", "Nu'Bhi Spiraleye", "Puu Timu the Phantasmal", "Routsix Rubbertendon", "Ruffbix Jumbolobes", "Ryy Qihi the Idolrobber", "Shisox Widebrow", "Skinmask Ugghfogg", "Slinkix Trufflesniff", "So'Gho Adderhandler", "So'Zho Metalbender", "Soo Jopo the Fiendking", "Spinalsucker Galflmall", "Swypestix Tigershins", "Ta'Hyu Gallanthunter", "Taruroaster Biggsjig", "Tocktix Thinlids", "Ultrasonic Zeknajak", "Whistrix Toadthroat", "Wraithdancer Gidbnod", "Xaa Chau the Roctalon", "Xhoo Fuza the Sublime", "Angra Mainyu", "Dagourmarche", "Goublefaupe", "Mildaunegeux", "Quiebitiel", "Velosareon", "Taquede", "Pignonpausard", "Hitaume", "Cavanneche", "Arch Angra Mainyu", "Count Vine", "Count Zaebos", "Duke Berith", "Duke Gomory", "Duke Scox", "King Zagan", "Marquis Andras", "Marquis Cimeries", "Marquis Decarabia", "Marquis Gamygyn", "Marquis Nebiros", "Marquis Orias", "Marquis Sabnak", "Prince Seere", "Count Raum", "Dynamis Lord", "Duke Haures", "Marquis Caim", "Baron Avnas", "Count Haagenti", "Arch Dynamis Lord", "Aitvaras", "Alklha", "Antaeus", "Anvilix Sootwrists", "Apocalyptic Beast", "Arch Antaeus", "Arch Apocalyptic Beast", "Arch Christelle", "Arch Goblin Golem", "Arch Gu'Dha Effigy", "Arch Overlord Tombstone", "Arch Tzee Xicu Idol", "Baa Dava the Bibliophage", "Bandrix Rockjaw", "Barong", "Battlechoir Gitchfotch", "Bladeburner Rokgevok", "Blazox Boneybod", "Bloodfist Voshgrosh", "Bootrix Jaggedelbow", "Bu'Bho Truesteel", "Buffrix Eargone", "Cirrate Christelle", "Cloktix Longnail", "Diabolos Club", "Diabolos Diamond", "Diabolos Heart", "Diabolos Letum", "Diabolos Nox", "Diabolos Somnus", "Diabolos Spade", "Diabolos Umbra", "Distilix Stickytoes", "Doo Peku the Fleetfoot", "Elixmix Hooknose", "Elvaansticker Bxafraff", "Eremix Snottynostril", "Fairy Ring", "Feralox Honeylips", "Feralox's Slime", "Flamecaller Zoeqdoq", "Fuu Tzapo the Blessed", "Gabblox Magpietongue", "Gi'Bhe Fleshfeaster", "Gi'Pha Manameister", "Goblin Golem", "Gosspix Blabblerlips", "Gu'Dha Effigy", "Gu'Nhi Noondozer", "Haa Pevi the Stentorian", "Hamfist Gukhbuk", "Hermitrix Toothrot", "Humnox Drumbelly", "Jabbrox Grannyguise", "Jabkix Pigeonpec", "Karashix Swollenskull", "Kikklix Longlegs", "Ko'Dho Cannonball", "Koo Rahi the Levinblade", "Loo Hepe the Eyepiercer", "Lost Aitvaras", "Lost Alklha", "Lost Barong", "Lost Fairy Ring", "Lost Nant'ina", "Lost Scolopendra", "Lost Stcemqestcint", "Lost Stihi", "Lost Stringes", "Lost Suttung", "Lurklox Dhalmelneck", "Lyncean Juwgneg", "Maa Febi the Steadfast", "Mobpix Mucousmouth", "Morgmox Moldnoggin", "Mortilox Wartpaws", "Muu Febi the Steadfast", "Naa Yixo the Stillrage", "Nant'ina", "Nightmare Taurus", "Overlord's Tombstone", "Prowlox Barrelbelly", "Quicktrix Hexhands", "Qu'Pho Bloodspiller", "Ra'Gho Darkfount", "Ra'Gho's Avatar", "Reapertongue Gadgquok", "Ree Nata the Melomanic", "Rutrix Hamgams", "Scolopendra", "Scourquix Scaleskin", "Scourquix's Wyvern", "Scruffix Shaggychest", "Shamblix Rottenheart", "Slystix Megapeepers", "Smeltix Thickhide", "Snypestix Eaglebeak", "Soulsender Fugbrag", "Sparkspox Sweatbrow", "Spellspear Djokvukk", "Stcemqestcint", "Steelshank Kratzvatz", "Stihi", "Stringes", "Suttung", "Tee Zaksa the Ceaseless", "Te'Zha Ironclad", "Ticktox Beadyeyes", "Trailblix Goatmug", "Tufflix Loglimbs", "", "Tymexox Ninefingers", "Tzee Xicu Idol", "Va'Rhu Bodysnatcher", "Va'Zhe Pummelsong", "Voidstreaker Butchnotch", "Wasabix Callusdigit", "Wilywox Tenderpalm", "Woodnix Shrillwhistle", "Wuu Qoho the Razorclaw", "Wyrmgnasher Bjakdek", "Wyrmwix Snakespecs", "Xoo Kaza the Solemn", "Xuu Bhoqa the Enigma", "Ze'Vho Fallsplitter", "Zo'Pha Forgesoul"}
staggers['morning']['none'] = {"Animated Claymore", "Animated Dagger", "Animated Great Axe", "Animated Gun", "Animated Hammer", "Animated Horn", "Animated Kunai", "Animated Knuckles", "Animated Longbow", "Animated Longsword", "Animated Scythe", "Animated Shield", "Animated Spear", "Animated Staff", "Animated Tabar", "Animated Tachi", "Fire Pukis", "Petro Pukis", "Poison Pukis", "Wind Pukis", "Kindred's Vouivre", "Kindred's Wyvern", "Kindred's Avatar", "Vanguard Eye", "Prototype Eye", "Nebiros's Avatar", "Haagenti's Avatar", "Caim's Vouivre", "Andras's Vouivre", "Adamantking Effigy", "Avatar Icon", "Goblin Replica", "Serjeant Tombstone", "Zagan's Wyvern", "Hydra's Hound", "Hydra's Wyvern", "Hydra's Avatar", "Rearguard Eye", "Adamantking Effigy", "Adamantking Image", "Avatar Icon", "Avatar Idol", "Effigy Prototype", "Goblin Replica", "Goblin Statue", "Icon Prototype", "Manifest Icon", "Manifest Icon", "Prototype Eye", "Serjeant Tombstone", "Statue Prototype", "Tombstone Prototype", "Vanguard Eye", "Vanguard's Avatar", "Vanguard's Avatar", "Vanguard's Avatar", "Vanguard's Avatar", "Vanguard's Crow", "Vanguard's Hecteyes", "Vanguard's Scorpion", "Vanguard's Slime", "Vanguard's Wyvern", "Vanguard's Wyvern", "Vanguard's Wyvern", "Vanguard's Wyvern", "Warchief Tombstone"}
staggers['day'] = T{}
staggers['day']['ja'] = {"Kindred Thief", "Kindred Beastmaster", "Kindred Monk", "Kindred Ninja", "Kindred Ranger", "Hydra Thief", "Hydra Beastmaster", "Hydra Monk", "Hydra Ninja", "Hydra Ranger", "Nightmare Bunny", "Nightmare Cluster", "Nightmare Eft", "Nightmare Hippogryph", "Nightmare Makara", "Nightmare Mandragora", "Nightmare Sabotender", "Nightmare Sheep", "Nightmare Snoll", "Nightmare Stirge", "Nightmare Weapon", "Vanguard Alchemist", "Vanguard Amputator", "Vanguard Bugler", "Vanguard Chanter", "Vanguard Constable", "Vanguard Dollmaster", "Vanguard Enchanter", "Vanguard Maestro", "Vanguard Mesmerizer", "Vanguard Minstrel", "Vanguard Necromancer", "Vanguard Oracle", "Vanguard Prelate", "Vanguard Priest", "Vanguard Protector", "Vanguard Shaman", "Vanguard Thaumaturge", "Vanguard Undertaker", "Vanguard Vexer", "Vanguard Visionary"}
staggers['day']['magic'] = {"Kindred White Mage", "Kindred Bard", "Kindred Summoner", "Kindred Black Mage", "Kindred Red Mage", "Hydra White Mage", "Hydra Bard", "Hydra Summoner", "Hydra Black Mage", "Hydra Red Mage", "Nightmare Crab", "Nightmare Dhalmel", "Nightmare Diremite", "Nightmare Goobbue", "Nightmare Leech", "Nightmare Manticore", "Nightmare Raptor", "Nightmare Scorpion", "Nightmare Tiger", "Nightmare Treant", "Nightmare Worm", "Vanguard Armorer", "Vanguard Backstabber", "Vanguard Defender", "Vanguard Dragontamer", "Vanguard Drakekeeper", "Vanguard Exemplar", "Vanguard Grappler", "Vanguard Hatamoto", "Vanguard Hawker", "Vanguard Inciter", "Vanguard Partisan", "Vanguard Persecutor", "Vanguard Pillager", "Vanguard Predator", "Vanguard Ronin", "Vanguard Skirmisher", "Vanguard Smithy", "Vanguard Tinkerer", "Vanguard Vigilante", "Vanguard Vindicator"}
staggers['day']['ws'] = {"Kindred Paladin", "Kindred Warrior", "Kindred Samurai", "Kindred Dragoon", "Kindred Dark Knight", "Hydra Paladin", "Hydra Warrior", "Hydra Samurai", "Hydra Dragoon", "Hydra Dark Knight", "Nightmare Bugard", "Nightmare Crawler", "Nightmare Fly", "Nightmare Flytrap", "Nightmare Funguar", "Nightmare Gaylas", "Nightmare Hornet", "Nightmare Kraken", "Nightmare Raven", "Nightmare Roc", "Nightmare Uragnite", "Vanguard Ambusher", "Vanguard Assassin", "Vanguard Beasttender", "Vanguard Footsoldier", "Vanguard Gutslasher", "Vanguard Hitman", "Vanguard Impaler", "Vanguard Kusa", "Vanguard Liberator", "Vanguard Mason", "Vanguard Militant", "Vanguard Neckchopper", "Vanguard Ogresoother", "Vanguard Pathfinder", "Vanguard Pitfighter", "Vanguard Purloiner", "Vanguard Salvager", "Vanguard Sentinel", "Vanguard Trooper", "Vanguard Welldigger"}
staggers['day']['random'] = {"Ascetox Ratgums", "Be'Zhe Keeprazer", "Bhuu Wjato the Firepool", "Bordox Kittyback", "Brewnix Bittypupils", "Caa Xaza the Madpiercer", "Cobraclaw Buchzvotch", "De'Bho Pyrohand", "Deathcaller Bidfbid", "Drakefeast Wubmfub", "Draklix Scalecrust", "Droprix Granitepalms", "Elvaanlopper Grokdok", "Foo Peku the Bloodcloak", "Ga'Fho Venomtouch", "Galkarider Retzpratz", "Gibberox Pimplebeak", "Go'Tyo Magenapper", "Gu'Khu Dukesniper", "Gu'Nha Wallstormer", "Guu Waji the Preacher", "Heavymail Djidzbad", "Hee Mida the Meticulous", "Humegutter Adzjbadj", "Jeunoraider Gepkzip", "Ji'Fhu Infiltrator", "Ji'Khu Towercleaver", "Knii Hoqo the Bisector", "Koo Saxu the Everfast", "Kuu Xuka the Nimble", "Lockbuster Zapdjipp", "Maa Zaua the Wyrmkeeper", "Mi'Rhe Whisperblade", "Mithraslaver Debhabob", "Moltenox Stubthumbs", "Morblox Chubbychin", "Mu'Gha Legionkiller", "Na'Hya Floodmaker", "Nee Huxa the Judgmental", "Nu'Bhi Spiraleye", "Puu Timu the Phantasmal", "Routsix Rubbertendon", "Ruffbix Jumbolobes", "Ryy Qihi the Idolrobber", "Shisox Widebrow", "Skinmask Ugghfogg", "Slinkix Trufflesniff", "So'Gho Adderhandler", "So'Zho Metalbender", "Soo Jopo the Fiendking", "Spinalsucker Galflmall", "Swypestix Tigershins", "Ta'Hyu Gallanthunter", "Taruroaster Biggsjig", "Tocktix Thinlids", "Ultrasonic Zeknajak", "Whistrix Toadthroat", "Wraithdancer Gidbnod", "Xaa Chau the Roctalon", "Xhoo Fuza the Sublime", "Angra Mainyu", "Dagourmarche", "Goublefaupe", "Mildaunegeux", "Quiebitiel", "Velosareon", "Taquede", "Pignonpausard", "Hitaume", "Cavanneche", "Arch Angra Mainyu", "Count Vine", "Count Zaebos", "Duke Berith", "Duke Gomory", "Duke Scox", "King Zagan", "Marquis Andras", "Marquis Cimeries", "Marquis Decarabia", "Marquis Gamygyn", "Marquis Nebiros", "Marquis Orias", "Marquis Sabnak", "Prince Seere", "Count Raum", "Dynamis Lord", "Duke Haures", "Marquis Caim", "Baron Avnas", "Count Haagenti", "Arch Dynamis Lord", "Aitvaras", "Alklha", "Antaeus", "Anvilix Sootwrists", "Apocalyptic Beast", "Arch Antaeus", "Arch Apocalyptic Beast", "Arch Christelle", "Arch Goblin Golem", "Arch Gu'Dha Effigy", "Arch Overlord Tombstone", "Arch Tzee Xicu Idol", "Baa Dava the Bibliophage", "Bandrix Rockjaw", "Barong", "Battlechoir Gitchfotch", "Bladeburner Rokgevok", "Blazox Boneybod", "Bloodfist Voshgrosh", "Bootrix Jaggedelbow", "Bu'Bho Truesteel", "Buffrix Eargone", "Cirrate Christelle", "Cloktix Longnail", "Diabolos Club", "Diabolos Diamond", "Diabolos Heart", "Diabolos Letum", "Diabolos Nox", "Diabolos Somnus", "Diabolos Spade", "Diabolos Umbra", "Distilix Stickytoes", "Doo Peku the Fleetfoot", "Elixmix Hooknose", "Elvaansticker Bxafraff", "Eremix Snottynostril", "Fairy Ring", "Feralox Honeylips", "Feralox's Slime", "Flamecaller Zoeqdoq", "Fuu Tzapo the Blessed", "Gabblox Magpietongue", "Gi'Bhe Fleshfeaster", "Gi'Pha Manameister", "Goblin Golem", "Gosspix Blabblerlips", "Gu'Dha Effigy", "Gu'Nhi Noondozer", "Haa Pevi the Stentorian", "Hamfist Gukhbuk", "Hermitrix Toothrot", "Humnox Drumbelly", "Jabbrox Grannyguise", "Jabkix Pigeonpec", "Karashix Swollenskull", "Kikklix Longlegs", "Ko'Dho Cannonball", "Koo Rahi the Levinblade", "Loo Hepe the Eyepiercer", "Lost Aitvaras", "Lost Alklha", "Lost Barong", "Lost Fairy Ring", "Lost Nant'ina", "Lost Scolopendra", "Lost Stcemqestcint", "Lost Stihi", "Lost Stringes", "Lost Suttung", "Lurklox Dhalmelneck", "Lyncean Juwgneg", "Maa Febi the Steadfast", "Mobpix Mucousmouth", "Morgmox Moldnoggin", "Mortilox Wartpaws", "Muu Febi the Steadfast", "Naa Yixo the Stillrage", "Nant'ina", "Nightmare Taurus", "Overlord's Tombstone", "Prowlox Barrelbelly", "Quicktrix Hexhands", "Qu'Pho Bloodspiller", "Ra'Gho Darkfount", "Ra'Gho's Avatar", "Reapertongue Gadgquok", "Ree Nata the Melomanic", "Rutrix Hamgams", "Scolopendra", "Scourquix Scaleskin", "Scourquix's Wyvern", "Scruffix Shaggychest", "Shamblix Rottenheart", "Slystix Megapeepers", "Smeltix Thickhide", "Snypestix Eaglebeak", "Soulsender Fugbrag", "Sparkspox Sweatbrow", "Spellspear Djokvukk", "Stcemqestcint", "Steelshank Kratzvatz", "Stihi", "Stringes", "Suttung", "Tee Zaksa the Ceaseless", "Te'Zha Ironclad", "Ticktox Beadyeyes", "Trailblix Goatmug", "Tufflix Loglimbs", "", "Tymexox Ninefingers", "Tzee Xicu Idol", "Va'Rhu Bodysnatcher", "Va'Zhe Pummelsong", "Voidstreaker Butchnotch", "Wasabix Callusdigit", "Wilywox Tenderpalm", "Woodnix Shrillwhistle", "Wuu Qoho the Razorclaw", "Wyrmgnasher Bjakdek", "Wyrmwix Snakespecs", "Xoo Kaza the Solemn", "Xuu Bhoqa the Enigma", "Ze'Vho Fallsplitter", "Zo'Pha Forgesoul"}
staggers['day']['none'] = {"Animated Claymore", "Animated Dagger", "Animated Great Axe", "Animated Gun", "Animated Hammer", "Animated Horn", "Animated Kunai", "Animated Knuckles", "Animated Longbow", "Animated Longsword", "Animated Scythe", "Animated Shield", "Animated Spear", "Animated Staff", "Animated Tabar", "Animated Tachi", "Fire Pukis", "Petro Pukis", "Poison Pukis", "Wind Pukis", "Kindred's Vouivre", "Kindred's Wyvern", "Kindred's Avatar", "Vanguard Eye", "Prototype Eye", "Nebiros's Avatar", "Haagenti's Avatar", "Caim's Vouivre", "Andras's Vouivre", "Adamantking Effigy", "Avatar Icon", "Goblin Replica", "Serjeant Tombstone", "Zagan's Wyvern", "Hydra's Hound", "Hydra's Wyvern", "Hydra's Avatar", "Rearguard Eye", "Adamantking Effigy", "Adamantking Image", "Avatar Icon", "Avatar Idol", "Effigy Prototype", "Goblin Replica", "Goblin Statue", "Icon Prototype", "Manifest Icon", "Manifest Icon", "Prototype Eye", "Serjeant Tombstone", "Statue Prototype", "Tombstone Prototype", "Vanguard Eye", "Vanguard's Avatar", "Vanguard's Avatar", "Vanguard's Avatar", "Vanguard's Avatar", "Vanguard's Crow", "Vanguard's Hecteyes", "Vanguard's Scorpion", "Vanguard's Slime", "Vanguard's Wyvern", "Vanguard's Wyvern", "Vanguard's Wyvern", "Vanguard's Wyvern", "Warchief Tombstone"}
staggers['night'] = T{}
staggers['night']['ja'] = {"Kindred Thief", "Kindred Beastmaster", "Kindred Monk", "Kindred Ninja", "Kindred Ranger", "Hydra Thief", "Hydra Beastmaster", "Hydra Monk", "Hydra Ninja", "Hydra Ranger", "Nightmare Crab", "Nightmare Dhalmel", "Nightmare Diremite", "Nightmare Goobbue", "Nightmare Leech", "Nightmare Manticore", "Nightmare Raptor", "Nightmare Scorpion", "Nightmare Tiger", "Nightmare Treant", "Nightmare Worm", "Vanguard Armorer", "Vanguard Backstabber", "Vanguard Defender", "Vanguard Dragontamer", "Vanguard Drakekeeper", "Vanguard Exemplar", "Vanguard Grappler", "Vanguard Hatamoto", "Vanguard Hawker", "Vanguard Inciter", "Vanguard Partisan", "Vanguard Persecutor", "Vanguard Pillager", "Vanguard Predator", "Vanguard Ronin", "Vanguard Skirmisher", "Vanguard Smithy", "Vanguard Tinkerer", "Vanguard Vigilante", "Vanguard Vindicator"}
staggers['night']['magic'] = {"Kindred White Mage", "Kindred Bard", "Kindred Summoner", "Kindred Black Mage", "Kindred Red Mage", "Hydra White Mage", "Hydra Bard", "Hydra Summoner", "Hydra Black Mage", "Hydra Red Mage", "Nightmare Bugard", "Nightmare Crawler", "Nightmare Fly", "Nightmare Flytrap", "Nightmare Funguar", "Nightmare Gaylas", "Nightmare Hornet", "Nightmare Kraken", "Nightmare Raven", "Nightmare Roc", "Nightmare Uragnite", "Vanguard Ambusher", "Vanguard Assassin", "Vanguard Beasttender", "Vanguard Footsoldier", "Vanguard Gutslasher", "Vanguard Hitman", "Vanguard Impaler", "Vanguard Kusa", "Vanguard Liberator", "Vanguard Mason", "Vanguard Militant", "Vanguard Neckchopper", "Vanguard Ogresoother", "Vanguard Pathfinder", "Vanguard Pitfighter", "Vanguard Purloiner", "Vanguard Salvager", "Vanguard Sentinel", "Vanguard Trooper", "Vanguard Welldigger"}
staggers['night']['ws'] = {"Kindred Paladin", "Kindred Warrior", "Kindred Samurai", "Kindred Dragoon", "Kindred Dark Knight", "Hydra Paladin", "Hydra Warrior", "Hydra Samurai", "Hydra Dragoon", "Hydra Dark Knight", "Nightmare Bunny", "Nightmare Cluster", "Nightmare Eft", "Nightmare Hippogryph", "Nightmare Makara", "Nightmare Mandragora", "Nightmare Sabotender", "Nightmare Sheep", "Nightmare Snoll", "Nightmare Stirge", "Nightmare Weapon", "Vanguard Alchemist", "Vanguard Amputator", "Vanguard Bugler", "Vanguard Chanter", "Vanguard Constable", "Vanguard Dollmaster", "Vanguard Enchanter", "Vanguard Maestro", "Vanguard Mesmerizer", "Vanguard Minstrel", "Vanguard Necromancer", "Vanguard Oracle", "Vanguard Prelate", "Vanguard Priest", "Vanguard Protector", "Vanguard Shaman", "Vanguard Thaumaturge", "Vanguard Undertaker", "Vanguard Vexer", "Vanguard Visionary"}
staggers['night']['random'] = {"Ascetox Ratgums", "Be'Zhe Keeprazer", "Bhuu Wjato the Firepool", "Bordox Kittyback", "Brewnix Bittypupils", "Caa Xaza the Madpiercer", "Cobraclaw Buchzvotch", "De'Bho Pyrohand", "Deathcaller Bidfbid", "Drakefeast Wubmfub", "Draklix Scalecrust", "Droprix Granitepalms", "Elvaanlopper Grokdok", "Foo Peku the Bloodcloak", "Ga'Fho Venomtouch", "Galkarider Retzpratz", "Gibberox Pimplebeak", "Go'Tyo Magenapper", "Gu'Khu Dukesniper", "Gu'Nha Wallstormer", "Guu Waji the Preacher", "Heavymail Djidzbad", "Hee Mida the Meticulous", "Humegutter Adzjbadj", "Jeunoraider Gepkzip", "Ji'Fhu Infiltrator", "Ji'Khu Towercleaver", "Knii Hoqo the Bisector", "Koo Saxu the Everfast", "Kuu Xuka the Nimble", "Lockbuster Zapdjipp", "Maa Zaua the Wyrmkeeper", "Mi'Rhe Whisperblade", "Mithraslaver Debhabob", "Moltenox Stubthumbs", "Morblox Chubbychin", "Mu'Gha Legionkiller", "Na'Hya Floodmaker", "Nee Huxa the Judgmental", "Nu'Bhi Spiraleye", "Puu Timu the Phantasmal", "Routsix Rubbertendon", "Ruffbix Jumbolobes", "Ryy Qihi the Idolrobber", "Shisox Widebrow", "Skinmask Ugghfogg", "Slinkix Trufflesniff", "So'Gho Adderhandler", "So'Zho Metalbender", "Soo Jopo the Fiendking", "Spinalsucker Galflmall", "Swypestix Tigershins", "Ta'Hyu Gallanthunter", "Taruroaster Biggsjig", "Tocktix Thinlids", "Ultrasonic Zeknajak", "Whistrix Toadthroat", "Wraithdancer Gidbnod", "Xaa Chau the Roctalon", "Xhoo Fuza the Sublime", "Angra Mainyu", "Dagourmarche", "Goublefaupe", "Mildaunegeux", "Quiebitiel", "Velosareon", "Taquede", "Pignonpausard", "Hitaume", "Cavanneche", "Arch Angra Mainyu", "Count Vine", "Count Zaebos", "Duke Berith", "Duke Gomory", "Duke Scox", "King Zagan", "Marquis Andras", "Marquis Cimeries", "Marquis Decarabia", "Marquis Gamygyn", "Marquis Nebiros", "Marquis Orias", "Marquis Sabnak", "Prince Seere", "Count Raum", "Dynamis Lord", "Duke Haures", "Marquis Caim", "Baron Avnas", "Count Haagenti", "Arch Dynamis Lord", "Aitvaras", "Alklha", "Antaeus", "Anvilix Sootwrists", "Apocalyptic Beast", "Arch Antaeus", "Arch Apocalyptic Beast", "Arch Christelle", "Arch Goblin Golem", "Arch Gu'Dha Effigy", "Arch Overlord Tombstone", "Arch Tzee Xicu Idol", "Baa Dava the Bibliophage", "Bandrix Rockjaw", "Barong", "Battlechoir Gitchfotch", "Bladeburner Rokgevok", "Blazox Boneybod", "Bloodfist Voshgrosh", "Bootrix Jaggedelbow", "Bu'Bho Truesteel", "Buffrix Eargone", "Cirrate Christelle", "Cloktix Longnail", "Diabolos Club", "Diabolos Diamond", "Diabolos Heart", "Diabolos Letum", "Diabolos Nox", "Diabolos Somnus", "Diabolos Spade", "Diabolos Umbra", "Distilix Stickytoes", "Doo Peku the Fleetfoot", "Elixmix Hooknose", "Elvaansticker Bxafraff", "Eremix Snottynostril", "Fairy Ring", "Feralox Honeylips", "Feralox's Slime", "Flamecaller Zoeqdoq", "Fuu Tzapo the Blessed", "Gabblox Magpietongue", "Gi'Bhe Fleshfeaster", "Gi'Pha Manameister", "Goblin Golem", "Gosspix Blabblerlips", "Gu'Dha Effigy", "Gu'Nhi Noondozer", "Haa Pevi the Stentorian", "Hamfist Gukhbuk", "Hermitrix Toothrot", "Humnox Drumbelly", "Jabbrox Grannyguise", "Jabkix Pigeonpec", "Karashix Swollenskull", "Kikklix Longlegs", "Ko'Dho Cannonball", "Koo Rahi the Levinblade", "Loo Hepe the Eyepiercer", "Lost Aitvaras", "Lost Alklha", "Lost Barong", "Lost Fairy Ring", "Lost Nant'ina", "Lost Scolopendra", "Lost Stcemqestcint", "Lost Stihi", "Lost Stringes", "Lost Suttung", "Lurklox Dhalmelneck", "Lyncean Juwgneg", "Maa Febi the Steadfast", "Mobpix Mucousmouth", "Morgmox Moldnoggin", "Mortilox Wartpaws", "Muu Febi the Steadfast", "Naa Yixo the Stillrage", "Nant'ina", "Nightmare Taurus", "Overlord's Tombstone", "Prowlox Barrelbelly", "Quicktrix Hexhands", "Qu'Pho Bloodspiller", "Ra'Gho Darkfount", "Ra'Gho's Avatar", "Reapertongue Gadgquok", "Ree Nata the Melomanic", "Rutrix Hamgams", "Scolopendra", "Scourquix Scaleskin", "Scourquix's Wyvern", "Scruffix Shaggychest", "Shamblix Rottenheart", "Slystix Megapeepers", "Smeltix Thickhide", "Snypestix Eaglebeak", "Soulsender Fugbrag", "Sparkspox Sweatbrow", "Spellspear Djokvukk", "Stcemqestcint", "Steelshank Kratzvatz", "Stihi", "Stringes", "Suttung", "Tee Zaksa the Ceaseless", "Te'Zha Ironclad", "Ticktox Beadyeyes", "Trailblix Goatmug", "Tufflix Loglimbs", "", "Tymexox Ninefingers", "Tzee Xicu Idol", "Va'Rhu Bodysnatcher", "Va'Zhe Pummelsong", "Voidstreaker Butchnotch", "Wasabix Callusdigit", "Wilywox Tenderpalm", "Woodnix Shrillwhistle", "Wuu Qoho the Razorclaw", "Wyrmgnasher Bjakdek", "Wyrmwix Snakespecs", "Xoo Kaza the Solemn", "Xuu Bhoqa the Enigma", "Ze'Vho Fallsplitter", "Zo'Pha Forgesoul"}
staggers['night']['none'] = {"Animated Claymore", "Animated Dagger", "Animated Great Axe", "Animated Gun", "Animated Hammer", "Animated Horn", "Animated Kunai", "Animated Knuckles", "Animated Longbow", "Animated Longsword", "Animated Scythe", "Animated Shield", "Animated Spear", "Animated Staff", "Animated Tabar", "Animated Tachi", "Fire Pukis", "Petro Pukis", "Poison Pukis", "Wind Pukis", "Kindred's Vouivre", "Kindred's Wyvern", "Kindred's Avatar", "Vanguard Eye", "Prototype Eye", "Nebiros's Avatar", "Haagenti's Avatar", "Caim's Vouivre", "Andras's Vouivre", "Adamantking Effigy", "Avatar Icon", "Goblin Replica", "Serjeant Tombstone", "Zagan's Wyvern", "Hydra's Hound", "Hydra's Wyvern", "Hydra's Avatar", "Rearguard Eye", "Adamantking Effigy", "Adamantking Image", "Avatar Icon", "Avatar Idol", "Effigy Prototype", "Goblin Replica", "Goblin Statue", "Icon Prototype", "Manifest Icon", "Manifest Icon", "Prototype Eye", "Serjeant Tombstone", "Statue Prototype", "Tombstone Prototype", "Vanguard Eye", "Vanguard's Avatar", "Vanguard's Avatar", "Vanguard's Avatar", "Vanguard's Avatar", "Vanguard's Crow", "Vanguard's Hecteyes", "Vanguard's Scorpion", "Vanguard's Slime", "Vanguard's Wyvern", "Vanguard's Wyvern", "Vanguard's Wyvern", "Vanguard's Wyvern", "Warchief Tombstone"}
Currency = {"Ordelle Bronzepiece", "Montiont Silverpiece", "One Byne Bill","One Hundred Byne Bill","Tukuku Whiteshell", "Lungo-Nango Jadeshell", "Forgotten Thought", "Forgotten Hope", "Forgotten Touch", "Forgotten Journey", "Forgotten Step"}
ProcZones = {"Dynamis - San d'Oria","Dynamis - Windurst","Dynamis - Bastok","Dynamis - Jeuno","Dynamis - Beaucedine","Dynamis - Xarcabard","Dynamis - Valkurm","Dynamis - Buburimu","Dynamis - Qufim","Dynamis - Tavnazia"}
proctype = {"ja","magic","ws","random","none"}
StaggerCount = 0
current_proc = "lolidk"
currentime = 0
goodzone = "no"
timer = "off"
tracker = "off"
proc = "off"
trposx = 1000
trposy = 250
pposx = 800
pposy = 250

settings = config.load()
timer = settings['timer']
tracker = settings['tracker']
trposx = settings['trposx']
trposy = settings['trposy']
proc = settings['proc']
pposx = settings['pposx']
pposy = settings['pposy']

for i=1, #Currency do
     Currency[Currency[i]] = 0
end

windower.register_event('load', 'login', function()
    if windower.ffxi.get_info().logged_in then
        player = windower.ffxi.get_player()['name']
        obtained = nil
        initializebox()
    end
end)

windower.register_event('addon command',function (...)
--	 print('event_addon_command function')
	local params = {...};
	if #params < 1 then
		return	end
		if params[1] then
			if params[1]:lower() == "help" then
   				print('dh help : Shows help message')
  				print('dh timer [on/off] : Displays a timer each time a mob is staggered.')
   				print('dh tracker [on/off/reset/pos x y] : Tracks the amount of currency obtained.')
				print('dh proc [on/off/pos x y] : Displays the current proc for the targeted mob.')
   				print('dh ll create : Creates and loads a light luggage profile that will automatically lot all currency.')
			elseif params[1]:lower() == "timer" then
   				if params[2]:lower() == "on" or params[2]:lower() == "off" then
    				timer = params[2]
					print('Timer feature is '..timer)
   				else print("Invalid timer option.")
   			end
		elseif params[1]:lower() == "tracker" then
   			if params[2]:lower() == "on" then
    			tracker = "on"
				initializebox()
				windower.text.set_visibility('dynamis_box',true)
    			print('Tracker enabled')
   			elseif params[2]:lower() == "off" then
    			tracker = "off"
    			windower.text.set_visibility('dynamis_box',false)
    			print('Tracker disabled')
   			elseif params[2]:lower() == "reset" then
				for i=1, #Currency do
     				Currency[Currency[i]] = 0
     			end
      			obtainedf()
     	 		initializebox()
      			print('Tracker reset')
   			elseif params[2]:lower() == "pos" then
    			if params[3] then
     				trposx, trposy = tonumber(params[3]), tonumber(params[4])
     				obtainedf()
     				initializebox()
    			else print("Invalid tracker option.")
    			end
    		end
  		elseif params[1]:lower() == "ll" then
   			if params[2]:lower() == "create" then
    			player = windower.ffxi.get_player()['name']
    			io.open(windower.addon_path..'../../plugins/ll/dynamis-'..player..'.txt',"w"):write('if item is 1452, 1453, 1455, 1456, 1449, 1450 then lot'):close()
    			windower.send_command('ll profile dynamis-'..player..'.txt')
   			else print("Invalid light luggage option.")
   			end
  	 elseif params[1]:lower() == "proc" then
   			if params[2]:lower() == "on" then
   				proc = params[2]
   				print('Proc feature enabled.')
   			elseif params[2]:lower() == "off" then
   		 		proc = params[2]
    			windower.text.set_visibility('proc_box',false)
    			print('Proc feature disabled.')
    		elseif params[2]:lower() == "pos" then
   				pposx, pposy = tonumber(params[3]), tonumber(params[4])
   				initializeproc()
   			end
		end
	end
end)


windower.register_event('incoming text',function (original, new, color)
--	print('event_incoming_text function')
	if timer == 'on' then
  		a,b,fiend = string.find(original,"%w+'s attack staggers the (%w+)%!")
   		if fiend == 'fiend' then
			StaggerCount = StaggerCount + 1
    		windower.send_command('timers c '..StaggerCount..' 30 down')
    		return new, color
    	end
	end
 	if tracker == 'on' then
     	a,b,item = string.find(original,"%w+ obtains an? ..(%w+ %w+ %w+ %w+)..\46")
     		if item == nil then
      	 		a,b,item = string.find(original,"%w+ obtains an? ..(%w+ %w+ %w+)..\46")
       				if item == nil then
         				a,b,item = string.find(original,"%w+ obtains an? ..(%w+%-%w+ %w+)..\46")
          					if item == nil then
           						a,b,item = string.find(original,"%w+ obtains an? ..(%w+ %w+)..\46")
         					end
       				end
     		end
-- 		a,b,item = string.find(original,"%w+ obtains an? ..(.*)..\46")
 		if item ~= nil then
 			item = item:lower()
 			for i=1, #Currency do
				if item == Currency[i]:lower() then
   					Currency[Currency[i]] = Currency[Currency[i]] + 1
   				end
 			end
 			obtainedf()
 		end
    	initializebox()
 	end
 	return new, color
end)

function obtainedf()
--	print('obtainedf function')
	obtained = nil
 	for i=1,#Currency do
 		if Currency[Currency[i]] ~= 0 then
  			if obtained == nil then
  				obtained = " "
  			end
   			obtained = (obtained..Currency[i]..': '..Currency[Currency[i]]..' \n ')
 		end
 	end
end

function checkzone()
--	print('checkzone function')
	goodzone = 'no'
	currentzone = windower.ffxi.get_info()['zone']:lower()
	for i=1, #ProcZones do
		if currentzone == ProcZones[i]:lower() then
			goodzone = 'yes'
		end
	end
	if goodzone == 'no' then
		windower.text.set_visibility('proc_box',false)
	end
end

function initializebox()
--	print('initializebox function')
	if obtained ~= nil and tracker == "on" then
 		windower.text.create('dynamis_box')
 		windower.text.set_bg_color('dynamis_box',200,30,30,30)
 		windower.text.set_color('dynamis_box',255,200,200,200)
		windower.text.set_location('dynamis_box',trposx,trposy)
 		windower.text.set_visibility('dynamis_box',true)
 		windower.text.set_bg_visibility('dynamis_box',true)
 		windower.text.set_font('dynamis_box','Arial',12)
 		windower.text.set_text('dynamis_box',obtained);
 	end
end


windower.register_event('target change',function (targ_id)
--	print('event_target_change function')
	checkzone()
	if proc == 'on' then
		if targ_id ~= 0 then
			mob = windower.ffxi.get_mob_by_index(targ_id)['name']
  			setproc()
  		end
 	end
end)

function setproc()
--	print('setproc function')
	current_proc = 'lolidk'
    local currenttime = windower.ffxi.get_info().time
 	if currenttime >= 0*60 and currenttime < 8*60 then
  		window = 'morning'
 	elseif currenttime >= 8*60 and currenttime < 16*60 then
  		window = 'day'
	elseif currenttime >= 16*60 and currenttime <= 24*60 then
  		window = 'night'
 	end
-- 	print(window)
 	--figure out the stupid mob's proc
 	for i=1, #proctype do
  		for j=1, #staggers[window][proctype[i]] do
 			if mob == staggers[window][proctype[i]][j] then
 				current_proc = proctype[i]
 			end
 		end
 	end
 	if current_proc == 'ja' then
 		current_proc = 'Job Ability'
 	elseif current_proc == 'magic' then
 		current_proc = 'Magic'
 	elseif current_proc == 'ws' then
 		current_proc = 'Weapon Skill'
 	end
	initializeproc()
end

function initializeproc()
--		print('initializeproc function')
		windower.text.create('proc_box')
	 	windower.text.set_bg_color('proc_box',200,30,30,30)
	 	windower.text.set_color('proc_box',255,200,200,200)
	 	windower.text.set_location('proc_box',pposx,pposy)
	 	if goodzone == 'yes' and proc == 'on' then
	 	 	windower.text.set_visibility('proc_box', true)
	 	end
	 	windower.text.set_bg_visibility('proc_box',1)
	 	windower.text.set_font('proc_box','Arial',12)
	 	windower.text.set_text('proc_box',' Current proc for \n '..mob..'\n is '..current_proc);
	 	if proc == "off" then
	 		windower.text.set_visibility('proc_box', false)
	 	end
end

windower.register_event('unload',function ()
 	windower.text.delete('dynamis_box')
 	windower.text.delete('proc_box')
end)