extends Node

var current_scene="grand etang"
var transition_scene = false


var player_exit_village_x=0
var player_exit_village_y=0

var player_start_x=0
var player_start_y=0


func finish_changingscene():
	if transition_scene== true:
		transition_scene== false
		if current_scene =="grand etang":
			current_scene = "village"
		else:
			current_scene="grand etang"
