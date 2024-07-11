# deck_data.gd
extends Reference
class_name DeckData


const EFFECTS = [
	"null_curse",
	"double_bless",
	"null",
	"double",
	"minus2",
	"minus1",
	"plus0",
	"plus1",
	"plus2",
	"plus3",
	"plus4",
	"rolling",
	"air",
	"dark",
	"earth",
	"fire",
	"ice",
	"light",
	"pull1",
	"pull2",
	"push1",
	"push2",
	"pierce3",
	"target",
	"poison",
	"wound",
	"immobilize",
	"disarm",
	"stun",
	"muddle",
	"curse",
	"invisible",
	"shield1_ally",
	"shield1_self",
	"heal1_ally",
	"heal1_self",
	"heal2_self",
	"heal3_self",
	"aoe1",
	"refresh",
	"heal2_ally",
	"regen_self",
	"fire_ice",
	"fire_air",
	"fire_earth",
	"fire_light",
	"fire_dark",
	"ice_air",
	"ice_earth",
	"ice_light",
	"ice_dark",
	"air_earth",
	"air_light",
	"air_dark",
	"earth_light",
	"earth_dark",
	"light_dark",
	"push3",
	"retal2",
	"strengthen_ally",
	"brittle",
	"brittle_self",
	"adj_allies",
	"plus2_next",
	"gain_time",
	"plus4_summon",
	"heal1_char",
	"plus2_tide",
	"gain_trophy",
	"token_back",
	"create_icy",
	"wild_wild",
	"move2_summon",
	"transfer",
	"air_earth_dark",
	"to_strong",
	"plus1_infuse",
	"pressure",
	"aoe1_all",
	"curse2",
	"plus1_neg",
	"create_hazard",
	"reveal",
	"heal2_bless_ally",
	"gain_reson",
	"move_dmg1",
	"heal1_ward_ally",
	"heal2_trap",
	"dmg1_trap",
	"addto_trap",
	"pull2_push2"
]

const MAIN_MIN = 4
const MAIN_SKIP = 11
const MAIN_MAX = 90
const LEFT_MIN = 2
const LEFT_SKIP = 11
const LEFT_MAX = 41
const RIGHT_MIN = 11
const RIGHT_MAX = 17

const NULL_CURSE = 0
const DOUBLE_BLESS = 1
const NULL = 2
const DOUBLE = 3

const ACTIVE = 63


var card_textures = []
var side_textures = []
var use_fh_icons = false
var fh_card_textures = []
var fh_side_textures = []
var use_fh_perks = false

var common_deck = [
	[ 0, 0, -1, -1 ], # curse
	[ 0, 1, -1, -1 ], # bless
	[ 1, 2, -1, -1 ], # null
	[ 1, 3, -1, -1 ], # double
	[ 1, 4, -1, -1 ], # -2
	[ 5, 5, -1, -1 ], # -1
	[ 6, 6, -1, -1 ], # +0
	[ 5, 7, -1, -1 ], # +1
	[ 1, 8, -1, -1 ]  # +2
]

var brain_deck = []
var brain_end = [
	[ 0, 8, 16, -1 ],
	[ 0, 7, -1, 11 ],
	[ 0, 18, -1, 11 ],
	[ 0, 29, -1, 11 ],
	[ 0, 26, -1, 11 ],
	[ 0, 28, -1, 11 ],
	[ 0, 27, -1, 11 ]
]

var four_squares_deck = []
var four_squares_end = [
	[ 0, 7, 26, -1 ],
	[ 0, 8, 29, -1 ],
	[ 0, 21, -1, 11 ],
	[ 0, 14, -1, 11 ],
	[ 0, 12, -1, 11 ]
]

var gear_deck = []
var gear_end = [
	[ 0, 9, -1, -1 ],
	[ 0, 15, -1, 11 ],
	[ 0, 29, -1, 11 ],
	[ 0, 7, 25, -1 ],
	[ 0, 7, 26, -1 ],
	[ 0, 7, 36, -1 ],
	[ 0, 23, -1, -1 ]
]

