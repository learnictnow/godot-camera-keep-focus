extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	_on_goal_score()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_goal_score():
	$HUD/GridContainer/LabelBlueScore.text = str(GameManager.blue_score)
	$HUD/GridContainer/LabelRedScore.text = str(GameManager.red_score)
	pass # Replace with function body.
