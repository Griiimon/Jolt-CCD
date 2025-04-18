extends RigidBody3D

@export var ccd_material: StandardMaterial3D

@onready var mesh_instance_3d: MeshInstance3D = $MeshInstance3D



func _ready() -> void:
	if continuous_cd:
		mesh_instance_3d.mesh.surface_set_material(0, ccd_material)


func _physics_process(delta: float) -> void:
	if position.y < -5:
		queue_free()
