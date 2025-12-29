extends Node2D



func _on_uno_player_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/main1.tscn")


func _on_dos_player_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/main2.tscn")


func _on_tres_player_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/main3.tscn")


func _on_cuatro_player_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/main4.tscn")
