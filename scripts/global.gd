extends Node

@onready var easy_mode_button = $EasyMode/EasyModeButton

var is_terminal_on_screen: bool = false
var current_branch_name: String = "limbo"
var isInPushFloor: bool = false
var isInMergeFloor: bool = false
var isFixingBugsPermitted = false
var isHotfixComplete = false
var isTaskCountdownOver = false
var isSoundOff = false
var isCasualMode = false
