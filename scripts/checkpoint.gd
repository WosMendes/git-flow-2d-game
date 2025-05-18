extends Area2D

@export var checkPointPositon: Marker2D
@export var initialPosition: Marker2D

func _on_body_entered(_body):
	print("CheckPOINT!!!")
	initialPosition.global_position = checkPointPositon.global_position