var horns_deck = []
var horns_end = [
	[ 0, 9, -1, -1 ],
	[ 0, 20, -1, 11 ],
	[ 0, 22, -1, 11 ],
	[ 0, 28, -1, 11 ],
	[ 0, 27, -1, 11 ],
	[ 0, 29, -1, 11 ],
	[ 0, 23, -1, 11 ],
	[ 0, 7, 33, -1 ]
]

var kunai_deck = []
var kunai_end = [
	[ 0, 7, -1, 11 ],
	[ 0, 22, -1, 11 ],
	[ 0, 24, -1, 11 ],
	[ 0, 29, -1, 11 ],
	[ 0, 31, -1, 11 ]
]

var spiral_deck = []
var spiral_end = [
	[ 0, 28, -1, -1 ],
	[ 0, 7, 25, -1 ],
	[ 0, 7, 26, -1 ],
	[ 0, 7, 30, -1 ],
	[ 0, 8, 15, -1 ],
	[ 0, 8, 16, -1 ],
	[ 0, 14, -1, 11 ],
	[ 0, 12, -1, 11 ],
	[ 0, 17, -1, 11 ],
	[ 0, 13, -1, 11 ]
]

var angry_face_deck = []
var angry_face_end = [
	[ 0, 7, -1, 11 ],
	[ 0, 8, 29, -1 ],
	[ 0, 7, 24, -1 ],
	[ 0, 7, 25, -1 ],
	[ 0, 7, 26, -1 ],
	[ 0, 28, -1, -1 ],
	[ 0, 23, -1, 11 ]
]

var circles_deck = []
var circles_end = [
	[ 0, 25, -1, 11 ],
	[ 0, 24, -1, 11 ],
	[ 0, 35, -1, 11 ],
	[ 0, 15, -1, 11 ],
	[ 0, 12, -1, 11 ],
	[ 0, 13, -1, 11 ],
	[ 0, 14, -1, 11 ]
]

var cthulhu_deck = []
var cthulhu_end = [
	[ 0, 7, 12, -1 ],
	[ 0, 24, -1, 11 ],
	[ 0, 30, -1, 11 ],
	[ 0, 26, -1, 11 ],
	[ 0, 28, -1, 11 ]
]

var eclipse_deck = []
var eclipse_end = [
	[ 0, 5, 13, -1 ],
	[ 0, 7, 13, -1 ],
	[ 0, 7, 31, -1 ],
	[ 0, 29, -1, 11 ],
	[ 0, 35, -1, 11 ],
	[ 0, 30, -1, 11 ],
	[ 0, 23, -1, 11 ]
]

var lightning_deck = []
var lightning_end = [
	[ 0, 8, -1, 11 ],
	[ 0, 25, -1, 11 ],
	[ 0, 28, -1, 11 ],
	[ 0, 7, 27, 11 ],
	[ 0, 35, -1, 11 ],
	[ 0, 8, 15, -1 ]
]

var music_note_deck = []
var music_note_end = [
	[ 0, 10, -1, -1 ],
	[ 0, 7, 26, -1 ],
	[ 0, 7, 27, -1 ],
	[ 0, 8, 25, -1 ],
	[ 0, 8, 24, -1 ],
	[ 0, 8, 30, -1 ],
	[ 0, 9, 29, -1 ],
	[ 0, 28, -1, -1 ],
	[ 0, 7, -1, 11 ],
	[ 0, 30, -1, 11 ]
]

var phoenix_deck = []
var phoenix_end = [
	[ 0, 7, 25, -1 ],
	[ 0, 7, 26, -1 ],
	[ 0, 35, -1, 11 ],
	[ 0, 14, -1, 11 ]
]

var saw_deck = []
var saw_end = [
	[ 0, 8, -1, 11 ],
	[ 0, 7, 26, -1 ],
	[ 0, 25, -1, 11 ],
	[ 0, 28, -1, 11 ],
	[ 0, 37, -1, 11 ],
	[ 0, 39, -1, -1 ]
]

