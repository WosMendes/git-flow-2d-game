extends Area2D

@onready var timer = $Timer


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("You DIED!!!")
	timer.start()


func _on_timer_timeout():
	get_tree().reload_current_scene()
