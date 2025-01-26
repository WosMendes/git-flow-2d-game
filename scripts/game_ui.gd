extends CanvasLayer


@onready var game_manager = %GameManager
@onready var percentage_label = $TaskProgress/PercentageLabel

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	percentage_label.text = str(game_manager.taskProgress) + "%"