var sun_deck = []
var sun_end = [
	[ 0, 7, -1, 11 ],
	[ 0, 35, -1, 11 ],
	[ 0, 28, -1, 11 ],
	[ 0, 17, -1, 11 ],
	[ 0, 33, -1, 11 ]
]

var three_spears_deck = []
var three_spears_end = [
	[ 0, 7, -1, 11 ],
	[ 0, 29, -1, 11 ],
	[ 0, 22, -1, 11 ],
	[ 0, 28, -1, 11 ],
	[ 0, 23, -1, 11 ],
	[ 0, 39, -1, -1 ]
]

var triforce_deck = []
var triforce_end = [
	[ 0, 15, -1, -1 ],
	[ 0, 16, -1, -1 ],
	[ 0, 12, -1, -1 ],
	[ 0, 14, -1, -1 ],
	[ 0, 7, 20, -1 ],
	[ 0, 7, 25, -1 ],
	[ 0, 28, -1, -1 ],
	[ 0, 23, -1, -1 ]
]

var diviner_deck = []
var diviner_end = [
	[ 0, 9, 33, -1 ],
	[ 0, 7, 32, -1 ],
	[ 0, 8, 13, -1 ],
	[ 0, 8, 17, -1 ],
	[ 0, 9, 29, -1 ],
	[ 0, 8, 30, -1 ],
	[ 0, 8, 41, -1 ],
	[ 0, 7, 40, -1 ],
	[ 0, 35, -1, 11 ],
	[ 0, 30, -1, 11 ]
]

var bomb_deck = []
var bomb_end = [
	[ 0, 8, 29, -1 ],
	[ 0, 24, -1, -1 ],
	[ 0, 8, 14, -1 ],
	[ 0, 8, 15, -1 ],
	[ 0, 38, 6, -1 ]
]

var chain_deck = []
var chain_end = [
	[ 0, 8, 15, -1 ],
	[ 0, 8, 17, -1 ],
	[ 0, 7, 15, 17 ],
	[ 0, 7, 33, -1 ],
	[ 0, 7, 26, -1 ],
	[ 0, 7, 25, -1 ]
]

var hatchet_deck = []
var hatchet_end = [
	[ 0, 8, 29, -1 ],
	[ 0, 7, 24, -1 ],
	[ 0, 7, 25, -1 ],
	[ 0, 7, 26, -1 ],
	[ 0, 7, 21, -1 ],
	[ 0, 28, -1, -1 ],
	[ 0, 7, 28, -1 ],
	[ 0, 8, 12, -1 ],
	[ 0, 9, -1, -1 ]
]

var staff_deck = []
var staff_end = [
	[ 0, 7, 13, -1 ],
	[ 0, 7, 16, -1 ],
	[ 0, 34, -1, -1 ],
	[ 0, 7, 34, -1 ],
	[ 0, 7, 24, -1 ],
	[ 0, 9, -1, -1 ],
	[ 0, 7, 30, -1 ]
]

var monsters_deck = []
var monsters_end = []

var banner_deck = []
var banner_end = [
	[ 0, 33, -1, 11 ],
	[ 0, 62, 7, -1 ],
	[ 0, 27, 7, -1 ],
	[ 0, 20, 8, -1 ],
	[ 0, 7, -1, 11 ],
	[ 0, 35, -1, 11 ]
]

var blade_deck = []
var blade_end = [
	[ 0, 25, 6, -1 ],
	[ 0, 26, 7, -1 ],
	[ 0, 63, -1, 11 ],
	[ 0, 64, 5, -1 ],
	[ 0, 41, 8, 11 ]
]

var skull_deck = []
var skull_end = [
	[ 0, 30, 6, -1 ],
	[ 0, 24, 6, -1 ],
	[ 0, 65, 7, -1 ],
	[ 0, 66, -1, 11 ],
	[ 0, 55, 8, -1 ]
]

