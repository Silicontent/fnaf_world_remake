extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D
@export var speed = 400
@export var in_water = false
@export var starting_pos: Vector2 = Vector2(1683, 135)
var faz_tokens := 0


func _ready() -> void:
	global_position = starting_pos


func _physics_process(_delta: float) -> void:
	var dir = Input.get_vector("player_left", "player_right", "player_up", "player_down")
	velocity = dir * speed
	$Tokens.text = str(faz_tokens)
	display_animation()
	
	move_and_slide()
	
	# DEBUG ONLY
	if Input.is_action_just_pressed("ui_up"):
		$CollisionShape2D.disabled = true
	if Input.is_action_just_pressed("ui_down"):
		$CollisionShape2D.disabled = false


func display_animation() -> void:
	if owner.current_area == 3:
		in_water = true
	else:
		in_water = false
	
	if !in_water:
		if Input.is_action_pressed("player_left"):
			sprite.play("walk_left")
		elif Input.is_action_pressed("player_right"):
			sprite.play("walk_right")
		elif Input.is_action_pressed("player_up"):
			sprite.play("walk_up")
		elif Input.is_action_pressed("player_down"):
			sprite.play("walk_down")
		else:
			sprite.play("idle")
	elif in_water:
		if Input.is_action_pressed("player_left"):
			sprite.play("boat_left")
		elif Input.is_action_pressed("player_right"):
			sprite.play("boat_right")
		elif Input.is_action_pressed("player_up"):
			sprite.play("boat_up")
		elif Input.is_action_pressed("player_down"):
			sprite.play("boat_down")
		else:
			sprite.play("boat_idle")


func change_tokens(amt: int, set_amt: bool) -> void:
	if set_amt:
		faz_tokens = amt
	else:
		faz_tokens += amt
