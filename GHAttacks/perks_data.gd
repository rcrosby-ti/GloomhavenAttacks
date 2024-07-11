extends Reference
class_name PerksData


const PERK_TEXT = [
	"",
	"",
	"[img=0x64]res://null.png[/img]",
	"[img=0x64]res://double.png[/img]",
	"[img=0x64]res://minus2.png[/img]",
	"[img=0x64]res://minus1.png[/img]",
	"[img=0x64]res://plus0.png[/img]",
	"[img=0x64]res://plus1.png[/img]",
	"[img=0x64]res://plus2.png[/img]",
	"[img=0x64]res://plus3.png[/img]",
	"[img=0x64]res://plus4.png[/img]",
	"[img=0x64]res://rolling.png[/img]",
	"[img=0x64]res://air.png[/img]",
	"[img=0x64]res://dark.png[/img]",
	"[img=0x64]res://earth.png[/img]",
	"[img=0x64]res://fire.png[/img]",
	"[img=0x64]res://ice.png[/img]",
	"[img=0x64]res://light.png[/img]",
	[ "[img=0x64]res://pull.png[/img] 1",
		"[img=0x64]res://fh_pull.png[/img] 1" ],
	[ "[img=0x64]res://pull.png[/img] 2",
		"[img=0x64]res://fh_pull.png[/img] 2" ],
	[ "[img=0x64]res://push.png[/img] 1",
		"[img=0x64]res://fh_push.png[/img] 1" ],
	[ "[img=0x64]res://push.png[/img] 2",
		"[img=0x64]res://fh_push.png[/img] 2" ],
	[ "[img=0x64]res://pierce.png[/img] 3",
		"[img=0x64]res://fh_pierce.png[/img] 3" ],
	"[img=0x64]res://target.png[/img]",
	"[img=0x64]res://poison.png[/img]",
	[ "[img=0x64]res://wound.png[/img]",
		"[img=0x64]res://fh_wound.png[/img]" ],
	[ "[img=0x64]res://immobilize.png[/img]",
		"[img=0x64]res://fh_immobilize.png[/img]" ],
	[ "[img=0x64]res://disarm.png[/img]",
		"[img=0x64]res://fh_disarm.png[/img]" ],
	[ "[img=0x64]res://stun.png[/img]",
		"[img=0x64]res://fh_stun.png[/img]" ],
	"[img=0x64]res://muddle.png[/img]",
	"[img=0x64]res://curse.png[/img]",
	"[img=0x64]res://invisible.png[/img]",
	[ "[img=0x64]res://shield.png[/img] 1, Ally",
		"[img=0x64]res://fh_shield.png[/img] 1, Ally" ],
	[ "[img=0x64]res://shield.png[/img] 1, Self",
		"[img=0x64]res://fh_shield.png[/img] 1, Self" ],
	"[img=0x64]res://heal.png[/img] 1, Ally",
	"[img=0x64]res://heal.png[/img] 1, Self",
	"[img=0x64]res://heal.png[/img] 2, Self",
	"[img=0x64]res://heal.png[/img] 3, Self",
	"[img=0x64]res://aoe1.png[/img]",
	"[img=0x64]res://refresh.png[/img]",
	"[img=0x64]res://heal.png[/img] 2, Ally",
	"[img=0x64]res://regen.png[/img] Self",
	"[img=0x64]res://fire_ice.png[/img]",
	"[img=0x64]res://fire_air.png[/img]",
	"[img=0x64]res://fire_earth.png[/img]",
	"[img=0x64]res://fire_light.png[/img]",
	"[img=0x64]res://fire_dark.png[/img]",
	"[img=0x64]res://ice_air.png[/img]",
	"[img=0x64]res://ice_earth.png[/img]",
	"[img=0x64]res://ice_light.png[/img]",
	"[img=0x64]res://ice_dark.png[/img]",
	"[img=0x64]res://air_earth.png[/img]",
	"[img=0x64]res://air_light.png[/img]",
	"[img=0x64]res://air_dark.png[/img]",
	"[img=0x64]res://earth_light.png[/img]",
	"[img=0x64]res://earth_dark.png[/img]",
	"[img=0x64]res://light_dark.png[/img]",
	[ "[img=0x64]res://push.png[/img] 3",
		"[img=0x64]res://fh_push.png[/img] 3" ],
	"[img=0x64]res://retal2.png[/img]",
	"[img=0x64]res://strengthen.png[/img] Ally",
	"[img=0x64]res://brittle.png[/img]",
	"[img=0x64]res://brittle.png[/img] Self",
	"\"Add +1 for each ally adjacent to target\"",
	"\"On your next attack, discard this card to add +2\"",
	"\"Gain 1 [img=0x64]res://time.png[/img]\"",
	"\"Kill attacking summon to instead add +4\"",
	"\"[img=0x64]res://heal.png[/img] 1, Character\"",
	"\"[img=0x64]res://tide.png[/img] action performed this round, +2 instead\"",
	"\"Gain 1\n[img=0x64]res://trophy.png[/img]\"",
	"\"[img=0x64]res://token_back.png[/img]\"",
	"\"Create [img=0x64]res://icy_hex.png[/img] adjacent to target\"",
	"\n\"[img=0x64]res://wild_use.png[/img] : [img=0x64]res://wild.png[/img]\"",
	"\"After this attack ability, grant summon: [img=0x64]res://move.png[/img] 2\"",
	"\"After this attack ability: [img=0x64]res://transfer.png[/img]\"",
	"[img=0x64]res://air.png[/img][img=0x64]res://earth.png[/img][img=0x64]res://dark.png[/img]",
	"\"Move one waning element to strong\"",
	"\"+1 for each pair of active [img=0x64]res://infusion.png[/img]\"",
	"\"[img=0x64]res://pressure_up.png[/img] or [img=0x64]res://pressure_down.png[/img]\"",
	"[img=0x64]res://aoe1_all.png[/img]",
	"[img=0x64]res://curse.png[/img][img=0x64]res://curse.png[/img]",
	"\"Add +1 for each negative condition you have\"",
	"\"Create [img=0x64]res://hazard_hex.png[/img] adjacent to target\"",
	"\"Reveal the top card of the monster's ability deck\"",
	"\"[img=0x64]res://heal.png[/img] 2, [img=0x64]res://bless.png[/img], Ally\"",
	"\"Gain 1\n[img=0x64]res://resonance.png[/img]\"",
	"\"If this action forces target to move, it suffers [img=0x64]res://damage.png[/img] 1\"",
	"\"[img=0x64]res://heal.png[/img] 1, [img=0x64]res://ward.png[/img], Ally\"",
	"\"Create [img=0x64]res://trap_hex.png[/img] [img=0x64]res://heal.png[/img] 2 adjacent to target\"",
	"\"Create [img=0x64]res://trap_hex.png[/img] [img=0x64]res://damage.png[/img] 1 adjacent to target\"",
	"\"Add [img=0x64]res://damage.png[/img] 2 or [img=0x64]res://heal.png[/img] 2 to a trap [img=0x64]res://range.png[/img] 2\"",
	[ "\"[img=0x64]res://pull.png[/img] 2 or\n[img=0x64]res://push.png[/img] 2\"",
		"\"[img=0x64]res://fh_pull.png[/img] 2 or [img=0x64]res://fh_push.png[/img] 2\"" ],
]

