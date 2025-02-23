extends Area2D

var check_reached = false

func _ready() -> void:
	connect("body_entered", _on_body_entered) # connecting functiom

func _on_body_entered(body): # checkpoint code
	if body is CharacterBody2D and not check_reached: # prevents repeats
		body.save_checkpoint(global_position)
		check_reached = true # character has passed checkpoint
		print("checkpoint reached")
