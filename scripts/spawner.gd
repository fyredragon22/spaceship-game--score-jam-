extends Node2D

@onready var astroid = preload("res://scenes/astroid.tscn")

@export var point_1: Vector2 = Vector2(50,50)
@export var point_2: Vector2 = Vector2(-50,-50)


func _on_timer_timeout() -> void:
	var spawn_position: Vector2 = get_random_points(point_1, point_2)
	
	var ast = astroid.instantiate()
	ast.position = spawn_position
	get_tree().root.add_child(ast)
	
	

func get_random_points(p1: Vector2, p2: Vector2) -> Vector2:
	var x_value: float = randf_range(p1.x, p2.x)
	var y_value: float = randf_range(p1.y, p2.y)
	
	var random_point: Vector2 = Vector2(x_value, y_value)
	return(random_point)