const EXTRA_TEXT = [
	"Ignore scenario effects", #1000
	"Ignore item [img=0x64]minus1.png[/img] effects",
	"[img=0x64]res://chest.png[/img] : ",
	"[img=0x64]res://head.png[/img] : ",
	"[img=0x64]res://feet.png[/img] : ",
	"[img=0x64]res://hand.png[/img] : ",
	"Tireless Leadership", # banner
	"Into the Breach",
	"Iron Will",
	"Entropy Transfer", # blade
	"Head Start", # 1010
	"Perpetual Motion",
	"Reclaimed Essence", # skull
	"Soul Pact",
	"Dead on Arrival",
	"Resilient Shell", # anemone
	"Curl Up",
	"Aquatic Predator",
	"Restless Night", # ghost
	"Haunting Dreams",
	"Cloak of Shadow", # 1020
	"Grisly Claim", # kelp
	"Decorated Veteran",
	"Unseen Predator",
	"Persistence", # club
	"Expanded Arsenal",
	"Scavenger",
	"Sure Footing", # fist
	"The Mountain's Boon",
	"Thick-Skinned",
	"Revitalizing Swarm", # gemini # 1030
	"Acquired Resistance",
	"Unstable Equilibrium",
	"Remote Override", # diamond
	"Adaptive Programming",
	"Galvanized Frame",
	"Sustained Animation", # star
	"Elemental Tempering",
	"Radiant Boon",
	"Valve Adjustment", # drill
	"Synthetic Resistance", # 1040
	"Emergency Reboot",
	"Extended Torment", # shackles
	"Last Laugh",
	"Scar Tissue",
	"Improvised Armor", # meteor
	"Spitting Magma",
	"Dormant Peace",
	"Profound Note", # shards
	"Hyperresonance",
	"Precognition", # 1050
	"Heart of the Storm", # snowflake
	"Winter's Breath",
	"Blinding Flurries",
	"Idle Hands", # trap
	"Careful Footing",
	"Always Be Prepared",
	"Lying Low", # fh_brain
	"Earthquakes", # fh_four_squares
	"Rejuvenating Vapor", # fh_gear
	"Rested and Ready", # fh_brute # 1060
	"Cloak of Invisibility", # fh_kunai
	"Etheric Bond", # fh_spiral
	"Marked for the Hunt", # fh_angry_face
	"Phase Out", # fh_circles
	"Xorn's Boon", # fh_cthulhu
	"Empowering Night", # fh_eclipse
	"Rapid Recovery", # fh_lightning
	"Storyteller", # fh_music_note
	"Bear Treat", # fh_phoenix
	"Revitalizing Medicine", # fh_saw # 1070
	"Shielding Light", # fh_sun
	"Well Supplied", # fh_three_spears
	"Elemental Proficiency", # fh_triforce
	"Tip the Scales", # fh_diviner
	"Remodeling", # fh_bomb
	"Brilliant Aegis", # fh_chain
	"Hasty Pick-up", # fh_hatchet
	"Grave Defense", # fh_staff
]

