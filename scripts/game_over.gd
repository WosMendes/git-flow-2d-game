extends CanvasLayer

@onready var retry_button = $RetryButton


# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()


func _on_retry_button_pressed():
	Global.isTaskCountdownOver = false
	get_tree().paused = false
	get_tree().reload_current_scene()
