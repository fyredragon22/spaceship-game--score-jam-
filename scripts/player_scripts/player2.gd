extends CharacterBody2D



const BULLET = preload("res://scenes/bullet.tscn")

@onready var marker: Marker2D = $Marker2D
@onready var label: Label = %Label

var score: int = 0
var dead: bool = false
 
func _ready() -> void:
	label.text = str(score)

func _physics_process(_delta: float) -> void:
	if !dead:
		var dir = Vector2.ZERO
		
		if Input.is_action_pressed("up2"):
			dir.y -= 1
		if Input.is_action_pressed("down2"):
			dir.y += 1
		if Input.is_action_pressed("right2"):
			dir.x += 1
		if Input.is_action_pressed("left2"):
			dir.x -= 1
			
		velocity = dir * 100
	else:
		return
	
	move_and_slide()

func _process(_delta: float) -> void:
	if !dead:
		if Input.is_action_just_pressed("shoot2"):
			var bullet_instance = BULLET.instantiate()
			get_tree().root.add_child(bullet_instance)
			bullet_instance.global_position = marker.global_position
			bullet_instance.rotation = rotation
			bullet_instance.owner_player = self

func add_score():
	score += 1
	label.text = str(score)
	print(score)

func _on_hitbox_body_entered(_body: Node2D) -> void:
	dead = true
	
	$Sprite2D.hide()
	$CPUParticles2D.queue_free()
	$CollisionShape2D.queue_free()
	$Hitbox.queue_free()
	
	$Explosion.emitting = true
	


func _on_explosion_finished() -> void:
	pass # Replace with function body.
