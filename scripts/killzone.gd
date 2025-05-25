extends Area2D

@onready var timer = $Timer

signal playerDied

func _on_body_entered(body):
	print("You DIED!!!")
	Engine.time_scale = 0.4
	body.get_node("CollisionShape2D").set_deferred("disabled", true)
	timer.start()


func _on_timer_timeout():
	Engine.time_scale = 1
	playerDied.emit()