const PERKS_EXTRA = 1000


var brain_perks = [
	[ 2, -5, -5 ],
	[ 1, -6, -6, -6, -6 ],
	[ 1, -7, -7, 8, 8 ],
	[ 1, -4, 6 ],
	[ 2, 9 ],
	[ 2, 10, 10 ],
	[ 1, 11, 11, 11 ],
	[ 1, 12, 12, 12 ],
	[ 1, 13, 13 ],
	[ 1, 14 ],
	[ 1, 15, 12 ],
	[ 1, 1000 ]
]

var four_squares_perks = [
	[ 1, -6, -6, -6, -6 ],
	[ 3, -5, 7 ],
	[ 1, 4, 8, 8 ],
	[ 2, 9 ],
	[ 2, 10 ],
	[ 1, 11, 11 ],
	[ 2, 12, 12 ],
	[ 1, 13, 13 ],
	[ 1, 1001 ],
	[ 1, 1000 ]
]

var gear_perks = [
	[ 2, -5, -5 ],
	[ 1, -4, 6 ],
	[ 1, 7, 7 ],
	[ 1, 9 ],
	[ 1, 10, 10 ],
	[ 1, 11, 11, 11 ],
	[ 2, 12 ],
	[ 2, 13 ],
	[ 2, 14 ],
	[ 1, 15 ],
	[ 1, 1000 ]
]

var horns_perks = [
	[ 1, -5, -5 ],
	[ 1, -5, 7 ],
	[ 2, 7, 7 ],
	[ 1, 9 ],
	[ 2, 10, 10, 10 ],
	[ 1, 11, 11 ],
	[ 2, 12 ],
	[ 1, 13, 14 ],
	[ 2, 15 ],
	[ 1, 16 ],
	[ 1, 1001, 7 ]
]

var kunai_perks = [
	[ 2, -5, -5 ],
	[ 1, -6, -6, -6, -6 ],
	[ 1, -4, 6 ],
	[ 1, -5, 7 ],
	[ 2, -6, 8 ],
	[ 2, 9, 9 ],
	[ 1, 10, 10 ],
	[ 2, 11, 11 ],
	[ 1, 12, 12 ],
	[ 1, 13 ],
	[ 1, 1000 ]
]

var spiral_perks = [
	[ 1, -6, -6, -6, -6 ],
	[ 2, -5, 7 ],
	[ 2, 7, 7 ],
	[ 1, 9 ],
	[ 1, 10 ],
	[ 1, 11 ],
	[ 1, 12 ],
	[ 2, 13 ],
	[ 2, 14 ],
	[ 1, 15, 16 ],
	[ 1, 17, 18 ]
]

var angry_face_perks = [
	[ 2, -5, -5 ],
	[ 3, -6, -6, 7, 7 ],
	[ 2, 9, 9 ],
	[ 1, 10 ],
	[ 1, 11 ],
	[ 1, 12 ],
	[ 1, 13 ],
	[ 1, 14 ],
	[ 2, 15 ],
	[ 1, 1000 ]
]

var circles_perks = [
	[ 1, -5, -5 ],
	[ 1, -4, 6 ],
	[ 3, -5, 7 ],
	[ 2, 8 ],
	[ 1, 9, 9 ],
	[ 1, 10, 10 ],
	[ 3, 11, 11 ],
	[ 1, 12, 13 ],
	[ 1, 14, 15 ],
	[ 1, 1000, 7, 7 ]
]

var cthulhu_perks = [
	[ 1, -4, 6 ],
	[ 2, -5, 7 ],
	[ 2, -6, 8 ],
	[ 1, 7, 7 ],
	[ 3, 9 ],
	[ 1, 10, 10, 10 ],
	[ 1, 11, 11 ],
	[ 1, 12, 12 ],
	[ 2, 13 ],
	[ 1, 1000, 7 ]
]

var eclipse_perks = [
	[ 2, -5, -5 ],
	[ 1, -6, -6, -6, -6 ],
	[ 2, 9 ],
	[ 2, -9, 10 ],
	[ 2, 11 ],
	[ 2, 12, 12, 12 ],
	[ 1, 13, 13 ],
	[ 1, 14, 14 ],
	[ 1, 15 ],
	[ 1, 1000, 7, 7 ]
]

var lightning_perks = [
	[ 1, -5, -5 ],
	[ 1, -6, -6, -6, -6 ],
	[ 2, -5, 7 ],
	[ 2, -6, 9 ],
	[ 2, 10, 10 ],
	[ 2, 11 ],
	[ 1, 12 ],
	[ 1, 13, 13 ],
	[ 2, 14 ],
	[ 1, 1001 ]
]

