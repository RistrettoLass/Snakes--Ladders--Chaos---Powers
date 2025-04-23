extends Node2D

@export_category("Board Settings")
@export var board_x : int = 5
@export var board_y : int = 5

const RATIOS = {"Snakes": 7, "Ladders": 7, "Shops": 50, "Obstacles": 16, "Traps": 5} # 
const VECTORTYPES = ["Snakes", "Ladders"] # List of Vector Tile types

var board : Array = []
var tiles_to_set : Dictionary = {}

## Predefining a 2D array | See 3.3 -> Algorithm Design
var inputSpace = []
var outputSpace = []

## Important Array/Dictionary Functions 
func pick_random(dictionary: Dictionary) -> Variant: # Picks 
	var random_key = dictionary.keys().pick_random()
	return dictionary[random_key]

func sum(array: Array) -> int:
	var sum = 0
	for element in array: 
		sum += element
	return sum

func set_available_tiletypes() -> Dictionary: # Assign the number of possible tile types based on RATIOS
	var counts = {}
	for key in RATIOS.keys():  
		counts[key] = (board.size() / RATIOS[key])  
	return counts

func _ready() -> void: # Called when the scene is initialised.
	board.resize(board_x * board_y) # Sets the board to the correct length as an empty array.
	tiles_to_set = set_available_tiletypes()
	generate_board()
	print(board)

func generate_board():
	var required_iterations = sum(RATIOS.values())
	var selected_index = 0
	var selected_tile = ""
	
	if required_iterations > 0:
		selected_index = randi_range(0, board.size() - 1)
		selected_tile = pick_random(tiles_to_set)
		if selected_tile in VECTORTYPES:
			create_vector_tile(selected_tile, selected_index)
			selected_tile -= 1
		else:
			board[selected_index] = selected_tile
			pass

func create_vector_tile(tile: String, index: int):
	match tile:
		"Snakes":
			board[index] = "SnakeStart"
			board[randi_range(1, index - 1)] = "SnakeEnd"
		"Ladders":
			randi_range(index + 1, board.size() - 2) 