var anemone_deck = []
var anemone_end = [
	[ 0, 22, -1, 11 ],
	[ 0, 23, 6, -1 ],
	[ 0, 33, 7, 11 ],
	[ 0, 67, 7, -1 ],
	[ 0, 29, 8, -1 ],
	[ 0, 27, 7, -1 ],
	[ 0, 35, -1, 11 ]
]

var ghost_deck = []
var ghost_end = [
	[ 0, 30, 7, -1 ],
	[ 0, 13, 8, -1 ],
	[ 0, 27, -1, 11 ],
	[ 0, 29, -1, 11 ],
	[ 0, 34, -1, 11 ]
]

var kelp_deck = []
var kelp_end = [
	[ 0, 27, 6, -1 ],
	[ 0, 28, 5, -1 ],
	[ 0, 31, 6, -1 ],
	[ 0, 22, -1, 11 ],
	[ 0, 30, 7, -1 ],
	[ 0, 68, 7, -1 ]
]

var club_deck = []
var club_end = [
	[ 0, 69, 6, -1 ],
	[ 0, 22, -1, 11 ],
	[ 0, 21, -1, 11 ],
	[ 0, 9, -1, -1 ],
	[ 0, 26, 8, -1 ],
	[ 0, 35, -1, 11 ]
]

var fist_deck = []
var fist_end = [
	[ 0, 27, 6, -1 ],
	[ 0, 33, 7, 11 ],
	[ 0, 48, 7, -1 ],
	[ 0, 70, 8, -1 ],
	[ 0, 9, -1, -1 ],
	[ 0, 35, -1, 11 ]
]

var gemini_deck = []
var gemini_end = [
	[ 0, 71, 6, -1 ],
	[ 0, 24, 7, -1 ],
	[ 0, 25, 7, -1 ],
	[ 0, 22, -1, 11 ],
	[ 0, 57, 7, -1 ],
	[ 0, 61, 3, -1 ],
	[ 0, 41, 7, 11 ]
]

var diamond_deck = []
var diamond_end = [
	[ 0, 72, 6, -1 ],
	[ 0, 73, 7, -1 ],
	[ 0, 35, 7, -1 ],
	[ 0, 29, 8, -1 ],
	[ 0, 24, -1, 11 ],
	[ 0, 25, -1, 11 ]
]

var star_deck = []
var star_end = [
	[ 0, 74, 5, -1 ],
	[ 0, 51, 6, -1 ],
	[ 0, 53, 6, -1 ],
	[ 0, 55, 6, -1 ],
	[ 0, 75, -1, 11 ],
	[ 0, 76, -1, 11 ]
]

var drill_deck = []
var drill_end = [
	[ 0, 77, 6, -1 ],
	[ 0, 33, -1, 11 ],
	[ 0, 78, 6, -1 ],
	[ 0, 22, -1, 11 ],
	[ 0, 58, -1, 11 ],
	[ 0, 36, 7, -1 ],
	[ 0, 9, -1, -1 ]
]

var shackles_deck = []
var shackles_end = [
	[ 0, 79, 4, -1 ],
	[ 0, 27, 6, -1 ],
	[ 0, 43, 7, -1 ],
	[ 0, 30, 7, -1 ],
	[ 0, 35, -1, 11 ],
	[ 0, 80, 6, -1 ]
]

var meteor_deck = []
var meteor_end = [
	[ 0, 25, 7, -1 ],
	[ 0, 81, 6, -1 ],
	[ 0, 21, -1, 11 ],
	[ 0, 44, 7, -1 ],
	[ 0, 29, 7, 11 ]
]

var shards_deck = []
var shards_end = [
	[ 0, 82, 6, -1 ],
	[ 0, 28, 5, -1 ],
	[ 0, 60, 6, -1 ],
	[ 0, 52, 8, -1 ],
	[ 0, 83, -1, 11 ],
	[ 0, 84, 7, -1 ]
]

var snowflake_deck = []
var snowflake_end = [
	[ 0, 34, 6, -1 ],
	[ 0, 26, 6, -1 ],
	[ 0, 47, 7, -1 ],
	[ 0, 85, -1, 11 ],
	[ 0, 59, 7, -1 ],
	[ 0, 86, -1, 11 ]
]

