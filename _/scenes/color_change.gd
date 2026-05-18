extends MeshInstance3D

func color_change(is_x_pressed: bool) -> void:
	var material = get_active_material(0)
	var color: Color
	
	if not is_x_pressed :
		color = Color.html("#57ff7b")
	else: 
		color = Color.SIENNA
		
	material.albedo_color = color
