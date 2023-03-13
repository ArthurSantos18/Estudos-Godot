extends CanvasLayer

signal start_level

@onready var animation: AnimationPlayer = get_node("Animation")
var target_path: String
var current_health: int = 0
var current_score: int = 0

func fade_in() -> void:
	animation.play("fade_in")

func _on_animation_animation_finished(anim_name: String):
	if anim_name == "fade_in":
		var _change_scene: bool = get_tree().change_scene_to_file(target_path)
		animation.play("fade_out")
	if anim_name == "fade_out":
		var _start: bool = emit_signal("start_level")

func reset() -> void:
	current_health = 0
	current_score = 0
