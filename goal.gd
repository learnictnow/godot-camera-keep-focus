extends Node3D

signal score
@export var team = "Blue"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	if body.is_in_group("Ball"):
		print("Ball Here")
		if team == "Blue":
			GameManager.blue_score += 1
			score.emit()
			body.linear_velocity = Vector3.ZERO
			body.angular_velocity = Vector3.ZERO
			body.global_position = Vector3(0,10,0)
	pass # Replace with function body.
