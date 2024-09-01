class_name scenemanager extends Node

var vanessa_lilac: van

var levels= "res://Levels/Level_1/"

func change_to_other_scene(from, to_scene_name: String)-> void:
	vanessa_lilac= from.vanessa_lilac
	vanessa_lilac.get_parent().remove_child(vanessa_lilac)
	
	var full_path = levels+ to_scene_name+ ".tscn"
	from.get_tree().call_deferred("change_scene_to_file", full_path)
