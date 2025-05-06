extends Node2D

@export_category("Board Settings")
@export var board_x : int = 5
@export var board_y : int = 5

const RATIOS = {"Snakes": 4, "Ladders": 4, "Shops": 50, "Obstacles": 16, "Traps": 5} # 
const VECTORTYPES = ["Snakes", "Ladders"] # List of Vector Tile types

var board : Array = []
var tiles_to_set : Dictionary = {}

## Predefining a 2D array | See 3.3 -> Algorithm Design
var inputSpace = []
var outputSpace = []

## Important Array/Dictionary Functions 
func pick_random(dictionary: Dictionary) -> Variant: # Picks a non-zero value from a dictionary
	var random_key = dictionary.keys().filter(func(n): return dictionary[n] > 0)
	if random_key.size() == 0:
		return null
	return random_key.pick_random()

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
	# board.resize(board_x * board_y) # Sets the board to the correct length as an empty array.
	# tiles_to_set = set_available_tiletypes()
	# generate_board()
	# print(board)
	pass

func generate_board():
	var required_iterations = sum(tiles_to_set.values())
	var selected_index = 0
	var selected_tile = ""
	
	while required_iterations > 0:
		selected_index = randi_range(1, board.size() - 1)
		
		
		if board[selected_index] != null:
			continue # Avoids overwriting already set tiles.
		
		selected_tile = pick_random(tiles_to_set)
		
		if selected_tile == null:
			break # Safety precaution
		
		if selected_tile in VECTORTYPES:
			create_vector_tile(selected_tile, selected_index)
		else:
			board[selected_index] = selected_tile
		
		tiles_to_set[selected_tile] -= 1
		required_iterations -= 1

func create_vector_tile(tile: String, index: int):
	match tile:
		"Snakes":
			var points_to = randi_range(1, index - 1)
			
			while board[points_to] != null:
				points_to = randi_range(1, index - 1)
			
			inputSpace.append(index)
			outputSpace.append(points_to)
			
			board[index] = {"type": "Snake", "to": points_to}
			board[points_to] = {"type": "Snaketail"}
		"Ladders":
			var points_to = randi_range(index + 1, board.size() - 2)
			
			while board[points_to] != null:
				points_to = randi_range(index + 1, board.size() - 2)
			inputSpace.append(index)
			outputSpace.append(points_to)
			
			board[index] = {"type": "Ladder", "to": points_to}
			board[points_to] = {"type": "Laddertail"}
			 
	
