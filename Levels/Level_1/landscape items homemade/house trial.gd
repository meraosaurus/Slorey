extends Node2D

var inside = "res://Levels/Level_1/landscape items homemade/house_interior.tscn"


func _on_area_2d_area_shape_entered(body):
	if body.has_method("player"):
		get_tree().change_scene_to_file(inside)
