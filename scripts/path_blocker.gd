extends Node2D

@export var isLastBlocker: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.isFixingBugsPermitted and !isLastBlocker:
		self.queue_free()
	elif Global.isHotfixComplete and isLastBlocker:
		self.queue_free()
