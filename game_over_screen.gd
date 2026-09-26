extends CanvasLayer

func _ready():
	hide() 
	process_mode = Node.PROCESS_MODE_ALWAYS
	EventController.connect("game_over", _on_game_over)

func _on_game_over() -> void:
	show()
	get_tree().paused = true 

# 💥 RAW ENGINE INPUT OVERRIDE 💥
# This fires whenever ANYTHING is clicked anywhere on your screen
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			print("RAW ENGINE CLICK DETECTED at position: ", event.position)
			
			# Force a level restart instantly if the game over screen is open
			if visible:
				print("Game Over Screen is visible. Forcing reload now!")
				GameController.total_coins = 979
				get_tree().paused = false
				get_tree().reload_current_scene()
