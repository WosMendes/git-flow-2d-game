extends Node2D

@onready var game_manager = %GameManager
@onready var hint_label: Label = $HintLabel
@onready var confirmation_dialog = $ConfirmationDialog
@onready var terminal_line = $ConfirmationDialog/TerminalLine
@onready var command_status = $ConfirmationDialog/CommandStatus



# Called when the node enters the scene tree for the first time.
func _ready():
	hint_label.hide()
	confirmation_dialog.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("open_terminal") and hint_label.visible == true:
		confirmation_dialog.show()
		terminal_line.grab_focus()
		game_manager.isOnDialogueFocus = true


func _on_area_2d_body_entered(_body):
	hint_label.show()
	

func _on_area_2d_body_exited(_body):
	hint_label.hide()

	

func _on_confirmation_dialog_close_requested():
	_resetTerminalValues()
	game_manager.isOnDialogueFocus = false


func _on_confirmation_dialog_canceled():
	_resetTerminalValues()
	game_manager.isOnDialogueFocus = false


func _on_confirmation_dialog_confirmed():
	if terminal_line.text == "git push origin " + game_manager.current_branch:
		command_status.text = "Status: SUCESSO!"
		confirmation_dialog.gui_disable_input = true
		await get_tree().create_timer(2).timeout
		game_manager.isOnDialogueFocus = false
		game_manager.addProgress(game_manager.commits * game_manager.progress_by_commit)
		game_manager.commits = 0
		_resetTerminalValues()
		confirmation_dialog.hide()
		game_manager.goToNextLevel()
	elif terminal_line.text == "git checkout tutorial":
		game_manager.current_branch = "tutorial"
		command_status.text = "Status: SUCESSO!"
		confirmation_dialog.gui_disable_input = true
		await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_file("res://scenes/tutorial_branch.tscn")
	else:
		command_status.text = "Status: Comando incorreto!"
		terminal_line.text = ""

func _resetTerminalValues():
	command_status.text = "Status: Aguardando comando..."
	terminal_line.text = ""
	confirmation_dialog.gui_disable_input = false
