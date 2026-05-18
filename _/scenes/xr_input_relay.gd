extends Node

signal right_hand_joystick_update(joystick_r:Vector2)
signal left_hand_joystick_update(joystick_l:Vector2)
signal x_button_is_pressed(is_x_pressed:bool)
signal grip_left_is_pressed(is_grip_pressed: bool)
signal grip_left_is_down()

@export var left_hand : XRController3D
@export var right_hand : XRController3D
@export var label_debug : Label3D

func _process(delta : float) -> void :
	var joystick_r : Vector2 = get_right_joystick_2d_value()
	var x_button : bool = get_x_button()
	right_hand_joystick_update.emit(joystick_r)
	x_button_is_pressed.emit(x_button)
	if label_debug != null : 
		label_debug.text = "\n".join([joystick_r,x_button])
	var is_gripped_down : bool = left_hand.get_float("grip") > 0.9
	if(is_gripped_down):
		grip_left_is_down.emit()
	
# Helper variables to keep our code readable
@onready var origin_node = $%XROrigin3D
@onready var camera_node = $%XROrigin3D/XRCamera3D
	
# Listen to the joystick
func get_right_joystick_2d_value() -> Vector2:
	if not right_hand:
		return Vector2.ZERO
	for name in ["primary", "thumbstick", "joystick", "secondary"]:
		var value = right_hand.get_vector2(name)
		if value.length() > 0.01:   # small deadzone
			return value
	return Vector2.ZERO
	
# END - Listen to the joystick

func get_x_button() -> bool:
	if not left_hand:
		return false
	return left_hand.is_button_pressed("ax_button")

func get_left_grip() -> bool:
	if not left_hand:
		return false
	return left_hand.is_button_pressed("grip")
