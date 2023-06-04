extends Area2D

@export var item_id: int
@export_range(0, 2) var rarity: int
@export var token_reward: int
@export var is_chip: bool
@export var appearance: Resource
@onready var sprite := $Sprite2D


func _ready() -> void:
	randomize()
	# set sprites and token amounts depending on if the chest contains tokens or a chip
	if !is_chip:
		item_id = -1
		# random chance between 0 and 9
		var r = randi() % 10
		
		if r == 0:
			appearance = load("res://assets/overworld/interactables/chests/small_gold_chest.png")
			token_reward = 50
		elif r >= 1 and r <= 5:
			appearance = load("res://assets/overworld/interactables/chests/small_silver_chest.png")
			token_reward = 10
		else:
			queue_free()
	elif is_chip:
		match rarity:
			0:
				appearance = load("res://assets/overworld/interactables/chests/large_silver_chest.png")
			1:
				appearance = load("res://assets/overworld/interactables/chests/large_gold_chest.png")
			2:
				appearance = load("res://assets/overworld/interactables/chests/red_chest.png")
				set_collision_mask_value(1, false)
				set_collision_mask_value(7, true)
				z_index = 2
	
	sprite.texture = appearance


func _on_body_entered(body):
	if !is_chip:
		body.change_tokens(token_reward, false)
	
	queue_free()
