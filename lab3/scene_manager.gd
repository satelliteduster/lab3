extends Node

var barbara: CharacterBody2D = null

func transition_to_path(player: CharacterBody2D): # shift to the path_bg scene
	barbara = player # set barb as the player variable
	
	var current_level = get_node("/root/maze/CurrentLevel")
	if not current_level:
		push_error("CurrentLevel node not found!")
		return

	var maze_bg = current_level.get_node("MazeBg")
	if maze_bg:
		maze_bg.queue_free()

	var path_bg_scene = load("res://path_bg.tscn")
	var path_bg = path_bg_scene.instantiate()
	current_level.call_deferred("add_child", path_bg)
	
	call_deferred("_reset_barbara")

func _reset_barbara(): # troubleshooter i
	if barbara and is_instance_valid(barbara):
		barbara.set_deferred("global_position", Vector2(576, 536))
		barbara.call_deferred("reset_for_new_scene")
		call_deferred("_reset_barbara_physics")
	else:
		push_error("Barbara is not valid!")

func _reset_barbara_physics(): # troubleshooter ii
	if barbara and is_instance_valid(barbara):
		barbara.reset_for_new_scene()
	else:
		push_error("Barbara is not valid!")
