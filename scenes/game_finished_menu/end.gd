extends Control

var scoreboard_up = false

@onready var player_score_labels: Array[Label] = [$VBoxContainer2/PanelContainer/VBoxContainer2/Label1, $VBoxContainer2/PanelContainer/VBoxContainer2/Label2, $VBoxContainer2/PanelContainer/VBoxContainer2/Label3, $VBoxContainer2/PanelContainer/VBoxContainer2/Label4]
@onready var label1: Label = $MarginContainer/VBoxContainer/Label
@onready var label2: Label = $MarginContainer/VBoxContainer/Label2
@onready var label3: Label = $MarginContainer/VBoxContainer/Label3
@onready var label4: Label = $MarginContainer/VBoxContainer/Label4
#
@onready var return_button: Button = $VBoxContainer2/VBoxContainer/Return
@onready var quit: Button = $VBoxContainer2/VBoxContainer/Quit
@onready var play_again: Button = $VBoxContainer2/VBoxContainer/PlayAgain


func _ready() -> void:
	hide()


func show_scoreboard():
	for score_label in player_score_labels:
		var i = player_score_labels.find(score_label)
		score_label.text = str(GameManager.player_scores[i])
		score_label.hide()

	if not scoreboard_up:
		scoreboard()


func scoreboard():
	return_button.hide()
	quit.hide()
	play_again.hide()

	scoreboard_up = true
	# dont be jarring if the player dies and this appears instantly
	await get_tree().create_timer(2.0).timeout

	show()
	for l in player_score_labels:
		var i = player_score_labels.find(l)
		if GameManager.players_playing > i:
			await get_tree().create_timer(0.2).timeout
			l.show()

	await get_tree().create_timer(0.2).timeout
	play_again.show()
	await get_tree().create_timer(0.2).timeout
	return_button.show()
	await get_tree().create_timer(0.2).timeout
	quit.show()


func _on_return_pressed() -> void:
	get_tree().change_scene_to_file("uid://dcr1lasrjukbx")


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_play_again_pressed() -> void:
	get_tree().reload_current_scene()
