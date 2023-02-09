extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	self.pressed.connect(gamestate.switch_turn)
