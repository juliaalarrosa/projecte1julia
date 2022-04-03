extends KinematicBody2D

var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 980
var velocitat_base = 200
var direccio  = Vector2.DOWN
var velocitat_salt = -500
func _physics_process (delta):
	velocitat.x = 0
	velocitat += gravetat * delta
	if Input.is_action_pressed ("dreta"):
		velocitat += Vector2.RIGHT * velocitat_base
	if Input.is_action_pressed ("esquerra"):
		velocitat += Vector2.LEFT * velocitat_base
	if Input.is_action_just_pressed("devant") and is_on_floor():
		velocitat.y = velocitat_salt
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
	velocitat = move_and_slide (velocitat, Vector2.UP)
	anima(velocitat)

func anima(velocitat):
	if velocitat.x > 0:
		$AnimatedSprite.play("corre")
		$AnimatedSprite.flip_h = false
	elif velocitat.x < 0:
		$AnimatedSprite.play("corre")
		$AnimatedSprite.flip_h = true
	
	if abs(velocitat.x) < 0.1:
		$AnimatedSprite.play("quiet")
	
	if velocitat.y < 0:
		$AnimatedSprite.play("salta")


func _on_final_body_entered(body):
	get_tree().change_scene("res://escenes/pantalla2.tscn")


func _on_muerte_body_entered(body):
	if body.name=="CosAnimat":
		get_tree().reload_current_scene()

func _on_Area2D_body_entered(body):
	if body.name=="CosAnimat":
		get_tree().reload_current_scene()



	


func _on_llegada2_body_entered(body):
	get_tree().change_scene("res://escenes/pantalla3.tscn")
	pass # Replace with function body.