var music_note_perks = [
	[ 2, -5, -5 ],
	[ 1, -4 ],
	[ 2, -7, -7, 9 ],
	[ 1, -6, 10 ],
	[ 1, -6, 11 ],
	[ 1, -6, 12 ],
	[ 1, -6, 13 ],
	[ 1, -6, 14 ],
	[ 1, -6, 15 ],
	[ 1, -5, 16 ],
	[ 1, 17, 17, 17 ],
	[ 2, 18, 18 ]
]

var phoenix_perks = [
	[ 1, -5, -5 ],
	[ 3, -5, 7 ],
	[ 2, -6, 8 ],
	[ 2, 9 ],
	[ 2, 10 ],
	[ 3, 11, 11 ],
	[ 1, 12, 12 ],
	[ 1, 1000 ]
]

var saw_perks = [
	[ 2, -5, -5 ],
	[ 1, -6, -6, -6, -6 ],
	[ 2, -6, 8 ],
	[ 2, 9 ],
	[ 2, 10 ],
	[ 2, 11, 11 ],
	[ 1, 12 ],
	[ 2, 13 ],
	[ 1, 14 ]
]

var sun_perks = [
	[ 2, -5, -5 ],
	[ 1, -6, -6, -6, -6 ],
	[ 1, -4, 6 ],
	[ 1, -6, 8 ],
	[ 2, 9, 9 ],
	[ 2, 10, 10 ],
	[ 1, 11 ],
	[ 2, 12, 12 ],
	[ 1, 13, 13 ],
	[ 1, 1001, 7, 7 ],
	[ 1, 1000 ]
]

var three_spears_perks = [
	[ 2, -5, -5 ],
	[ 1, -6, -6, -6, -6 ],
	[ 2, -6, 8 ],
	[ 2, 9, 9 ],
	[ 1, 10, 10, 10 ],
	[ 1, 11, 11 ],
	[ 1, 12 ],
	[ 1, 13 ],
	[ 3, 14 ],
	[ 1, 1001, 7, 7 ]
]

var triforce_perks = [
	[ 2, -5, -5 ],
	[ 1, -5, 7 ],
	[ 2, -6, 8 ],
	[ 1, 9, 9, 9 ],
	[ 1, 10, 10, 10 ],
	[ 1, 11, 11, 11 ],
	[ 1, 12, 12, 12 ],
	[ 1, -6, -6, 9, 12 ],
	[ 1, -6, -6, 10, 11 ],
	[ 1, 13, 13 ],
	[ 1, 14 ],
	[ 1, 15 ],
	[ 1, 16 ]
]

var diviner_perks = [
	[ 2, -5, -5 ],
	[ 1, -4 ],
	[ 2, -7, -7, 9 ],
	[ 1, -6, 10 ],
	[ 1, -6, 11 ],
	[ 1, -6, 12 ],
	[ 1, -6, 13 ],
	[ 1, -6, 14 ],
	[ 1, -6, 15 ],
	[ 1, -5, 16 ],
	[ 1, 17, 17 ],
	[ 1, 18, 18 ],
	[ 1, 1000, 7, 7 ]
]
var bomb_perks = [
	[ 1, -6, -6, -6, -6 ],
	[ 2, -5, -5 ],
	[ 1, -4, -7 ],
	[ 2, -6, 9 ],
	[ 1, -5, 10 ],
	[ 2, 8 ],
	[ 2, -7, 11 ],
	[ 2, -7, 12 ],
	[ 2, 13 ]
]

var chain_perks = [
	[ 1, -6, -6, -6, -6 ],
	[ 1, -5, -5 ],
	[ 1, -4, -7 ],
	[ 2, -5, 7 ],
	[ 2, -7, 9 ],
	[ 2, -7, 10 ],
	[ 2, 11 ],
	[ 2, 12 ],
	[ 1, -6, 13 ],
	[ 1, -6, 14 ]
]

var hatchet_perks = [
	[ 2, -5, -5 ],
	[ 1, -6, 9 ],
	[ 1, -6, 10 ],
	[ 1, -6, 11 ],
	[ 1, -6, 12 ],
	[ 1, -6, 13 ],
	[ 1, -6, 14 ],
	[ 1, -7, 15 ],
	[ 3, 16 ],
	[ 3, -7, 17 ]
]

var staff_perks = [
	[ 1, -5, -5 ],
	[ 1, -4 ],
	[ 2, -6, 9 ],
	[ 2, -6, 10 ],
	[ 2, -5, 11 ],
	[ 3, 12 ],
	[ 1, 13 ],
	[ 1, 14 ],
	[ 2, 15 ]
]

var banner_perks = [
	[ 3, -5, 9 ],
	[ 2, -6, 10 ],
	[ 2, 11 ],
	[ 2, 12 ],
	[ 2, 13, 13 ],
	[ 2, 14, 14 ],
	[ 1, 1001, -5 ],
	[ 1, 1006 ],
	[ 1, 1007 ],
	[ 2, 1008 ]
]

var blade_perks = [
	[ 1, -4 ],
	[ 2, -5, 7 ],
	[ 2, -5, 9 ],
	[ 2, -6, 10 ],
	[ 3, -6, 11 ],
	[ 1, -7, -7, 8, 8 ],
	[ 2, 12 ],
	[ 2, 13 ],
	[ 1, 1009 ],
	[ 1, 1010 ],
	[ 1, 1011 ]
]

