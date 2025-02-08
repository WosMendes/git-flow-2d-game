extends CanvasLayer

@export var taskCountdownTimer: int = 600

@onready var game_manager = %GameManager
@onready var progress_label = $TaskProgress/ProgressLabel
@onready var percentage_label = $TaskProgress/PercentageLabel
@onready var commit_label = $CommitCount/CommitLabel
@onready var commit_count_label = $CommitCount/CommitCountLabel
@onready var branch_name_label = $BranchName/BranchNameLabel
@onready var timer = $Countdown/Timer
@onready var countdown_text = $Countdown/CountdownText

func _ready():
	if !game_manager.hasToShowProgress:
		percentage_label.hide()
		progress_label.hide()
		commit_label.hide()
		commit_count_label.hide()
		countdown_text.hide()
	branch_name_label.text = game_manager.current_branch

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	percentage_label.text = str(game_manager.taskProgress) + "%"
	commit_count_label.text = str(game_manager.commits)
