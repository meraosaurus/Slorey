extends CharacterBody2D
var level_1

func level():
	if van==level_1:
		$AnimatedSprite2D.play()