var skull_perks = [
	[ 2, -5, 9 ],
	[ 2, -5, 10 ],
	[ 1, -4, 6 ],
	[ 3, -6, 11 ],
	[ 2, 12, 12, 12 ],
	[ 3, 13 ],
	[ 1, 1000, 7, 7 ],
	[ 1, 1012 ],
	[ 1, 1013 ],
	[ 2, 1014 ]
]

var anemone_perks = [
	[ 2, -5, 9, 9 ],
	[ 2, -5, 10 ],
	[ 2, -6, 11 ],
	[ 2, 12, 12 ],
	[ 2, 13 ],
	[ 1, 14 ],
	[ 2, 15, 15 ],
	[ 1, 1001, 1015 ],
	[ 1, 1016 ],
	[ 3, 1017 ]
]

var ghost_perks = [
	[ 1, -5, -5 ],
	[ 1, -4, 6 ],
	[ 3, -5, 7 ],
	[ 3, -6, 9 ],
	[ 2, 10 ],
	[ 2, 11, 12 ],
	[ 2, 13, 13 ],
	[ 1, 1000 ],
	[ 1, 1018 ],
	[ 1, 1019 ],
	[ 1, 1020 ]
]

var kelp_perks = [
	[ 1, -5, -5 ],
	[ 2, -5, 9 ],
	[ 1, -4, 10 ],
	[ 2, -6, 11 ],
	[ 1, -6, -6, 12, 12 ],
	[ 1, -7, -7, 8, 8 ],
	[ 1, -7, -7, -7, 13, 13, 13 ],
	[ 3, 14, 14 ],
	[ 1, 1000, -6, -6 ],
	[ 1, 1021 ],
	[ 1, 1022 ],
	[ 3, 1023 ]
]

var club_perks = [
	[ 3, -5, 7 ],
	[ 1, -4, 6 ],
	[ 2, -7, 9 ],
	[ 1, -6, -6, 10, 10 ],
	[ 1, -6, -6, 11, 11 ],
	[ 1, 12 ],
	[ 2, 13 ],
	[ 1, 14, 14 ],
	[ 1, 1000, 7 ],
	[ 1, 1001, 7 ],
	[ 2, 1024 ],
	[ 1, 1025 ],
	[ 1, 1026 ]
]

var fist_perks = [
	[ 2, -5, 9 ],
	[ 1, -5, 7 ],
	[ 1, -4, 6 ],
	[ 2, -6, 10 ],
	[ 2, -6, 11 ],
	[ 2, -6, 12 ],
	[ 1, 13 ],
	[ 3, 14, 14 ],
	[ 1, 1001, 1027 ],
	[ 1, 1028 ],
	[ 2, 1029 ]
]

var gemini_perks = [
	[ 1, -4, 6 ],
	[ 3, -5, 9 ],
	[ 2, -6, 10 ],
	[ 2, -6, 11 ],
	[ 1, -6, -6, 12, 12 ],
	[ 1, 13, 13 ],
	[ 1, 14 ],
	[ 2, 15 ],
	[ 1, 1000 ],
	[ 1, 1030 ],
	[ 1, 1031 ],
	[ 2, 1032 ]
]

var diamond_perks = [
	[ 1, -4, -7 ],
	[ 3, -5, 9 ],
	[ 3, -6, 10 ],
	[ 3, 11 ],
	[ 2, 12 ],
	[ 1, 13, 13 ],
	[ 1, 14, 14 ],
	[ 2, 1033 ],
	[ 1, 1034 ],
	[ 1, 1035 ]
]

var star_perks = [
	[ 1, -4, 5, 9 ],
	[ 2, -5, 10 ],
	[ 2, -5, 11 ],
	[ 2, -5, 12 ],
	[ 2, -6, 8 ],
	[ 2, -6, 13, 13, 13 ],
	[ 2, 14, 14 ],
	[ 1, 1000 ],
	[ 2, 1001, 1036 ],
	[ 1, 1037 ],
	[ 1, 1038 ]
]

var drill_perks = [
	[ 3, -5, 9 ],
	[ 2, -5, 10 ],
	[ 2, -6, 11 ],
	[ 2, -6, -6, 12, 13 ],
	[ 2, 14 ],
	[ 1, 15 ],
	[ 1, 1001, 7, 7 ],
	[ 1, 1039 ],
	[ 1, 1040 ],
	[ 3, 1041 ]
]

var shackles_perks = [
	[ 2, -5, -5 ],
	[ 1, -4, 9 ],
	[ 1, -5, 10 ],
	[ 3, -6, 11 ],
	[ 1, -6, 8 ],
	[ 1, -7, -7, -7, 12, 12, 12 ],
	[ 2, 13, 13, 13 ],
	[ 2, 14 ],
	[ 1, 1000, 7, 7 ],
	[ 1, 1042 ],
	[ 1, 1043 ],
	[ 2, 1044 ]
]

