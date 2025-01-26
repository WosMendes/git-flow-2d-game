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
func _process(delta):
	if Input.is_action_just_pressed("open_terminal") and hint_label.visible == true:
		confirmation_dialog.show()
		game_manager.isOnDialogueFocus = true


func _on_area_2d_body_entered(body):
	hint_label.show()
	

func _on_area_2d_body_exited(body):
	hint_label.hide()

	

func _on_confirmation_dialog_close_requested():
	_resetTerminalValues()
	game_manager.isOnDialogueFocus = false


func _on_confirmation_dialog_canceled():
	_resetTerminalValues()
	game_manager.isOnDialogueFocus = false


func _on_confirmation_dialog_confirmed():
	if terminal_line.text == "git push origin fase1":
		command_status.text = "Status: SUCESSO!"
		game_manager.addProgress(10)
		confirmation_dialog.gui_disable_input = true
		await get_tree().create_timer(2).timeout
		game_manager.isOnDialogueFocus = false
		_resetTerminalValues()
		confirmation_dialog.hide()
	else:
		command_status.text = "Status: Comando incorreto!"
		terminal_line.text = ""

func _resetTerminalValues():
	command_status.text = "Status: Aguardando comando..."
	terminal_line.text = ""
	confirmation_dialog.gui_disable_input = false
