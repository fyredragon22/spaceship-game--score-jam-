extends Node2D

@onready var label1: Label = $MarginContainer/VBoxContainer/Label
@onready var label2: Label = $MarginContainer/VBoxContainer/Label2
@onready var label3: Label = $MarginContainer/VBoxContainer/Label3
@onready var label4: Label = $MarginContainer/VBoxContainer/Label4

@onready var player1: CharacterBody2D = get_node_or_null("../Player1")
@onready var player2: CharacterBody2D = get_node_or_null("../Player2")
@onready var player3: CharacterBody2D = get_node_or_null("../Player3")
@onready var player4: CharacterBody2D = get_node_or_null("../Player4")

var scoreboard_up = false


func _ready() -> void:
	hide()

func _process(_delta: float) -> void:
	if player1:
		label1.text = str(player1.score)
		
	if player2:
		label2.text = str(player2.score)
		
	if player3:
		label3.text = str(player3.score)
		
	if player4:
		label4.text = str(player4.score)
		
	
	if player1:
		if player1.dead == true and !player2 and !player3 and !player4:
			if scoreboard_up == false:
				scoreboard()
	
	if player1 and player2:
		if player1.dead == true and player2.dead == true and !player3 and !player4:
			if scoreboard_up == false:
				scoreboard()
	
	if player1 and player2 and player3:
		if player1.dead == true and player2.dead == true and player3.dead == true and !player4:
			if scoreboard_up == false:
				scoreboard()
	
	if player1 and player2 and player3 and player4:
		if player1.dead == true and player2.dead == true and player3.dead == true and player4.dead == true:
			if scoreboard_up == false:
				scoreboard()
	
func scoreboard():
	scoreboard_up = true
	await get_tree().create_timer(2.0).timeout
	
	show()
	$AnimationPlayer.play("Ready")
	


func _on_return_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
