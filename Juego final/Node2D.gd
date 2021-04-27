extends Node2D
var Meteoro = preload("res://marcos.tscn")


func _on_meteotime_timeout():
	$Path2D/PathFollow2D.set_unit_offset(randf()*1)
	var meteoro = Meteoro.instance()
	meteoro.position= $Path2D/PathFollow2D.global_position
	get_parent().add_child(meteoro)
