extends CharacterBody2D

@export var speed = 150
@onready var walking = $AnimatedSprite2D
#health variable, set at 1, goes down to 0 upon being hit

var lastdir = "down"

#

func _physics_process(_delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = input_vector * speed
		
		if abs(input_vector.x) > abs(input_vector.y):
			if input_vector.x > 0:
				walking.play("right")
				lastdir = "right"
			else:
				walking.play("left")
				lastdir = "left"
		else:
			if input_vector.y > 0:
				walking.play("down")
				lastdir = "down"
			else:
				walking.play("up")
				lastdir = "up"
	else:
		velocity = Vector2.ZERO
		walking.play(lastdir + "idle")
	
	move_and_slide()

#spawn at entry position at on each page with full health [1]
	#for both mazebg and pathbg, entry pos is at (576, 536)
#save checkpoint location (x,y)
#spawn at last checkpoint upon health reaching 0
#track whether barb has passed through a checkpoint
