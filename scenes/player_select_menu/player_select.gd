extends Node

const MAIN = preload("uid://pnupt35uiwpv")

@onready var buttons: Array[Button] = [$VBoxContainer/UnoPlayer, $VBoxContainer/DosPlayer, $VBoxContainer/TresPlayer, $VBoxContainer/CuatroPlayer]
@onready var uno_player: Button = $VBoxContainer/UnoPlayer
@onready var dos_player: Button = $VBoxContainer/DosPlayer
@onready var tres_player: Button = $VBoxContainer/TresPlayer
@onready var cuatro_player: Button = $VBoxContainer/CuatroPlayer


func _ready() -> void:
	for bbb in buttons:
		bbb.pressed.connect(button_pressed.bind(buttons.find(bbb) + 1))


func button_pressed(num: int):
	GameManager.players_playing = num
	get_tree().change_scene_to_packed(MAIN)
