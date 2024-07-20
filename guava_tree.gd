extends Node2D
var state = "no guava"
var player_in_area= false 

var guava= preload("res://guava_collectable.tscn")
@export var item: InvtItem
var player= null

func _ready():
	if state == "no guava":
		$Timer.start()

func _process(delta):
	if state == "no guava":
		$AnimatedSprite2D.play("no guava")
	if state == "guava":
		$AnimatedSprite2D.play("guava")
		if player_in_area:
			if Input.is_action_just_pressed("e"):
				state = "no guava"
				drop_fruit()



func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		player_in_area=true
		player = body

func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		player_in_area=false


func _on_timer_timeout():
	if state == "no guava":
		state = "guava"

func drop_fruit():
	var guava_instance=guava.instantiate()
	guava_instance.global_position=$Marker2D.global_position
	get_parent().add_child(guava_instance)
	player.collect(item)
	await get_tree().create_timer(3).timeout
	$Timer.start()




