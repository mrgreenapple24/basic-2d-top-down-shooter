extends CharacterBody2D

var bullet_scene : PackedScene = load("res://Scenes/bullet.tscn")
const SPEED = 300
const BULLETSPEED = 2000
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var bg: Sprite2D = $"../Sprite2D"


func _ready() -> void:
	var tex := ModManager.get_texture("player", "res://Assets/player.png")
	if tex and tex != $Sprite2D.texture:
		$Sprite2D.texture = tex
		$Sprite2D.modulate = Color(1, 1, 1, 1)
	
	var text := ModManager.get_texture("bg", "res://Assets/bg.png")
	if text and text != bg.texture:
		bg.texture = text
		bg.modulate = Color(1, 1, 1, 1)
	pass # Replace with function body.

func _physics_process(_delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * SPEED

	move_and_slide()

	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("LMB"):
		fire()

func fire():
	var bullet = bullet_scene.instantiate()
	bullet.position = position
	bullet.rotation = rotation
	var direction = (get_global_mouse_position() - global_position).normalized()
	bullet.linear_velocity = direction * BULLETSPEED
	get_tree().get_root().add_child(bullet)
	pass

func kill():
	get_tree().call_deferred("reload_current_scene")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if "Enemy" in body.name:
		kill()
	pass # Replace with function body.
