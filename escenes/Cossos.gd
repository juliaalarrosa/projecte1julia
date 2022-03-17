extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 980
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

var velocitat_base = 200
var direccio  = Vector2.DOWN

func _physics_process (delta):
	move_and_slide(velocitat * direccio)
	velocitat += gravetat * delta

