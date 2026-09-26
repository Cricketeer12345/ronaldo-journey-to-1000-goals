class_name game_controller extends Node

var total_coins: int = 979
@export var target_coins: int = 1000

func coin_collected(value: int):
	total_coins += value
	EventController.emit_signal("coin_collected", total_coins)
	if total_coins >= target_coins:
		EventController.emit_signal("game_over")
