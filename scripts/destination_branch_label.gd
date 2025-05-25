extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	if (Global.current_branch_name.contains("feature")):
		self.text = "develop"
	elif (Global.current_branch_name.contains("hotfix")):
		self.text = "main"
