extends Reference
class_name CharData


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


const ICONS = [
	"brain",
	"four_squares",
	"gear",
	"horns",
	"kunai",
	"spiral",
	"angry_face",
	"circles",
	"cthulhu",
	"eclipse",
	"lightning",
	"music_note",
	"phoenix",
	"saw",
	"sun",
	"three_spears",
	"triforce",
	"diviner",
	"bomb",
	"chain",
	"hatchet",
	"staff",
	"monsters",
	"banner",
	"blade",
	"skull",
	"anemone",
	"ghost",
	"kelp",
	"club",
	"fist",
	"gemini",
	"diamond",
	"star",
	"drill",
	"shackles",
	"meteor",
	"shards",
	"snowflake",
	"trap"
]


var icon_textures = {}


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func fill_in_textures():
	if icon_textures.empty():
		for name in ICONS:
			var path = "res://wh_" + name + ".png"
			var texture = load(path)
			icon_textures[name] = texture


func get_texture(name):
	return icon_textures[name]

