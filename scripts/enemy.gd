extends Node2D

@onready var game_manager = %GameManager

@export var SPEED: float = 80
var direction: int = 1
@export var isStatic: bool = false
@export var moveHorizontally: bool = true

@onready var killzone = $Killzone
@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var animated_sprite = $AnimatedSprite2D

func _ready():
	killzone.playerDied.connect(_on_player_died)

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


func _on_player_died():
	game_manager.player.global_position = game_manager.playerSpawnLocations[game_manager.currentLevelIndex].global_position
	game_manager.player.get_node("CollisionShape2D").set_deferred("disabled", false)
