extends RigidBody2D

const BULLETSPEED = 300
var direction

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
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
