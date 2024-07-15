extends StaticBody2D

func _ready():
	fallingfromtree()


func fallingfromtree():
	$AnimationPlayer.play("fallingfromtree")
	await get_tree().create_timer(4).timeout
	$AnimationPlayer.play("fade")
	print("+1 guava")
	await get_tree().create_timer(0.3).timeout
	queue_free()
