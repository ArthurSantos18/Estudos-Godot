extends AnimatedSprite2D

func _ready():
	play("idle")

func _on_animation_finished():
	queue_free()
