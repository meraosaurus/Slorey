extends Node

const village = preload("res://Levels/Level_1/Village.tscn")
const grand_etang =preload("res://Levels/Level_1/grand etang alt.tscn")

var spawn_door_tag
signal on_trigger_player_spawn

func go_to_level(level_tag, destination_tag):
	var scene_to_load
	
	match level_tag:
		"Village":
			scene_to_load= village
		"grand etang":
			scene_to_load=grand_etang
	if scene_to_load != null:
		spawn_door_tag=destination_tag
		get_tree().change_scene_to_packed(scene_to_load)

func trigger_player_spawn(position: Vector2, direction:String):
	on_trigger_player_spawn.emit(position, direction)