var trap_deck = []
var trap_end = [
	[ 0, 87, 6, -1 ],
	[ 0, 88, 6, -1 ],
	[ 0, 89, 6, -1 ],
	[ 0, 26, 8, -1 ],
	[ 0, 90, -1, 11 ]
]

var fh_brain_deck = []
var fh_brain_end = [
	[ 0, 26, 6, 11 ],
	[ 0, 20, 6, 11 ],
	[ 0, 29, 6, 11 ],
	[ 0, 16, 8, -1 ],
	[ 0, 7, -1, 11 ],
	[ 0, 28, 6, 11 ],
	[ 0, 27, 6, 11 ]
]

var fh_four_squares_deck = []
var fh_four_squares_end = [
	[ 0, 21, 6, 11 ],
	[ 0, 26, 7, -1 ],
	[ 0, 29, 8, -1 ],
	[ 0, 12, 6, 11 ],
	[ 0, 14, 6, 11 ]
]

var fh_gear_deck = []
var fh_gear_end = [
	[ 0, 23, 6, -1 ],
	[ 0, 25, 7, -1 ],
	[ 0, 26, 7, -1 ],
	[ 0, 29, 6, 11 ],
	[ 0, 9, -1, -1 ],
	[ 0, 36, 7, -1 ],
	[ 0, 15, 6, 11 ]
]

var fh_horns_deck = []
var fh_horns_end = [
	[ 0, 20, 6, 11 ],
	[ 0, 22, 6, 11 ],
	[ 0, 23, 6, 11 ],
	[ 0, 28, 6, 11 ],
	[ 0, 27, 6, 11 ],
	[ 0, 29, 6, 11 ],
	[ 0, 9, -1, -1 ],
	[ 0, 33, 7, -1 ]
]

var fh_kunai_deck = []
var fh_kunai_end = [
	[ 0, 24, 6, 11 ],
	[ 0, 29, 6, 11 ],
	[ 0, 22, 6, 11 ],
	[ 0, 7, -1, 11 ],
	[ 0, 31, 6, 11 ]
]

var fh_spiral_deck = []
var fh_spiral_end = [
	[ 0, 12, 6, 11 ],
	[ 0, 14, 6, 11 ],
	[ 0, 17, 6, 11 ],
	[ 0, 13, 6, 11 ],
	[ 0, 25, 7, -1 ],
	[ 0, 26, 7, -1 ],
	[ 0, 28, 7, -1 ],
	[ 0, 30, 7, -1 ],
	[ 0, 15, 8, -1 ],
	[ 0, 16, 8, -1 ]
]

var fh_angry_face_deck = []
var fh_angry_face_end = [
	[ 0, 23, 6, 11 ],
	[ 0, 28, 6, -1 ],
	[ 0, 25, 7, -1 ],
	[ 0, 24, 7, -1 ],
	[ 0, 29, 8, -1 ],
	[ 0, 7, -1, 11 ],
	[ 0, 26, 7, -1 ]
]

var fh_circles_deck = []
var fh_circles_end = [
	[ 0, 15, 6, 11 ],
	[ 0, 14, 6, 11 ],
	[ 0, 12, 6, 11 ],
	[ 0, 13, 6, 11 ],
	[ 0, 25, 6, 11 ],
	[ 0, 24, 6, 11 ],
	[ 0, 35, 6, 11 ]
]

var fh_cthulhu_deck = []
var fh_cthulhu_end = [
	[ 0, 12, 7, -1 ],
	[ 0, 24, 6, 11 ],
	[ 0, 26, 6, 11 ],
	[ 0, 28, 6, 11 ],
	[ 0, 30, 6, 11 ]
]

var fh_eclipse_deck = []
var fh_eclipse_end = [
	[ 0, 13, 5, -1 ],
	[ 0, 23, 6, 11 ],
	[ 0, 29, 6, 11 ],
	[ 0, 31, 7, -1 ],
	[ 0, 13, 7, -1 ],
	[ 0, 30, 6, 11 ],
	[ 0, 35, 6, 11 ]
]

