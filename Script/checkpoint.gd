extends Node2D


@export var spawnpoint = false
var activated = false

func activate():
	activated = true
	$AnimationPlayer.play("Activated")


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent() is Player && !activated:
		activate()
