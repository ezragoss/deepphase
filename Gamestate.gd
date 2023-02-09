extends Node2D

class_name Gamestate

const DEFENSE_PLAYER_INDEX = 0
const OFFENSE_PLAYER_INDEX = 1

var current_player

var score_limit: int
var current_score: int
var turn_limit: int
var current_turn: int

signal new_turn(player_index: int)
signal new_point(new_score: int)

# Called when the node enters the scene tree for the first time.
func _ready():
	current_player = DEFENSE_PLAYER_INDEX
	current_turn = 0
	current_score = 0

func switch_turn():
	"""
	Toggle whose turn it is.
	"""
	current_player = int(not bool(current_player))
	new_turn.emit(current_player)
	
func increment_turn():
	current_turn += 1
	switch_turn()
	
func add_point():
	"""
	Add a point to the offense score
	"""
	current_score += 1
	new_point.emit(current_score)
