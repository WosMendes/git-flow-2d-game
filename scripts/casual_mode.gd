extends Node2D

@onready var casual_mode_button = $CasualModeButton


# Called when the node enters the scene tree for the first time.
func _ready():
	casual_mode_button.button_pressed = Global.isCasualMode


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_casual_mode_button_pressed():
	print("Estou aqui")
	Global.isCasualMode = !Global.isCasualMode
	casual_mode_button.release_focus()
