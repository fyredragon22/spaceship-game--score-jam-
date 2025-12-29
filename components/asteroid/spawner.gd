extends Node2D

@export var point_1: Marker2D
@export var point_2: Marker2D

@onready var astroid = preload("uid://fhcnakn4moa3")


func get_random_points(p1: Vector2, p2: Vector2) -> Vector2:
	var x_value: float = randf_range(p1.x, p2.x)
	var y_value: float = randf_range(p1.y, p2.y)

	var random_point: Vector2 = Vector2(x_value, y_value)
	return (random_point)


func _on_timer_timeout() -> void:
	var spawn_position: Vector2 = get_random_points(point_1.global_position, point_2.global_position)

	var ast = astroid.instantiate()
	ast.position = spawn_position
	get_tree().root.add_child(ast)
