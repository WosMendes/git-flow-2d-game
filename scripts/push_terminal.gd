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
		Global.is_terminal_on_screen = true
	if Input.is_action_just_pressed("command_confirmation") and terminal_line.has_focus():
		confirmation_dialog.emit_signal("confirmed")


func _on_area_2d_body_entered(_body):
	hint_label.show()
	

func _on_area_2d_body_exited(_body):
	hint_label.hide()

	

func _on_confirmation_dialog_close_requested():
	_resetTerminalValues()
	Global.is_terminal_on_screen = false


func _on_confirmation_dialog_canceled():
	_resetTerminalValues()
	Global.is_terminal_on_screen = false


func _on_confirmation_dialog_confirmed():
	if terminal_line.text == "git commit" and game_manager.codeBlocks > 0:
		command_status.text = "Status: SUCESSO!"
		confirmation_dialog.gui_disable_input = true
		await get_tree().create_timer(2).timeout
		Global.is_terminal_on_screen = false
		game_manager.addProgress(game_manager.codeBlocks * game_manager.progress_by_codeBlock)
		game_manager.codeBlocks = 0
		_resetTerminalValues()
		confirmation_dialog.hide()
		game_manager.goToNextLevel()
	elif terminal_line.text == "git push origin " + game_manager.current_branch and Global.isInPushFloor:
		command_status.text = "Status: SUCESSO!"
		confirmation_dialog.gui_disable_input = true
		await get_tree().create_timer(2).timeout
		Global.is_terminal_on_screen = false
		_resetTerminalValues()
		confirmation_dialog.hide()
		Global.isInMergeFloor = true
		Global.isInPushFloor = false
		if game_manager.current_branch == "tutorial":
			get_tree().change_scene_to_file("res://scenes/success.tscn")
		else:
			get_tree().change_scene_to_file("res://scenes/merge_floor.tscn")
	elif terminal_line.text == "git merge " + game_manager.current_branch and Global.isInMergeFloor:
		command_status.text = "Status: SUCESSO!"
		confirmation_dialog.gui_disable_input = true
		await get_tree().create_timer(2).timeout
		command_status.text = "Realizando checkout para branch destino..."
		await get_tree().create_timer(2).timeout
		command_status.text = "Realizando comando de merge..."
		await get_tree().create_timer(2).timeout
		command_status.text = "MERGE CONCLUÍDO! PARABÉNS!"
		await get_tree().create_timer(2).timeout
		Global.is_terminal_on_screen = false
		_resetTerminalValues()
		confirmation_dialog.hide()
		Global.isInMergeFloor = false
		Global.isInPushFloor = false
		get_tree().change_scene_to_file("res://scenes/success.tscn")
	elif terminal_line.text == "git pull":
		command_status.text = "Status: SUCESSO!"
		confirmation_dialog.gui_disable_input = true
		await get_tree().create_timer(2).timeout
		command_status.text = "Atualizando branch..."
		await get_tree().create_timer(2).timeout
		command_status.text = "BRANCH ATUALIZADA!"
		await get_tree().create_timer(2).timeout
		Global.is_terminal_on_screen = false
		_resetTerminalValues()
		confirmation_dialog.hide()
	elif terminal_line.text == "git checkout tutorial":
		game_manager.current_branch = "tutorial"
		command_status.text = "Status: SUCESSO!"
		confirmation_dialog.gui_disable_input = true
		await get_tree().create_timer(2).timeout
		_resetTerminalValues()
		confirmation_dialog.hide()
		get_tree().change_scene_to_file("res://scenes/tutorial_branch.tscn")
	elif terminal_line.text == "git checkout -b feature_01" and Global.current_branch_name == "develop":
		game_manager.current_branch = "feature_01"
		command_status.text = "Status: SUCESSO!"
		confirmation_dialog.gui_disable_input = true
		await get_tree().create_timer(2).timeout
		_resetTerminalValues()
		confirmation_dialog.hide()
		get_tree().change_scene_to_file("res://scenes/feature_01.tscn")
	elif terminal_line.text == "git checkout -b hotfix_01" and Global.current_branch_name == "main":
		game_manager.current_branch = "hotfix_01"
		command_status.text = "Status: SUCESSO!"
		confirmation_dialog.gui_disable_input = true
		await get_tree().create_timer(2).timeout
		_resetTerminalValues()
		confirmation_dialog.hide()
		get_tree().change_scene_to_file("res://scenes/hotfix_01.tscn")
	else:
		command_status.text = "Status: Comando incorreto!"
		terminal_line.text = ""

func _resetTerminalValues():
	command_status.text = "Status: Aguardando comando..."
	terminal_line.text = ""
	confirmation_dialog.gui_disable_input = false
	Global.is_terminal_on_screen = false
