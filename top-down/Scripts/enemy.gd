extends CharacterBody2D

var speed = 3

func _ready():
	var tex := ModManager.get_texture("enemy", "res://Assets/enemy.png")
	if tex and tex != $Sprite2D.texture:
		$Sprite2D.texture = tex
		$Sprite2D.modulate = Color(1, 1, 1, 1)
	pass # Replace with function body.

func _physics_process(delta):
	var motion = Vector2()
	var Player = get_parent().get_node("Player")
	
	motion += (Vector2(Player.position) - position)
	look_at(Player.position)
	
	motion = motion.normalized() * speed
	move_and_collide(motion)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name != "wall" and body.name != "Player" and not body.is_in_group("Obstacle"):
		body.queue_free()
		queue_free()
	pass # Replace with function body.
