extends Node


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("uid://dq7jc2bb3lxnc")


func _on_controls_pressed() -> void:
	get_tree().change_scene_to_file("uid://crsov0kneen0r")


func _on_quit_pressed() -> void:
	get_tree().quit()
