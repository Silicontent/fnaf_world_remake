extends Node2D

@onready var dance_player = $DancePlayer
@onready var windmill_player = $WindmillPlayer


func _ready() -> void:
	dance_player.play("play_dancer")
	windmill_player.play("play_windmills")
