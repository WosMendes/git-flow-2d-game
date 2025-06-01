extends Node2D

@export var codeBugs: Array[Node2D] = []

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.isFixingBugsPermitted = false
	Global.isHotfixComplete = false
	for codeBug in codeBugs:
		codeBug.codeCollected.connect(_on_code_collected)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if codeBugs.size() <= 0:
		Global.isFixingBugsPermitted = true

func _on_code_collected():
	codeBugs.pop_back()
