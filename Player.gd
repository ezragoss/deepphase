extends Node2D

var tile_map: TileMap

# Either DEFENSE=0 or OFFENSE=1
var role_index: int

# Called when the node enters the scene tree for the first time.
func _ready():
	tile_map = get_node("../TileMap")
	gamestate.new_turn.connect(_handle_new_turn)
	
func _handle_new_turn(index: int):
	if index == gamestate.DEFENSE_PLAYER_INDEX:
		print("My turn!")
	else:
		print("Their turn!")
		
func _unhandled_defense_input(event):
	var tile_pos = tile_map.mouse_to_tile()
		
	var area = [
		TileSet.CELL_NEIGHBOR_BOTTOM_LEFT_SIDE,
		TileSet.CELL_NEIGHBOR_BOTTOM_RIGHT_SIDE,
		TileSet.CELL_NEIGHBOR_BOTTOM_CORNER
	]
	
	var neighbors = []
	for neighbor in area:
		neighbors.append(tile_map.get_neighbor_cell(tile_pos, neighbor))

	tile_map.set_suppression(neighbors + [tile_pos])
	
func _unhandled_input(event):
	"""
	Handles mouse movement
	"""
	if gamestate.current_player == gamestate.DEFENSE_PLAYER_INDEX:
		_unhandled_defense_input(event)
