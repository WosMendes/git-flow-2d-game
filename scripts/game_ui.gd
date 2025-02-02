extends CanvasLayer


@onready var game_manager = %GameManager
@onready var percentage_label = $TaskProgress/PercentageLabel
@onready var commit_count_label = $CommitCount/CommitCountLabel
@onready var branch_name_label = $BranchName/BranchNameLabel

@export var branch_name: String = ""


func _ready():
	branch_name_label.text = branch_name

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	percentage_label.text = str(game_manager.taskProgress) + "%"
	commit_count_label.text = str(game_manager.commits)
