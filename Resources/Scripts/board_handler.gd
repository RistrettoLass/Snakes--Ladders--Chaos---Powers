extends Node2D

@export_category("Board Settings")
@export var board_x : int = 5
@export var board_y : int = 5

var length = board.size() # Get the size of the Board.
var ratios = {"Snakes": 7, "Ladders": 7, "Shops": 50, "Obstacles": 16, "Traps": 5}

var board : Array = []

func _ready() -> void:
	board.resize(board_x * board_y)
	print(board)

func set_available_tiletypes():
	var counts = {}
	for key in ratios.keys():  
		counts[key] = (length / ratios[key])  # Assign the number of possible tile types

func populate_board(board : Array):
	var tile : int = randi() / (board.size()+1)
	if tile == 1 or tile == (board.size): # Reroll if the first or last index
		tile = randi() / (board.size()+1)

func generate_vectortype(index: int):
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
