extends Node

@export var left_hand : Node3D
@export var what_to_move : Node3D

#func is_grip_pressed(delta:float) -> void:
	#var _position : Vector3 = left_hand.global_position
	#if not is_gripped:
		#return
	#else:
		#is_gripped = true
		#position = _position

func reset_position():
	what_to_move.global_position = left_hand.global_position