var meteor_perks = [
	[ 1, -5, -5 ],
	[ 1, -4 ],
	[ 2, -6, 9 ],
	[ 2, -5, 10 ],
	[ 2, -6, -6, 11, 11 ],
	[ 1, -7, -7, 8, 8 ],
	[ 2, 12, 12 ],
	[ 1, 13, 13 ],
	[ 1, 1000 ],
	[ 1, 1045 ],
	[ 1, 1046 ],
	[ 3, 1047 ]
]

var shards_perks = [
	[ 1, -6, -6, -6, -6 ],
	[ 2, -5, -5, 9, 9 ],
	[ 1, -4, 10 ],
	[ 2, -6, 11 ],
	[ 2, -7, -7, 12, 12 ],
	[ 2, 13 ],
	[ 3, 14 ],
	[ 1, 1000 ],
	[ 2, 1048 ],
	[ 1, 1049 ],
	[ 1, 1050 ]
]

var snowflake_perks = [
	[ 3, -5, 9 ],
	[ 2, -5, 10 ],
	[ 2, 11, 11 ],
	[ 2, -6, -6, 12, 12 ],
	[ 2, -6, 13 ],
	[ 2, 14 ],
	[ 1, 1051 ],
	[ 2, 1052 ],
	[ 2, 1053 ]
]

var trap_perks = [
	[ 1, -4 ],
	[ 2, -5, 9 ],
	[ 3, -5, 10 ],
	[ 3, -6, -6, 11, 11 ],
	[ 2, -7, -7, 12, 12 ],
	[ 3, 13, 13 ],
	[ 1, 1000 ],
	[ 1, 1054 ],
	[ 1, 1055 ],
	[ 1, 1056 ]
]

var fh_brain_perks = [
	[ 1, -5, -5 ],
	[ 2, -5, 9 ],
	[ 1, -4, 6 ],
	[ 1, -6, -6, 10, 10, 10 ],
	[ 1, -6, -6, 11, 11, 11 ],
	[ 1, -7, -7, 8, 8 ],
	[ 2, 12 ],
	[ 2, 13, 13 ],
	[ 1, 14 ],
	[ 1, 15, 11 ],
	[ 1, 1000 ],
	[ 1, 1057 ]
]

var fh_four_squares_perks = [
	[ 3, -5, 7 ],
	[ 1, -6, 9, 9 ],
	[ 2, -6, 10 ],
	[ 2, -6, 8 ],
	[ 2, 11, 12 ],
	[ 1, 13, 13, 13, 13 ],
	[ 1, 1001 ],
	[ 1, 1000 ],
	[ 2, 1058 ]
]

var fh_gear_perks = [
	[ 1, -5, -5 ],
	[ 2, -5, 7 ],
	[ 1, -4, 6 ],
	[ 1, -6, 9 ],
	[ 2, -6, 10 ],
	[ 2, -6, 11 ],
	[ 1, -6, -6, 12, 12, 12 ],
	[ 1, 13 ],
	[ 1, 14, 14 ],
	[ 1, 1000, 15, 15 ],
	[ 2, 1059 ]
]

var fh_horns_perks = [
	[ 2, -5, 7 ],
	[ 2, -5, 9, 9, 9 ],
	[ 1, -6, -6, 10, 10 ],
	[ 2, -6, 7, 7 ],
	[ 2, -6, 11 ],
	[ 2, 12 ],
	[ 1, 13, 14 ],
	[ 1, 15 ],
	[ 1, 1001, 16 ],
	[ 1, 1060 ]
]

var fh_kunai_perks = [
	[ 1, -5, -5 ],
	[ 1, -5, 7 ],
	[ 2, -5, 9, 9 ],
	[ 1, -4, 6 ],
	[ 2, -6, 8 ],
	[ 2, -6, -6, 10, 11 ],
	[ 2, 12, 12 ],
	[ 1, 13 ],
	[ 1, 1000 ],
	[ 2, 1061 ]
]

var fh_spiral_perks = [
	[ 1, -4 ],
	[ 2, -5, 7 ],
	[ 1, -5, 9, 10 ],
	[ 1, -5, 11, 12 ],
	[ 1, -6, 13 ],
	[ 1, -6, 14 ],
	[ 1, -6, 15 ],
	[ 1, -6, 16 ],
	[ 2, 17 ],
	[ 2, 18 ],
	[ 1, 1000 ],
	[ 1, 1062 ]
]

var fh_angry_face_perks = [
	[ 1, -4 ],
	[ 4, -5, 7 ],
	[ 2, -6, 9 ],
	[ 1, -6, 10 ],
	[ 1, -6, 11 ],
	[ 1, -6, 12 ],
	[ 1, -6, 13 ],
	[ 2, 14, 14 ],
	[ 1, 1000, 15 ],
	[ 1, 1063 ]
]

