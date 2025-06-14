extends Node

@onready var gui = $"../.."
@onready var countdown_text: Label = $CountdownText
@onready var timer: Timer = $Timer
@onready var game_over = $"../../GameOver"

func _ready():
	if Global.isCasualMode:
		gui.taskCountdownTimer = 1200
	else:
		gui.taskCountdownTimer = 240
	timer.wait_time = gui.taskCountdownTimer
	timer.start()

func show_timer():
	var time_left: float = timer.time_left
	var minutes: int = floor(time_left/60)
	var seconds: int = int(time_left) % 60
	return [minutes,seconds]

func _process(_delta):
	countdown_text.text = "%02d:%02d" % show_timer()

func _on_timer_timeout():
	Global.isTaskCountdownOver = true
	await get_tree().create_timer(0.5).timeout
	get_tree().paused = true
	game_over.show()
