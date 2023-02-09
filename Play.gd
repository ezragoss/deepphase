extends Button

func _ready():
	self.pressed.connect(_handle_press)

func _handle_press():
	get_tree().change_scene_to_file("res://round.tscn")
