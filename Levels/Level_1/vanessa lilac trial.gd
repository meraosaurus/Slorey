class_name van extends CharacterBody2D 
var speed= 175

var player_state
var player_pos:Vector2
var health=100

var village = "res://Levels/Level_1/village.tscn"
var grandetang = "res://Levels/Level_1/grand etang alt.tscn"

@export var inv:Inv
@onready var AnimatedSprite_2D: AnimatedSprite2D=$AnimatedSprite2D

func _physics_process(_delta):
	var direction = Input.get_vector("left", "right", "top", "down")
	
	if direction.x == 0 and direction.y == 0:
		player_state= "idle"
	elif direction.x != 0 or direction.y != 0:
		player_state= "walking"
	
	velocity = direction * speed
	move_and_slide()
	
	play_anim(direction)
	if player_pos!=global_position && player_state=="idle":
		print(global_position)
		player_pos=global_position

func play_anim(direction):
	if player_state == "idle":
		$AnimatedSprite2D.play("idle")
		
	elif player_state == "walking":
		if direction.x == 1:
			$AnimatedSprite2D.play("e_walk")
			soundeffect()
		if direction.y == 1:
			$AnimatedSprite2D.play("s_walk")
			soundeffect()
		if direction.x == -1:
			$AnimatedSprite2D.play("w_walk")
			print(position)
			soundeffect()
		if direction.y == -1:
			$AnimatedSprite2D.play("n_walk")
			soundeffect()

func soundeffect(): #walking sound effects by me 
	if player_state=="walking":
		$AudioStreamPlayer.play()
	elif player_state!="walking" or player_state=="idle":
		$AudioStreamPlayer.stop()
		$AudioStreamPlayer.seek(-1)

func player():
	pass

func collect(item):
	inv.insert(item)


func _ready():
	NavigationManager.on_trigger_player_spawn.connect(_on_spawn)
	player_pos = global_position



func _on_spawn(position: Vector2, direction: String):
	global_position = position
	AnimatedSprite_2D.play("walking"+direction)
	AnimatedSprite_2D.stop()


