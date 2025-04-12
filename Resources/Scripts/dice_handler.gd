extends Node2D

var canRoll : bool = true # Boolean Variable declaring whether a player is allowed to roll.

func roll() -> int:
	randomize() # Change the seed of the random number generator ; increases randomness.
	return (randi_range(1,6)) # Random Number Generator for a D6.

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("roll"):
		if canRoll: print(roll())
		else: print_rich("[color=red][b]Cannot roll right now![/b][/color]") 
