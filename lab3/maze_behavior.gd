extends StaticBody2D

func _ready() -> void:
	if not $exit.is_connected("body_entered", _on_exit_body_entered):
			$exit.connect("body_entered", _on_exit_body_entered)

func _on_exit_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		print("you've reached the end!") # when exit [area2d] is hit
		SceneManager.transition_to_path(body) # load up path_bg
