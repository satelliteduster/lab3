extends AnimatedSprite2D

@export var speed = 2
@onready var walking = $AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x = 0
	position.y = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if walking == null:
		print("AnimatedSprite2D not found!")
		return
	
	if Input.is_action_pressed("ui_left"):
		position.x -= 5
		walking.play("left")
	if Input.is_action_pressed("ui_right"):
		position.x += 5
		walking.play("right")
	if Input.is_action_pressed("ui_up"):
		position.y -= 5
		walking.play("up")
	if Input.is_action_pressed("ui_down"):
		position.y += 5
		walking.play("down")
