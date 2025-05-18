extends Area2D

@onready var game_manager = %GameManager
@onready var animation_player = $AnimationPlayer

func _on_body_entered(_body):
	game_manager.addCodeBlock()
	animation_player.play("pickup_animation")
# x = -936
