extends Node2D

var canRoll : bool = true # Boolean Variable declaring whether a player is allowed to roll.
@onready var rollBTN = $"../RollBTN"

@onready var rollLabel = $"../RollOutput"

func roll() -> int:
	randomize() # Change the seed of the random number generator ; increases randomness.
	return (randi_range(1,12)) # Random Number Generator for a D6.

func _on_roll_btn_pressed(player) -> void:
	if canRoll: 
		rollLabel.set_text("Output: [color=#]"+ str(roll()))
		canRoll = false
		get_tree().create_timer(3.0)
		canRoll = true
	else: 
		print_rich("[color=red][b]Cannot roll right now![/b][/color]") 

func send_to_player(player):
	pass
