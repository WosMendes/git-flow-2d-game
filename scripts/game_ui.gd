extends CanvasLayer

@export var taskCountdownTimer: int = 600

@onready var game_manager = %GameManager
@onready var progress_label = $PanelContainer/TaskProgress/ProgressLabel
@onready var percentage_label = $PanelContainer/TaskProgress/PercentageLabel
@onready var codeBlock_label = $PanelContainer/CodeBlockCount/CodeBlockLabel
@onready var codeBlock_count_label = $PanelContainer/CodeBlockCount/CodeBlockCountLabel
@onready var branch_name_label = $PanelContainer/BranchName/BranchNameLabel
@onready var timer = $PanelContainer/Countdown/Timer
@onready var countdown_text = $PanelContainer/Countdown/CountdownText

func _ready():
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
