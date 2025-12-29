extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		for child in get_tree().root.get_children():
			if child is Bullet:
				child.queue_free()
			if child is Asteroid:
				child.queue_free()
		queue_free()
