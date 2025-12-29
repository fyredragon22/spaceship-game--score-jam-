class_name Player
extends CharacterBody2D

signal died()

const BULLET = preload("uid://bbjx586kgbqf0")

@export var player_num: int = 1
@export var colors: Array[Color]

var score: int = 0
var dead: bool = false

@onready var marker: Marker2D = $Marker2D
@onready var label: Label = %Label


func _ready() -> void:
	modulate = colors[player_num - 1]


func _process(_delta: float) -> void:
	if !dead:
		if Input.is_action_just_pressed("shoot" + str(player_num)):
			var bullet_instance = BULLET.instantiate()
			get_tree().root.add_child(bullet_instance)
			bullet_instance.global_position = marker.global_position
			bullet_instance.rotation = rotation
			bullet_instance.owner_player = self


func _physics_process(_delta: float) -> void:
	if !dead:
		var dir = Vector2.ZERO

		if Input.is_action_pressed("up" + str(player_num)):
			dir.y -= 1
		if Input.is_action_pressed("down" + str(player_num)):
			dir.y += 1
		if Input.is_action_pressed("right" + str(player_num)):
			dir.x += 1
		if Input.is_action_pressed("left" + str(player_num)):
			dir.x -= 1

		velocity = dir * 100 * 3
	else:
		velocity.x -= 3000 * _delta

	move_and_slide()


func add_score():
	score += 1
	GameManager.player_scores[player_num - 1] = score
	print(score)


func _on_hitbox_body_entered(_body: Node2D) -> void:
	if dead:
		return
	dead = true

	$Sprite2D.hide()
	$CPUParticles2D.queue_free()
	$CollisionShape2D.queue_free()
	$Hitbox.queue_free()

	$Explosion.emitting = true

	died.emit()


func _on_explosion_finished() -> void:
	pass # Replace with function body.
