extends CharacterBody3D

@export var movement_speed: float = 2.0
@onready var navigation_agent: NavigationAgent3D = get_node("NavigationAgent3D")
@export var target: CharacterBody3D
var targetPosition:Vector3

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready() -> void:
	navigation_agent.velocity_computed.connect(Callable(_on_velocity_computed))
	targetPosition = target.position

func set_movement_target(movement_target: Vector3):
	navigation_agent.set_target_position(movement_target)

func _physics_process(delta):
	set_movement_target(target.position)
	if target.position != self.position:
		var rayPOS = target.position
		rayPOS.y = self.position.y
		look_at(rayPOS)
		
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	if navigation_agent.is_navigation_finished():
		return

	var next_path_position: Vector3 = navigation_agent.get_next_path_position()
	var new_velocity: Vector3 = global_position.direction_to(next_path_position) * movement_speed
	if navigation_agent.avoidance_enabled:
		navigation_agent.set_velocity(new_velocity)
	else:
		_on_velocity_computed(new_velocity)

func _on_velocity_computed(safe_velocity: Vector3):
	velocity = safe_velocity
	move_and_slide()


func _on_pursue_area_body_entered(body):
	if body.is_in_group("Player"):
		target = body
	
	pass # Replace with function body.


func _on_pursue_area_body_exited(body):
	if body.is_in_group("Player"):
		target = self
	
	pass # Replace with function body.



func _on_death_area_body_entered(body):
	if body.is_in_group("Player"):
		body.respawn()
	pass # Replace with function body.
