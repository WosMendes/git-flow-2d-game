extends Node

var isOnDialogueFocus: bool = false
var score: int = 0
var taskProgress: int = 0

func addPoint():
	score += 1
	print(score)
	
func addProgress(progressValue: int):
	taskProgress += progressValue
	print(taskProgress)
