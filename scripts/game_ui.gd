extends CanvasLayer


@onready var game_manager = %GameManager
@onready var percentage_label = $TaskProgress/PercentageLabel
@onready var commit_count_label = $CommitCount/CommitCountLabel
@onready var branch_name_label = $BranchName/BranchNameLabel


func _ready():
	branch_name_label.text = game_manager.current_branch

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	percentage_label.text = str(game_manager.taskProgress) + "%"
	commit_count_label.text = str(game_manager.commits)
