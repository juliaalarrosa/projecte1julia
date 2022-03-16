extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#var velocitat = Vector2(200,100)
export var velocitat = Vector2(200,300)
var velocitat_angular = 30
var direccio = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	position = Vector2(500,250)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	direccio = Vector2.ZERO
	if Input.is_action_pressed("dreta"):
		direccio += Vector2(1,0)
	if Input.is_action_pressed("esquerra"):
		direccio += Vector2(-1,0)
	if Input.is_action_pressed("devant"):
		direccio += Vector2(0,-1)
	if Input.is_action_pressed("derrera"):
		direccio += Vector2(0,1)	
	
	
	
	
	position += direccio.normalized() * velocitat * delta
	#position+= velocitat*delta
	#rotation_degrees += 30 *delta
	
	#if position.x >= 1024 or position.x <= 0:
	#	velocitat.x = velocitat.x * (-1)
	#if position.y >= 600 or position.y <= 0:
	#	velocitat *= -1
	
	#$fill.rotation_degrees += velocitat_angular


func _on_Personatge_area_entered(area):
	print("iep")
	modulate = Color (1, 0, 0)
	area.modulate = Color (0, 1, 0)
	if area.name == "Zona":
		modulate = Color (1, 0, 0)
	elif area.name == "Zona2":
		modulate = Color (0, 1, 0)


func _on_Personatge_area_exited(area):
	modulate = Color (1,1,1)
	area.modulate = Color (1,1,1)
