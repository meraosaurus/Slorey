extends Node2D
var location2 = "res://Levels/Level_1/grand etang alt.tscn"
var location1= "res://scenes/grandetangcabin.tscn"


func _on_area_2d_body_entered(body):
	if body.has_method("player") and get_tree().current_scene:
		get_tree().change_scene_to_file(location2)

func _on_area_2d_body_exited(body):
	if body.has_method("player") and get_tree().current_scene:
		get_tree().change_scene_to_file(location1)
