extends StaticBody2D

@onready var state_time: Timer = get_node("StateTimer")
@onready var animation: AnimationPlayer = get_node("Animation")

var max_health: int = 0
var current_state: String = "off"
var is_invicible: bool = false

@export var damage: int
@export var health: int = 15

func _ready():
	max_health = health

func _on_state_timer_timeout():
	state_time.start()
	
	if current_state == "off":
		current_state = "on"
		is_invicible = true
		animation.play(current_state)
		return

	if current_state == "on":
		current_state = "off"
		is_invicible = false
		animation.play(current_state)
		return

func _on_detection_area_body_entered(body) -> void:
	if body.is_in_group("mask_dude"):
		body.update_health(global_position, damage, "decrease")

func update_health(value: int) -> void:
	if is_invicible:
		return
	
	health = clamp(health - value, 0, 15)
	animation.play("hit")
	
	if health == 0:
		state_time.stop()
		is_invicible = true
		current_state = "off"
		animation.play(current_state)
		return

func _on_animation_animation_finished(anim_name):
	if anim_name == "hit":
		animation.play(current_state)