var fh_lightning_deck = []
var fh_lightning_end = [
	[ 0, 25, 6, 11 ],
	[ 0, 8, -1, 11 ],
	[ 0, 15, 8, -1 ],
	[ 0, 28, 6, 11 ],
	[ 0, 27, 7, 11 ],
	[ 0, 35, 6, 11 ]
]

var fh_music_note_deck = []
var fh_music_note_end = [
	[ 0, 28, 6, -1 ],
	[ 0, 26, 7, -1 ],
	[ 0, 27, 7, -1 ],
	[ 0, 25, 8, -1 ],
	[ 0, 24, 8, -1 ],
	[ 0, 30, 8, -1 ],
	[ 0, 29, 9, -1 ],
	[ 0, 10, -1, -1 ],
	[ 0, 7, -1, 11 ],
	[ 0, 30, 6, 11 ]
]

var fh_phoenix_deck = []
var fh_phoenix_end = [
	[ 0, 25, 7, -1 ],
	[ 0, 26, 7, -1 ],
	[ 0, 35, 6, 11 ],
	[ 0, 14, 6, 11 ]
]

var fh_saw_deck = []
var fh_saw_end = [
	[ 0, 25, 6, 11 ],
	[ 0, 26, 7, -1 ],
	[ 0, 39, 6, -1 ],
	[ 0, 8, -1, 11 ],
	[ 0, 28, 6, 11 ],
	[ 0, 37, 6, 11 ]
]

var fh_sun_deck = []
var fh_sun_end = [
	[ 0, 17, 6, 11 ],
	[ 0, 33, 6, 11 ],
	[ 0, 7, -1, 11 ],
	[ 0, 28, 6, 11 ],
	[ 0, 35, 6, 11 ]
]

var fh_three_spears_deck = []
var fh_three_spears_end = [
	[ 0, 22, 6, 11 ],
	[ 0, 23, 6, -1 ],
	[ 0, 39, 6, -1 ],
	[ 0, 7, -1, 11 ],
	[ 0, 28, 6, 11 ]
]

var fh_triforce_deck = []
var fh_triforce_end = [
	[ 0, 23, 6, -1 ],
	[ 0, 28, 6, -1 ],
	[ 0, 25, 7, -1 ],
	[ 0, 15, 6, -1 ],
	[ 0, 16, 6, -1 ],
	[ 0, 12, 6, -1 ],
	[ 0, 14, 6, -1 ]
]

var fh_diviner_deck = []
var fh_diviner_end = [
	[ 0, 33, 9, -1 ],
	[ 0, 32, 7, -1 ],
	[ 0, 13, 8, -1 ],
	[ 0, 17, 8, -1 ],
	[ 0, 29, 9, -1 ],
	[ 0, 30, 8, -1 ],
	[ 0, 41, 8, -1 ],
	[ 0, 40, 7, -1 ],
	[ 0, 30, 6, 11 ]
]

var fh_bomb_deck = []
var fh_bomb_end = [
	[ 0, 24, 6, -1 ],
	[ 0, 29, 8, -1 ],
	[ 0, 15, 8, -1 ],
	[ 0, 14, 8, -1 ],
	[ 0, 38, 6, -1 ]
]

var fh_chain_deck = []
var fh_chain_end = [
	[ 0, 25, 7, -1 ],
	[ 0, 26, 7, -1 ],
	[ 0, 33, 7, -1 ],
	[ 0, 15, 8, -1 ],
	[ 0, 17, 8, -1 ],
	[ 0, 45, 7, -1 ]
]

var fh_hatchet_deck = []
var fh_hatchet_end = [
	[ 0, 28, 6, -1 ],
	[ 0, 28, 7, -1 ],
	[ 0, 25, 7, -1 ],
	[ 0, 24, 7, -1 ],
	[ 0, 26, 7, -1 ],
	[ 0, 29, 8, -1 ],
	[ 0, 9, -1, -1 ],
	[ 0, 12, 8, -1 ]
]

