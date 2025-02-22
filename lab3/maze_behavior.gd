extends StaticBody2D


# Called when the node enters the scene tree for the first time.

#upon loading, start barbara [player] at opening position (576, 536)

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#when barbara passes through checkpoint [area2d], position is logged and sent to her
#when barbara enters deathbox [area2d], lower health to 0 and reset barbara's position to last checkpoint
#when exit [area2d] is hit, load up path_bg
