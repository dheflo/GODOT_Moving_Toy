extends Node

@export var left_hand : Node3D
@export var what_to_move : Node3D

func reset_position():
	what_to_move.global_position = left_hand.global_position
