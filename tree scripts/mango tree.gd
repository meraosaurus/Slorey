extends Node2D
var state = "no mango"
var player_in_area= false 

var mango= preload("res://tree scripts/mango_collectable.tscn")
@export var item: InvtItem
var player= null

func _ready():
	if state == "no mango":
		$Timer.start()

func _process(_delta):
	if state == "no mango":
		$AnimatedSprite2D.play("no mango")
	if state == "mango":
		$AnimatedSprite2D.play("mango")
		if player_in_area:
			if Input.is_action_just_pressed("e"):
				state = "no mango"
				drop_fruit()


func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		player_in_area=true
		player = body


func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		player_in_area=false


func _on_timer_timeout():
	if state == "no mango":
		state = "mango"

func drop_fruit():
	var mango_instance= mango.instantiate()
	mango_instance.global_position=$Marker2D.global_position
	get_parent().add_child(mango_instance)
	player.collect(item)
	await get_tree().create_timer(3).timeout
	$Timer.start()
