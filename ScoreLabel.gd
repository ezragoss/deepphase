extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	gamestate.new_point.connect(_handle_new_point)

func _handle_new_point(total: int):
	self.text = "%d/%d" % [total, gamestate.score_limit]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
