extends CharacterBody2D
var speed= 175

var player_state

var village = "res://Levels/Level_1/village.tscn"
var grandetang = "res://Levels/Level_1/grand etang alt.tscn"

@export var inv:Inv

func _physics_process(_delta):
	var direction = Input.get_vector("left", "right", "top", "down")
	
	if direction.x == 0 and direction.y == 0:
		player_state= "idle"
	elif direction.x != 0 or direction.y != 0:
		player_state= "walking"
	
	velocity = direction * speed
	move_and_slide()
	
	play_anim(direction)
	#current_camera()

func play_anim(direction):
	if player_state == "idle":
		$AnimatedSprite2D.play("idle")
	elif player_state == "walking":
		if direction.x == 1:
			$AnimatedSprite2D.play("e_walk")
		if direction.y == 1:
			$AnimatedSprite2D.play("s_walk")
		if direction.x == -1:
			$AnimatedSprite2D.play("w_walk")
		if direction.y == -1:
			$AnimatedSprite2D.play("n_walk")

func player():
	pass

func collect(item):
	inv.insert(item)


#func current_camera():
#	if global.current_scene == grandetang:
#		$villagecam.enabled=false
#		$grandetangcam.enabled= true
#	elif global.current_scene == village:
#		$grandetangcam.enabled=false
#		$villagecam.enabled= true
#		$grandetangcam.enabled=false
