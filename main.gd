extends Node3D

@export var box_scene: PackedScene
@export var initial_y_offset: float= 2
@export var initial_z_offset: float= -3
@export var random_rotation: bool= false
@export var constant_force: Vector3= Vector3(0, 0, -1000)



func _ready() -> void:
	randomize()
	drop_boxes()


func drop_boxes():
	for i in range(-10, 10):
		drop_box(i, i >= 0)


func drop_box(x: float, ccd: bool):
	var box: RigidBody3D= box_scene.instantiate()
	box.position= Vector3(x, initial_y_offset, initial_z_offset)
	box.constant_force= constant_force
	box.continuous_cd= ccd
	if random_rotation:
		box.rotation.y= randf()
	add_child(box)
