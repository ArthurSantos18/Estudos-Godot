extends Area2D

@export var scene_path: String = ""

func _on_body_entered(body):
	if body.is_in_group("mask_dude"):
		transition_screen.target_path = scene_path
		body.sprite.action_behavior("dead")
		body.set_physics_process(false)
