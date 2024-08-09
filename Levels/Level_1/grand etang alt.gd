extends Node2D



func _process(delta):
	change_scene()

func _on_village_transition_point_body_entered(body):
	if body.has_method("player"):
		global.transition_scene=true


func _on_village_transition_point_body_exited(body):
	if body.has_method("player"):
		global.transition_scene = false


func change_scene():
	if global.transition_scene == true:
		if global.current_scene== "grand etang":
			get_tree().change_scene_to_file("res://Levels/Level_1/village.tscn")
			global.finish_changingscene()
