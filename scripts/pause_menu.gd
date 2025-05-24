extends Control

func _process(_delta):
	buttonAction()

func resume():
	get_tree().paused = false
	self.visible = false
	
func pause():
	get_tree().paused = true
	self.visible = true

func buttonAction():
	if Input.is_action_just_pressed("pause_game") and !get_tree().paused and !Global.is_terminal_on_screen:
		pause()
	elif Input.is_action_just_pressed("pause_game") and get_tree().paused and !Global.is_terminal_on_screen:
		resume()

func _on_continue_button_pressed():
	resume()


func _on_main_menu_button_pressed():
	resume()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
