extends Node

@onready var countdown_text: Label = $CountdownText
@onready var timer: Timer = $Timer

func _ready():
	timer.start()
	

func show_timer():
	var time_left: float = timer.time_left
	var minutes: int = floor(time_left/60)
	var seconds: int = int(time_left) % 60
	return [minutes,seconds]

func _process(delta):
	countdown_text.text = "%02d:%02d" % show_timer()

func _on_timer_timeout():
	pass # Replace with function body.
