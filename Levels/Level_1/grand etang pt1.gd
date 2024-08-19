extends Node2D

var location1 = "res://Levels/Level_1/game_level_1.tscn"
var location2 = "res://Levels/Level_1/grand etang pt1.tscn"


func _on_area_2d_body_entered(body):
	if body.has_method("player") and get_tree().current_scene:
		get_tree().change_scene_to_file(location1)

func _on_area_2d_body_exited(body):
	if body.has_method("player") and get_tree().current_scene:
		get_tree().change_scene_to_file(location2)
