extends CanvasLayer

var taskCountdownTimer: int = 240

@onready var game_manager = %GameManager
@onready var progress_label = $PanelContainer/TaskProgress/ProgressLabel
@onready var percentage_label = $PanelContainer/TaskProgress/PercentageLabel
@onready var codeBlock_label = $PanelContainer/CodeBlockCount/CodeBlockLabel
@onready var codeBlock_count_label = $PanelContainer/CodeBlockCount/CodeBlockCountLabel
@onready var branch_name_label = $PanelContainer/BranchName/BranchNameLabel
@onready var timer = $PanelContainer/Countdown/Timer
@onready var countdown_text = $PanelContainer/Countdown/CountdownText
@onready var sound_button = $PanelContainer/SoundButton/SoundButton

var master_bus = AudioServer.get_bus_index("Master")


func _ready():
	#if Global.isCasualMode:
		#print("if")
		#taskCountdownTimer = 1200
	#else:
		#print("else")
		#taskCountdownTimer = 240
	if Global.isSoundOff:
		sound_button.button_pressed = false
	else:
		sound_button.button_pressed = true
		
	if !game_manager.hasToShowProgress:
		percentage_label.hide()
		progress_label.hide()
		codeBlock_label.hide()
		codeBlock_count_label.hide()
		countdown_text.hide()
	branch_name_label.text = game_manager.current_branch

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	percentage_label.text = str(game_manager.taskProgress) + "%"
	codeBlock_count_label.text = str(game_manager.codeBlocks)


func _on_sound_button_pressed():
	Global.isSoundOff = !Global.isSoundOff
	AudioServer.set_bus_mute(master_bus, not AudioServer.is_bus_mute(master_bus))
	sound_button.release_focus()
