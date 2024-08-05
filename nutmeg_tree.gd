extends Node2D

var state = "no meg"
var player_in_area = false 

var nutmeg=preload("res://nutmeg.collectable.tscn")
@export var item: InvtItem
var player= null

func _ready():
	if state == "no meg":
		$Timer.start()


func _process(_delta):
	if state == "no meg":
		$AnimatedSprite2D.play("no meg")
	if state == "meg":
		$AnimatedSprite2D.play("meg")
		if player_in_area:
			if Input.is_action_just_pressed("e"):
				state = "no meg"
				drop_fruit()


func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		player_in_area=true
		player = body


func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		player_in_area=false


func _on_timer_timeout():
	if state == "no meg":
		state = "meg"

func drop_fruit():
	var nutmeg_instance=nutmeg.instantiate()
	nutmeg_instance.global_position=$Marker2D.global_position
	get_parent().add_child(nutmeg_instance)
	player.collect(item)
	await get_tree().create_timer(3).timeout
	$Timer.start()






