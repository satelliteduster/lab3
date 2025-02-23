extends CharacterBody2D

@export var speed = 150 # high walking speed due to the size of the map
@onready var walking = $AnimatedSprite2D # for the animations
@export var health = 1 # health variable that goes down upon a hit

var lastdir = "down" # face downward at spawn
var checkpoint_pos = Vector2(576, 536)  # default spawn position
var cp_pass = false # to check checkpoint passings

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

func hit():
	health -= 1 # upon hit, lower hp
	if health <= 0: # upon death:
		print("you died!")
		respawn()

func respawn():
	health = 1
	global_position = checkpoint_pos # respawns at last checkpoint upon death

func save_checkpoint(new_pos):
	checkpoint_pos = new_pos # save checkpoint location (x,y)
	cp_pass = true

func reset_for_new_scene(): #on entrance into new scene
	set_deferred("global_position", Vector2(576, 536)) # starting position
	set_deferred("collision_layer_value", [1, true]) # reset collision physics
	set_deferred("collision_mask_value", [1, true])
	
	health = 1 # reset health
	cp_pass = false # reset checkpoint checker
	visible = true # reset visibility
	velocity = Vector2.ZERO  # reset velocity
	walking.play(lastdir + "idle")  # set idle animation