var fh_staff_deck = []
var fh_staff_end = [
	[ 0, 34, 6, -1 ],
	[ 0, 34, 7, -1 ],
	[ 0, 24, 7, -1 ],
	[ 0, 30, 7, -1 ],
	[ 0, 16, 7, -1 ],
	[ 0, 13, 7, -1 ],
	[ 0, 9, -1, -1 ]
]

var deck_dictionary = {
	"brain" : brain_deck,
	"four_squares" : four_squares_deck,
	"gear" : gear_deck,
	"horns" : horns_deck,
	"kunai" : kunai_deck,
	"spiral" : spiral_deck,
	"angry_face" : angry_face_deck,
	"circles" : circles_deck,
	"cthulhu" : cthulhu_deck,
	"eclipse" : eclipse_deck,
	"lightning" : lightning_deck,
	"music_note" : music_note_deck,
	"phoenix" : phoenix_deck,
	"saw" : saw_deck,
	"sun" : sun_deck,
	"three_spears" : three_spears_deck,
	"triforce" : triforce_deck,
	"diviner" : diviner_deck,
	"bomb" : bomb_deck,
	"chain" : chain_deck,
	"hatchet" : hatchet_deck,
	"staff" : staff_deck,
	"monsters" : monsters_deck,
	"banner" : banner_deck,
	"blade" : blade_deck,
	"skull" : skull_deck,
	"anemone" : anemone_deck,
	"ghost" : ghost_deck,
	"kelp" : kelp_deck,
	"club" : club_deck,
	"fist" : fist_deck,
	"gemini" : gemini_deck,
	"diamond" : diamond_deck,
	"star" : star_deck,
	"drill" : drill_deck,
	"shackles" : shackles_deck,
	"meteor" : meteor_deck,
	"shards" : shards_deck,
	"snowflake" : snowflake_deck,
	"trap" : trap_deck,
	"fh_brain" : fh_brain_deck,
	"fh_four_squares" : fh_four_squares_deck,
	"fh_gear" : fh_gear_deck,
	"fh_horns" : fh_horns_deck,
	"fh_kunai" : fh_kunai_deck,
	"fh_spiral" : fh_spiral_deck,
	"fh_angry_face" : fh_angry_face_deck,
	"fh_circles" : fh_circles_deck,
	"fh_cthulhu" : fh_cthulhu_deck,
	"fh_eclipse" : fh_eclipse_deck,
	"fh_lightning" : fh_lightning_deck,
	"fh_music_note" : fh_music_note_deck,
	"fh_phoenix" : fh_phoenix_deck,
	"fh_saw" : fh_saw_deck,
	"fh_sun" : fh_sun_deck,
	"fh_three_spears" : fh_three_spears_deck,
	"fh_triforce" : fh_triforce_deck,
	"fh_diviner" : fh_diviner_deck,
	"fh_bomb" : fh_bomb_deck,
	"fh_chain" : fh_chain_deck,
	"fh_hatchet" : fh_hatchet_deck,
	"fh_staff" : fh_staff_deck
}

