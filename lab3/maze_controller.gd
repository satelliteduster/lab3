extends Node2D

@onready var maze_bg = $CurrentLevel/MazeBg
@onready var path_bg = $CurrentLevel/PathBg
@onready var barbara = $barbara

func _ready():
	path_bg.hide() # hide PathBg upon loading
	path_bg.collision_layer = 0 # offset collision... 
	path_bg.collision_mask = 0  # to keep barb from running into a wall.
	
	for child in path_bg.get_children():
		if child is CollisionShape2D or child is CollisionPolygon2D:
			child.set_deferred("disabled", true) # just in case

func _on_exit_body_entered(body):
	if body == barbara:
		transition_to_path()

func transition_to_path():
	maze_bg.hide()  # remove maze_bg
	path_bg.show()  # show path_bg
	path_bg.collision_layer = 1 # reset collision
	path_bg.collision_mask = 1
	
	for child in path_bg.get_children():
		if child is CollisionShape2D or child is CollisionPolygon2D:
			child.set_deferred("disabled", false)
	
	barbara.visible = true
	barbara.reset_for_new_scene() # put barb in the new scene
