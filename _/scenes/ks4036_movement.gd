extends Node

@export var character : CharacterBody3D

func _ready() -> void:
	if character == null:
		push_warning("Where is my f*king characterbody3D ?")

func _process(delta: float) -> void:
	var forward : Vector3 = character.global_position
	forward = forward + Vector3(0,0,-1) * delta
	character.global_position = forward
