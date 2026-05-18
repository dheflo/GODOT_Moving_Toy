extends Node

@export var character : CharacterBody3D

func _ready() -> void:
	if character == null:
		push_warning("Where is my f*king characterbody3D ?")

func _process(delta: float) -> void:
	var position : Vector3 = character.global_position
	var direction_forward : Vector3 = -character.basis.z
	direction_forward.y = 0
	position = position + direction_forward * delta
	character.global_position = position
