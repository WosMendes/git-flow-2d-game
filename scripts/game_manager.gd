extends Node

@export var current_branch: String = ""
@export var playerSpawnLocations: Array[Marker2D]
@export var player: CharacterBody2D
@export var progress_by_codeBlock: int = 20
@export var hasToShowProgress: bool = true

var codeBlocks: int = 0
var taskProgress: int = 0
var currentLevelIndex: int = 0

func _ready():
	player.global_position = playerSpawnLocations[currentLevelIndex].global_position
	if current_branch.is_empty():
		current_branch = Global.current_branch_name
	else:
		Global.current_branch_name = current_branch

func addCodeBlock():
	codeBlocks += 1
	print(codeBlocks)
	
func addProgress(progressValue: int):
	taskProgress += progressValue
	print("Progresso aumentou em " + str(taskProgress) + "%")
	if taskProgress >= 100:
		Global.isInMergeFloor = false
		Global.isInPushFloor = true
		get_tree().change_scene_to_file("res://scenes/push_floor.tscn")
	
func goToNextLevel():
	if taskProgress >= 100:
		return
	elif currentLevelIndex < (playerSpawnLocations.size() - 1):
		currentLevelIndex += 1
	else:
		currentLevelIndex = 0
	player.global_position = playerSpawnLocations[currentLevelIndex].global_position
