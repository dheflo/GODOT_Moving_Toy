extends Node

@export var character : CharacterBody3D
@export var max_speed_forward_in_mps : float = 2.5
@export var max_rotation_in_degrees : float = 90
@export_range(-1,1,0.01) var joystick_forward_intensity : float = 0
@export_range(-1,1,0.01) var joystick_rotation_intensity : float = 0


func _ready() -> void:
	if character == null:
		push_warning("Where is my f*king characterbody3D ?")

func set_joystick_forward(percentage : float) :
	joystick_forward_intensity = percentage

func set_joystick_rotation(percentage : float) :
	joystick_rotation_intensity = percentage

func _process(delta: float) -> void:
	var position : Vector3 = character.global_position
	var direction_forward : Vector3 = -character.basis.z
	direction_forward.y = 0
	position = position + direction_forward * delta * max_speed_forward_in_mps * joystick_forward_intensity
	character.global_position = position
	character.rotate_y(deg_to_rad(max_rotation_in_degrees) * delta * -joystick_rotation_intensity)
