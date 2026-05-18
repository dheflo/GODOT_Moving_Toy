extends Node

signal joystick_update(joystick : Vector2)

@export var input_map_rotate_left : String = "rotate_left"
@export var input_map_rotate_right : String = "rotate_right"
@export var input_map_move_forward : String = "move_forward"
@export var input_map_move_back : String = "move_back"

func _process(delta: float) -> void:
	var joystick : Vector2 = Input.get_vector(
		input_map_rotate_left,
		input_map_rotate_right,
		input_map_move_back, 
		input_map_move_forward)
	joystick_update.emit(joystick)