var fh_circles_perks = [
	[ 1, -5, -5 ],
	[ 3, -5, 7 ],
	[ 1, -4, 6 ],
	[ 1, -6, -6, 9, 10 ],
	[ 1, -6, -6, 11, 12 ],
	[ 1, -7, -7, 8, 8 ],
	[ 1, 13, 13 ],
	[ 1, 14, 14 ],
	[ 2, 15, 15, 15 ],
	[ 1, 1000, 7, 7 ],
	[ 2, 1064 ]
]

var fh_cthulhu_perks = [
	[ 1, -4 ],
	[ 3, -5, 7 ],
	[ 2, -6, 8 ],
	[ 1, 9, 9, 9 ],
	[ 1, 10, 10, 10 ],
	[ 1, 11, 11 ],
	[ 2, 12 ],
	[ 1, 13, 13 ],
	[ 1, 1000, 7 ],
	[ 2, 1065 ]
]

var fh_eclipse_perks = [
	[ 2, -5, -5 ],
	[ 1, -4, 9 ],
	[ 1, -6, 10 ],
	[ 2, -6, -6, 11, 11, 11 ],
	[ 2, -7, 12 ],
	[ 2, 13 ],
	[ 1, 14, 14 ],
	[ 1, 15, 15 ],
	[ 1, 1000, 7, 7 ],
	[ 2, 1066 ]
]

var fh_lightning_perks = [
	[ 1, -5, -5 ],
	[ 2, -5, 7 ],
	[ 2, -6, 9, 9 ],
	[ 2, -7, 10 ],
	[ 2, 11 ],
	[ 2, 12 ],
	[ 1, 13 ],
	[ 1, 14, 14 ],
	[ 1, 1001 ],
	[ 1, 1067 ]
]

var fh_music_note_perks = [
	[ 2, -5, -5 ],
	[ 1, -4 ],
	[ 1, -5, 9 ],
	[ 1, -6, 10 ],
	[ 1, -6, 11 ],
	[ 1, -6, 12 ],
	[ 1, -6, 13 ],
	[ 1, -6, 14 ],
	[ 1, -6, 15 ],
	[ 2, -7, -7, 16 ],
	[ 1, 17, 17, 17 ],
	[ 1, 18, 18, 18 ],
	[ 1, 1068 ]
]

var fh_phoenix_perks = [
	[ 1, -5, -5 ],
	[ 3, -5, 7 ],
	[ 2, -6, 8 ],
	[ 2, -6, 9 ],
	[ 1, 10, 10 ],
	[ 3, 11, 11 ],
	[ 1, 1000, 12, 12 ],
	[ 2, 1069 ]
]

var fh_saw_perks = [
	[ 1, -4 ],
	[ 3, -5, 9 ],
	[ 2, -6, 8 ],
	[ 2, -6, 10 ],
	[ 1, 11 ],
	[ 2, 12 ],
	[ 1, 13 ],
	[ 2, 14 ],
	[ 1, 1070 ]
]

var fh_sun_perks = [
	[ 1, -6, -6, -6, -6 ],
	[ 2, -5, 9, 9 ],
	[ 2, -5, 10 ],
	[ 1, -6, 8 ],
	[ 2, 11, 11 ],
	[ 1, 12 ],
	[ 2, 13, 13 ],
	[ 1, 1001, 7, 7 ],
	[ 1, 1000 ],
	[ 2, 1071 ]
]

var fh_three_spears_perks = [
	[ 2, -5, -5 ],
	[ 1, -6, -6, 9, 9 ],
	[ 1, -6, 10 ],
	[ 2, -6, 8 ],
	[ 3, 11 ],
	[ 2, 12, 12 ],
	[ 1, 13 ],
	[ 1, 1001, 7, 7 ],
	[ 2, 1072 ]
]

var fh_triforce_perks = [
	[ 2, -5, -5 ],
	[ 1, -4 ],
	[ 1, -6, -6, -6, -6 ],
	[ 1, -5, 9 ],
	[ 1, -6, 10 ],
	[ 1, -6, 11 ],
	[ 1, -7, -7, 8, 8 ],
	[ 1, 12, 12, 12, 12 ],
	[ 1, 13, 13, 13, 13 ],
	[ 1, 14, 14, 14, 14 ],
	[ 1, 15, 15, 15, 15 ],
	[ 1, 1000 ],
	[ 2, 1073 ]
]

var fh_diviner_perks = [
	[ 2, -5, -5 ],
	[ 1, -4 ],
	[ 2, -7, -7, 9 ],
	[ 1, -6, 10 ],
	[ 1, -6, 11 ],
	[ 1, -6, 12 ],
	[ 1, -6, 13 ],
	[ 1, -6, 14 ],
	[ 1, -6, 15 ],
	[ 1, -5, 16 ],
	[ 1, 17, 17 ],
	[ 1, 1000, 7, 7 ],
	[ 1, 1074 ]
]

var fh_bomb_perks = [
	[ 2, -5, -5 ],
	[ 1, -6, -6, -6, -6 ],
	[ 1, -4, 9 ],
	[ 2, -6, 10 ],
	[ 1, -7, 8, 8 ],
	[ 2, -7, 11 ],
	[ 2, -7, 12 ],
	[ 1, 13, 13 ],
	[ 1, 1000, -5 ],
	[ 2, 1075 ]
]

