extends Node3D

@export var pivot: Node3D
@export var max_speed_rotation: float = 720
@export var reverse_rotation: bool
@export_group("debug")
@export var actual_rotation : float

func _set_rotation_percent(percent: float):
	actual_rotation = max_speed_rotation * percent
	
func _process(delta: float) -> void:
	var multiple: float = 1 if reverse_rotation else -1
	pivot.rotate_x(deg_to_rad(actual_rotation * delta * multiple))
