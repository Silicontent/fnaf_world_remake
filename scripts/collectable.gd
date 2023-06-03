extends Area2D

@export var item_id: int
# TODO: consider changing to a ref to sprite instead of value
# reasoning: value doesn't have any other use except for appearance
@export var rarity: int
@export var is_chip: bool


func _ready() -> void:
	randomize()
	if !is_chip:
		# random chance between 0 and 9
		var r = randi() % 10
		if r == 0:
			# TODO: set sprite to gold token chest
			pass
		else:
			# TODO: set sprite to gray token chest
			pass