var fh_chain_perks = [
	[ 2, -5, -5 ],
	[ 1, -4 ],
	[ 1, -6, 9 ],
	[ 1, -6, 10 ],
	[ 1, -6, -7, 11, 11 ],
	[ 2, -7, 12 ],
	[ 2, -7, 13 ],
	[ 2, 14 ],
	[ 1, 1001, 7, 7 ],
	[ 2, 1076 ]
]

var fh_hatchet_perks = [
	[ 2, -5, -5 ],
	[ 1, -6, 9 ],
	[ 1, -7, 10 ],
	[ 1, -6, 11 ],
	[ 1, -6, 12 ],
	[ 1, -6, 13 ],
	[ 1, -6, 14 ],
	[ 3, -7, 15 ],
	[ 3, 16 ],
	[ 1, 1077 ]
]

var fh_staff_perks = [
	[ 1, -5, -5 ],
	[ 1, -4 ],
	[ 2, -5, 9 ],
	[ 3, -6, 10 ],
	[ 1, -6, 11 ],
	[ 2, -6, 12 ],
	[ 1, 13, 13 ],
	[ 1, 14, 14 ],
	[ 1, 15 ],
	[ 1, 1000 ],
	[ 1, 1078 ]
]

var equip_perks = [
	[ 5, 1002, 5 ],
	[ 2, 1003, 5 ],
	[ 2, 1004, 5 ],
	[ 3, 1005, 5 ],
	[ 3, 1005, 5 ]
]

var perks_dictionary = {
	"brain" : brain_perks,
	"four_squares" : four_squares_perks,
	"gear" : gear_perks,
	"horns" : horns_perks,
	"kunai" : kunai_perks,
	"spiral" : spiral_perks,
	"angry_face" : angry_face_perks,
	"circles" : circles_perks,
	"cthulhu" : cthulhu_perks,
	"eclipse" : eclipse_perks,
	"lightning" : lightning_perks,
	"music_note" : music_note_perks,
	"phoenix" : phoenix_perks,
	"saw" : saw_perks,
	"sun" : sun_perks,
	"three_spears" : three_spears_perks,
	"triforce" : triforce_perks,
	"diviner" : diviner_perks,
	"bomb" : bomb_perks,
	"chain" : chain_perks,
	"hatchet" : hatchet_perks,
	"staff" : staff_perks,
	"banner" : banner_perks,
	"blade" : blade_perks,
	"skull" : skull_perks,
	"anemone" : anemone_perks,
	"ghost" : ghost_perks,
	"kelp" : kelp_perks,
	"club" : club_perks,
	"fist" : fist_perks,
	"gemini" : gemini_perks,
	"diamond" : diamond_perks,
	"star" : star_perks,
	"drill" : drill_perks,
	"shackles" : shackles_perks,
	"meteor" : meteor_perks,
	"shards" : shards_perks,
	"snowflake" : snowflake_perks,
	"trap" : trap_perks,
	"fh_brain" : fh_brain_perks,
	"fh_four_squares" : fh_four_squares_perks,
	"fh_gear" : fh_gear_perks,
	"fh_horns" : fh_horns_perks,
	"fh_kunai" : fh_kunai_perks,
	"fh_spiral" : fh_spiral_perks,
	"fh_angry_face" : fh_angry_face_perks,
	"fh_circles" : fh_circles_perks,
	"fh_cthulhu" : fh_cthulhu_perks,
	"fh_eclipse" : fh_eclipse_perks,
	"fh_lightning" : fh_lightning_perks,
	"fh_music_note" : fh_music_note_perks,
	"fh_phoenix" : fh_phoenix_perks,
	"fh_saw" : fh_saw_perks,
	"fh_sun" : fh_sun_perks,
	"fh_three_spears" : fh_three_spears_perks,
	"fh_triforce" : fh_triforce_perks,
	"fh_diviner" : fh_diviner_perks,
	"fh_bomb" : fh_bomb_perks,
	"fh_chain" : fh_chain_perks,
	"fh_hatchet" : fh_hatchet_perks,
	"fh_staff" : fh_staff_perks
}

var no_and_dictionary = {
	1002 : true,
	1003 : true,
	1004 : true,
	1005 : true
}


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func has_fh(char_name):
	var test_name = "fh_" + char_name
	return perks_dictionary.has(test_name)


func get_equip_size():
	return equip_perks.size()


func get_char_perks_data(char_name):
	return perks_dictionary.get(char_name, [])


func get_equip_perks_data():
	return equip_perks


func no_after_and(card_code):
	return no_and_dictionary.get(card_code, false)


func get_perks_text(card_code, do_fh):
	if (card_code >= PERKS_EXTRA):
		return EXTRA_TEXT[card_code - PERKS_EXTRA]
	elif (card_code < 0):
		card_code = -card_code
	var perk_text = PERK_TEXT[card_code]
	if (typeof(perk_text) != TYPE_ARRAY):
		return perk_text
	elif (do_fh):
		return perk_text[1]
	else:
		return perk_text[0]

