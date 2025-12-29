extends Node2D

const SCOREBOARD = preload("res://scenes/end.tscn")

@onready var player1: CharacterBody2D = get_node_or_null("Player1")
@onready var player2: CharacterBody2D = get_node_or_null("Player2")
@onready var player3: CharacterBody2D = get_node_or_null("Player3")
@onready var player4: CharacterBody2D = get_node_or_null("Player4")


func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if player1.dead == true:
		end()

func end():
	var scoreboard = SCOREBOARD.instantiate()
	get_tree().root.add_child(scoreboard)
	scoreboard.global_position = global_position
	print(scoreboard.global_position)
