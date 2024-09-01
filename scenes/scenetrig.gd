class_name scene_trig extends Area2D

@export var nextscene: String

func _on_body_entered(body):
	if body.has_method("player"):
		Scene_manager.change_to_other_scene(get_owner(), nextscene)
