extends Node2D

var village = "res://Levels/Level_1/village.tscn"
var grandetang = "res://Levels/Level_1/grand etang alt.tscn"

func _ready():
	AudioPlayer.play_music_level()
	if NavigationManager.spawn_door_tag != null:
		_on_level_spawn(NavigationManager.spawn_door_tag)

func _on_level_spawn(destination_tag:String):
	var door_path ="Doors/door_" + destination_tag
	var Door = get_node(door_path) as door
	NavigationManager.trigger_player_spawn(Door.spawn.global_position, Door.spawn.global_direction)

