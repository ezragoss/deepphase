extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pressed.connect(_handle_press)


func _handle_press():
	get_tree().quit()
