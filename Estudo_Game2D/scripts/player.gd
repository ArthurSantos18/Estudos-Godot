extends CharacterBody2D

@export var move_speed: float = 64.0 
@export var sprite: Sprite2D = null
@export var animation: AnimationPlayer = null

func _physics_process(_delta):
	var direction: Vector2 = Vector2(
	Input.get_axis("ui_left", "ui_right"),
	Input.get_axis("ui_up", "ui_down")
	).normalized()

	velocity = move_speed * direction
	move_and_slide()
	check_orientation()
	animate()

func check_orientation():
	if velocity.x > 0:
		sprite.flip_h = false
	if velocity.x < 0:
		sprite.flip_h = true

func animate():
	if velocity != Vector2.ZERO:
		animation.play("walk")
		return
	animation.play("idle")
