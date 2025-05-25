extends Button

func _on_pressed():
	if self.text.contains("feature"):
		get_tree().change_scene_to_file("res://scenes/develop_branch.tscn")
	elif self.text.contains("hotfix"):
		get_tree().change_scene_to_file("res://scenes/main_branch.tscn")
