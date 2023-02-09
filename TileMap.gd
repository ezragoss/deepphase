extends TileMap


const _BLACK_TILE_COORD = Vector2i(0, 0)
const _WHITE_TILE_COORD = Vector2i(1, 0)
const _BLACK_SUPPRESSION_COORD = Vector2i(0, 1)
const _WHITE_SUPPRESSION_COORD = Vector2i(1, 1)

var map_data

# Called when the node enters the scene tree for the first time.
func _ready():
	map_data = self.get_meta("Map")
	for coord in map_data:
		self.set_cell(0, coord, 0, _BLACK_TILE_COORD)
	get_viewport().size_changed.connect(_handle_screen_resize)

func _handle_screen_resize():
	print(get_viewport_rect().size / 2)
	transform.origin = Vector2(get_viewport_rect().size / 2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _unhandled_input(event):
	var tile_pos = self.mouse_to_tile()
	
	if Input.is_action_just_released("Up"):
		if self.get_cell_atlas_coords(0, tile_pos) == _BLACK_TILE_COORD:
			self.set_cell(0, tile_pos, 0, _WHITE_TILE_COORD)
		else:
			self.set_cell(0, tile_pos, 0, _BLACK_TILE_COORD)
		
		map_data.append(tile_pos)

func mouse_to_tile():
	var mouse_pos = self.get_local_mouse_position()
	return self.local_to_map(mouse_pos)

func set_suppression(tile_list: Array):
	var add_suppression = []
	var remove_suppression = []
	for pos in map_data:
		if tile_list.has(Vector2i(pos)):
			add_suppression.append(pos)
		else:
			remove_suppression.append(pos)
	for pos in add_suppression:
		if self.get_cell_atlas_coords(0, pos) == _BLACK_TILE_COORD:
			self.set_cell(1, pos, 0, _WHITE_SUPPRESSION_COORD)
		else:
			self.set_cell(1, pos, 0, _BLACK_SUPPRESSION_COORD)
	for pos in remove_suppression:
		self.set_cell(1, pos, -1)

