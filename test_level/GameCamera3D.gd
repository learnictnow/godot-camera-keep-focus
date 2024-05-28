extends Camera3D

@export var player_1:Node3D
@export var player_2:Node3D
@export var offset = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.


#code inside camera node
const CAMERA_SPEED = 150.0
func _process(delta):
	
	var target_pos = (player_1.global_position + player_2.global_position) * 0.5
	
	var distance_between = player_1.global_position.distance_to(player_2.global_position) + offset
	#
	#print(target_pos)
	##set_global_pos(get_global_pos().linear_interpolate(target_pos, CAMERA_SPEED * delta))
	global_position = Vector3(target_pos.x, distance_between, target_pos.z)

	#self.global_position = (player_1.global_position + player_2.global_position) * 0.5
#
	#var zoom_factor1 = abs(player_1.global_position.x-player_2.global_position.x)
	#var zoom_factor2 = abs(player_1.global_position.y-player_2.global_position.y)
	#var zoom_factor = max(max(zoom_factor1, zoom_factor2), 100)
#
	#print(zoom_factor)
#
	#self.fov = zoom_factor
