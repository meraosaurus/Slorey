extends Node2D

var village = "res://Levels/Level_1/village.tscn"
var grandetang = "res://Levels/Level_1/grand etang alt.tscn"

func _ready():
	AudioPlayer.play_music_level()

func _on_village_exit_point_body_entered(body):
	if body.has_method("player")and get_tree().current_scene:
		get_tree().change_scene_to_file.bind("res://Levels/Level_1/grand etang alt.gd").call_deferred()
