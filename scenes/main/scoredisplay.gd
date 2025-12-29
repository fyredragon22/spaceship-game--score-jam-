extends VBoxContainer

@onready var label_1: Label = $Label1
@onready var label_2: Label = $Label2
@onready var label_3: Label = $Label3
@onready var label_4: Label = $Label4
@onready var labels: Array[Label] = [$Label1, $Label2, $Label3, $Label4]


func _process(delta: float) -> void:
	for l in labels:
		var i = labels.find(l)
		l.text = str(GameManager.player_scores[i])
