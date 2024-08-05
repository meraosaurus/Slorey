extends Node2D
var state = "no cocoa"
var player_in_area= false 

var cocoa= preload("res://tree scripts/cocoa_collectable.tscn")
@export var item: InvtItem
var player= null

func _ready():
	if state == "no cocoa":
		$Timer.start()

func _process(_delta):
	if state == "no cocoa":
		$AnimatedSprite2D.play("no cocoa")
	if state == "cocoa":
		$AnimatedSprite2D.play("cocoa")
		if player_in_area:
			if Input.is_action_just_pressed("e"):
				state = "no cocoa"
				drop_fruit()


func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		player_in_area=true
		player = body


func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		player_in_area=false


func _on_timer_timeout():
	if state == "no cocoa":
		state = "cocoa"

func drop_fruit():
	var cocoa_instance= cocoa.instantiate()
	cocoa_instance.global_position=$Marker2D.global_position
	get_parent().add_child(cocoa_instance)
	player.collect(item)
	await get_tree().create_timer(10).timeout
	$Timer.start()
