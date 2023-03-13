extends Sprite2D

var on_action: bool = false

@export var animation: AnimationPlayer = null
@export var mask_dude: CharacterBody2D = null

func animate(velocity: Vector2) -> void:
	change_orientation_based_on_direction(velocity.x)

	if on_action:
		return
	if velocity.y != 0:
		vertical_move_behavior(velocity.y)
		return
	horizontal_move_behavior(velocity.x)
	
func change_orientation_based_on_direction(direction: float) -> void:
	if direction > 0:
		flip_h = false
	if direction < 0: 
		flip_h = true

func horizontal_move_behavior(direction: float) -> void:
	if direction != 0:
		animation.play("run")
		return
	animation.play("idle")

func vertical_move_behavior(direction: float) -> void:
	if direction > 0:
		animation.play("fall")
	if direction < 0:
		animation.play("jump")

func action_behavior(action: String) -> void:
	on_action = true
	animation.play(action)

func _on_animation_animation_finished(anim_name: String) -> void:
	on_action = false

	if anim_name == "hit":
		mask_dude.on_knockback = false
	
	if anim_name == "dead":
		hide()
		transition_screen.fade_in()
