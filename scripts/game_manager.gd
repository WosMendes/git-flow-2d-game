extends Node

@export var playerSpawnLocations: Array[Marker2D]
@export var player: CharacterBody2D

var isOnDialogueFocus: bool = false
var commits: int = 0
var taskProgress: int = 0
var currentBranch: String = ""
var currentLevelIndex: int = 0

func _ready():
	player.global_position = playerSpawnLocations[currentLevelIndex].global_position

func addCommit():
	commits += 1
	print(commits)
	
func addProgress(progressValue: int):
	taskProgress += progressValue
	print("Progresso aumentou em " + str(taskProgress) + "%")

func goToNextLevel():
	if taskProgress >= 100:
		return
	elif currentLevelIndex < (playerSpawnLocations.size() - 1):
		currentLevelIndex += 1
	else:
		currentLevelIndex = 0
	player.global_position = playerSpawnLocations[currentLevelIndex].global_position
