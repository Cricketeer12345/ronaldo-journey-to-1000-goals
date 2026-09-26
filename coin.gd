extends Node2D

@export var value: int = 1

# Get references to the child nodes based on your setup
@onready var coin_sound: AudioStreamPlayer2D = $Area2D/AudioStreamPlayer2D
@onready var collision: CollisionShape2D = $Area2D/CollisionShape2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _on_area_2d_body_entered(body):
	if body is Player:
		# 1. Register the collection with your game controller
		GameController.coin_collected(value)
		
		# 2. Make the coin instantly disappear and stop tracking collisions
		animated_sprite.visible = false
		collision.set_deferred("disabled", true)
		
		# 3. Play the audio stream
		coin_sound.play()
		
		# 4. Wait for the audio track to end before deleting this node
		await coin_sound.finished
		self.queue_free()
