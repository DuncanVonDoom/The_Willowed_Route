extends VehicleBody3D

# Called when the node enters the scene tree for the first time.
func _ready():
	export var speed := 10.0
	var _velocity := Vector3.ZERO
	var _snap_vector := Vector3.DOWN

	onready var _spring_arm: SpringArm = $SpringArm
	onready var _model: Spatial = $carProtagonist

func _physics_process(delta: float) -> void:
	var move_direction := Vector3.ZERO
	move_direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	move_direction.z = Input.get_action_strength("back") - Input.get_action_strength("forward")
	move_direction = move_direction.rotated(Vector3.UP, _spring_arm.rotation.y).normalized()
		
	_velocity.x = move_direction.x * speed
	_velocity.z = move_direction.z * speed
	pass # Replace with function body.
