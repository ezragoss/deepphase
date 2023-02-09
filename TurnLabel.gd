extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	gamestate.new_turn.connect(_handle_new_turn)

func _handle_new_turn(index: int):
	if index == gamestate.DEFENSE_PLAYER_INDEX:
		self.text = "DEFENSE"
	else:
		self.text = "OFFENSE"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
