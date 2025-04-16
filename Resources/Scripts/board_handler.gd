extends Node2D

@export_category("Board Settings")
@export var board_x : int = 5
@export var board_y : int = 5

const RATIOS = {"Snakes": 7, "Ladders": 7, "Shops": 50, "Obstacles": 16, "Traps": 5}
const VECTORTYPES = ["Snakes", "Ladders"]

var board : Array = []
var reserved_indices : Array = []
var tiles_available : Dictionary = {}

## Tile Class
class Tile:
	var type : String
	var index : int
	var x : int
	var y : int
	
	func _init(type: String, index: int, x:int, y:int):
		self.type = type
		self.index = index
		self.x = x
		self.y = y
## End Tile Class


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

func _ready() -> void:
	board.resize(board_x * board_y)
	tiles_available = set_available_tiletypes()
	generate_board()
	print(board)

func generate_board():
	var required_iterations = sum(RATIOS.values())
	var selected_index = 0
	var selected_tile = ""
	
	if required_iterations > 0:
		selected_index = randi_range(0, board.size() - 1)
		selected_tile = pick_random(tiles_available)
		if selected_tile in VECTORTYPES:
			create_vector_tile(selected_tile, selected_index)
		else:
			pass

func create_vector_tile(tile: String, index: int):
	match tile:
		"Snakes":
			randi_range(1,index - 1)
