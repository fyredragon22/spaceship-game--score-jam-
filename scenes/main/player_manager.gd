extends Node2D

const PLAYER = preload("uid://bu1tsnr5almck")

@onready var spawns: Array[Marker2D] = [$spawn1, $spawn2, $spawn3, $spawn4]


func _ready() -> void:
	GameManager.alive_players = 0
	for i in GameManager.players_playing:
		var p: Player = PLAYER.instantiate()
		p.player_num = i + 1
		p.position = spawns[i].position
		p.died.connect(player_died)
		GameManager.alive_players += 1
		add_child(p)


func player_died():
	GameManager.alive_players -= 1

	if GameManager.alive_players < 1:
		print("game over")
		%End.show_scoreboard()
