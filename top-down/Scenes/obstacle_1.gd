extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gravity_scale = 0
	var tex := ModManager.get_texture(name.to_lower(), "res://Assets/" + name.to_lower() + ".png")
	if tex and tex != $Sprite2D.texture:
		$Sprite2D.texture = tex
		$Sprite2D.modulate = Color(1, 1, 1, 1)
	pass # Replace with function body.