var end_dictionary = {
	"brain" : brain_end,
	"four_squares" : four_squares_end,
	"gear" : gear_end,
	"horns" : horns_end,
	"kunai" : kunai_end,
	"spiral" : spiral_end,
	"angry_face" : angry_face_end,
	"circles" : circles_end,
	"cthulhu" : cthulhu_end,
	"eclipse" : eclipse_end,
	"lightning" : lightning_end,
	"music_note" : music_note_end,
	"phoenix" : phoenix_end,
	"saw" : saw_end,
	"sun" : sun_end,
	"three_spears" : three_spears_end,
	"triforce" : triforce_end,
	"diviner" : diviner_end,
	"bomb" : bomb_end,
	"chain" : chain_end,
	"hatchet" : hatchet_end,
	"staff" : staff_end,
	"monsters" : monsters_end,
	"banner" : banner_end,
	"blade" : blade_end,
	"skull" : skull_end,
	"anemone" : anemone_end,
	"ghost" : ghost_end,
	"kelp" : kelp_end,
	"club" : club_end,
	"fist" : fist_end,
	"gemini" : gemini_end,
	"diamond" : diamond_end,
	"star" : star_end,
	"drill" : drill_end,
	"shackles" : shackles_end,
	"meteor" : meteor_end,
	"shards" : shards_end,
	"snowflake" : snowflake_end,
	"trap" : trap_end,
	"fh_brain" : fh_brain_end,
	"fh_four_squares" : fh_four_squares_end,
	"fh_gear" : fh_gear_end,
	"fh_horns" : fh_horns_end,
	"fh_kunai" : fh_kunai_end,
	"fh_spiral" : fh_spiral_end,
	"fh_angry_face" : fh_angry_face_end,
	"fh_circles" : fh_circles_end,
	"fh_cthulhu" : fh_cthulhu_end,
	"fh_eclipse" : fh_eclipse_end,
	"fh_lightning" : fh_lightning_end,
	"fh_music_note" : fh_music_note_end,
	"fh_phoenix" : fh_phoenix_end,
	"fh_saw" : fh_saw_end,
	"fh_sun" : fh_sun_end,
	"fh_three_spears" : fh_three_spears_end,
	"fh_triforce" : fh_triforce_end,
	"fh_diviner" : fh_diviner_end,
	"fh_bomb" : fh_bomb_end,
	"fh_chain" : fh_chain_end,
	"fh_hatchet" : fh_hatchet_end,
	"fh_staff" : fh_staff_end
}


func fill_in_decks():
	var use_deck
	var use_end
	for use_name in deck_dictionary:
		use_deck = deck_dictionary[use_name]
		use_deck.append_array(common_deck)
		use_end = end_dictionary[use_name]
		use_deck.append_array(use_end)


func make_default_deck(name):
	var deck
	var use_name
	if (name != null) && (use_fh_perks):
		use_name = "fh_" + name
		if (deck_dictionary.has(use_name) == false):
			use_name = name
	else:
		use_name = name
	if (deck_dictionary.has(use_name)):
		deck = deck_dictionary[use_name].duplicate(true)
	else:
		deck = monsters_deck.duplicate(true)
	return deck


func fill_in_textures():
	if card_textures.empty():
		var card_path
		var card_texture
		var side_path
		var side_texture
		for name in EFFECTS:
			card_path = "res://" + name + "_card.png"
			if (ResourceLoader.exists(card_path)):
				card_texture = load(card_path)
			else:
				card_texture = null
			card_textures.append(card_texture)
			
			side_path = "res://" + name + ".png"
			if (ResourceLoader.exists(side_path)):
				side_texture = load(side_path)
			else:
				side_texture = null
			side_textures.append(side_texture)
			
			card_path = "res://fh_" + name + "_card.png"
			if (ResourceLoader.exists(card_path)):
				card_texture = load(card_path)
			else:
				card_texture = null
			fh_card_textures.append(card_texture)
			
			side_path = "res://fh_" + name + ".png"
			if (ResourceLoader.exists(side_path)):
				side_texture = load(side_path)
			else:
				side_texture = null
			fh_side_textures.append(side_texture)


func get_card_texture(index):
	if (index < 0) || (index >= card_textures.size()):
		return null
	elif (use_fh_icons) && (fh_card_textures[index] != null):
		return fh_card_textures[index]
	else:
		return card_textures[index]


func get_side_texture(index):
	if (index < 0) || (index >= side_textures.size()):
		return null
	elif (use_fh_icons) && (fh_side_textures[index] != null):
		return fh_side_textures[index]
	else:
		return side_textures[index]


func swap_fh_icons(do_fh):
	use_fh_icons = do_fh


func swap_fh_perks(do_fh):
	use_fh_perks = do_fh


func is_active(effect):
	return (effect == ACTIVE)

