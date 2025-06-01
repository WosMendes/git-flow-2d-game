extends Node2D

@onready var game_manager = %GameManager
@onready var progress_bar = $ProgressBar
@onready var hint_label = $HintLabel
@onready var audio_stream_player_2d = $AudioStreamPlayer2D


@export var fix_bar_fill_speed: float = 0.5

var fill_style: StyleBoxFlat
var green_color = Color(0, 1, 0) # Verde

# Called when the node enters the scene tree for the first time.
func _ready():
	hint_label.hide()
	fill_style = progress_bar.get_theme_stylebox("fill") as StyleBoxFlat
	Global.isHotfixComplete = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("fix_bugs") and hint_label.visible == true:
		if progress_bar.value == progress_bar.max_value:
			return
		progress_bar.value += fix_bar_fill_speed * delta
		hint_label.text = "Corrigindo..."
		if progress_bar.value >= progress_bar.max_value:
			progress_bar.value = progress_bar.max_value
			fill_style.bg_color = green_color
			audio_stream_player_2d.play()
			game_manager.codeBlocks = 0
			Global.isHotfixComplete = true
			hint_label.text = "Bugs\n Corrigidos!"
	elif progress_bar.value < progress_bar.max_value:
		hint_label.text = "Segure F"


func _on_area_2d_body_entered(_body):
	hint_label.show()


func _on_area_2d_body_exited(_body):
	hint_label.hide()
