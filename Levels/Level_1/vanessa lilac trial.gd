extends CharacterBody2D
var speed= 100

var player_state

func _physics_process(_delta):
	var direction = Input.get_vector("left", "right", "top", "down")
	
	if direction.x == 0 and direction.y == 0:
		player_state= "idle"
	elif direction.x != 0 or direction.y != 0:
		player_state= "walking"
	
	velocity = direction * speed
	move_and_slide()
	
	play_anim(direction)

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
