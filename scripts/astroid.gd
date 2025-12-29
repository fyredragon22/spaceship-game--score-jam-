extends CharacterBody2D

class_name Asteroid

var speed: int = int(randf_range(80, 300))

var variable : bool = true 

func _physics_process(delta: float) -> void:
	position -= transform.x * speed * delta
	move_and_slide()

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.owner_player != null:
		explode()
		if body.owner_player.has_method("add_score"):
			body.owner_player.add_score()

func explode():
	$Sprite2D.visible = false
	$CollisionShape2D.queue_free()
	$Hitbox.queue_free()
	
	$CPUParticles2D.emitting = true


func _on_cpu_particles_2d_finished() -> void:
	queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
