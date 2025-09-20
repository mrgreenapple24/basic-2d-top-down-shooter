extends RigidBody2D

const BULLETSPEED = 300
var direction
@onready var sprite_2d: Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tex := ModManager.get_texture("bullet", "res://Assets/bullet.png")
	if tex and tex != $Sprite2D.texture:
		$Sprite2D.texture = tex
		$Sprite2D.modulate = Color(1, 1, 1, 1)
		$Sprite2D.scale = Vector2(1, 1)
	pass # Replace with function body.
	gravity_scale = 0
	angular_velocity = 0
	$BulletTimer.start()
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_bullet_timer_timeout() -> void:
	queue_free()
	pass # Replace with function body.
