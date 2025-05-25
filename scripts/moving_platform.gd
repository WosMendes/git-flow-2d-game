extends Node2D

const SPEED: float = 80
var direction: int = 1
@export var isStatic: bool = false
@export var moveHorizontally: bool = true

@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var animated_sprite = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if isStatic:
		return
		
	if ray_cast_right.is_colliding():
		direction = -1
	if ray_cast_left.is_colliding():
		direction = 1
	
	if moveHorizontally:
		position.x += SPEED * delta * direction
	else:
		position.y += SPEED * delta * direction
