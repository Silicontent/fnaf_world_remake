extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D
@export var speed = 400


func _physics_process(_delta: float) -> void:
	var dir = Input.get_vector("player_left", "player_right", "player_up", "player_down")
	velocity = dir * speed
	display_animation()
	
	move_and_slide()
	
	if Input.is_action_just_pressed("ui_up"):
		$CollisionShape2D.disabled = true
	if Input.is_action_just_pressed("ui_down"):
		$CollisionShape2D.disabled = false


func display_animation() -> void:
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