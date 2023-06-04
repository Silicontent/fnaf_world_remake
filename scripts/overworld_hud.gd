extends CanvasLayer

@onready var header = $AreaHeader

var area_headers = [
	"res://assets/ui/headers/fazbear_hills.png",
	"res://assets/ui/headers/choppy_woods.png",
	"res://assets/ui/headers/dusting_fields.png",
	"res://assets/ui/headers/lilygear_lake.png",
	"res://assets/ui/headers/blacktomb_yard.png",
	"res://assets/ui/headers/pinwheel_circus.png",
	"res://assets/ui/headers/mysterious_mine.png",
	"res://assets/ui/headers/deep_metal_mine.png",
	"res://assets/ui/headers/pinwheel_funhouse.png",
	"res://assets/ui/headers/glitch_layer.png",
	"res://assets/ui/headers/geist_lair.png"
]


func _process(_delta: float) -> void:
	header.texture = load(area_headers[owner.current_area])
