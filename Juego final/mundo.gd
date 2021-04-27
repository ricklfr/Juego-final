extends Node2D

export(PackedScene) var proyect
var Score

func _ready():
	randomize()
func nuevojuego():
	Score = 0
	$player.inicio($Position2D.position)
	$iniciotimer.start()

func game_over():
	$scoretimer.stop()
	$rocatimer.stop()

func _on_iniciotimer_timeout():
	$rocatimer.start()
	$scoretimer.start()

func _on_scoretimer_timeout():
	#Score += 1
	pass


func _on_rocatimer_timeout():
	$Path2D/PathFollow2D.set_offset(randi())
	var R = proyect.instance()
	add_child(R)
	var d = $Path2D/PathFollow2D.rotation
	
	R.position = $Path2D/PathFollow2D.position
	
	d += rand_range(-PI / 4, PI/4)
	R.rotation = d
	R.set_linear_velocity(Vector2(rand_range(R.velocidad_min, R.velocidad_max),0).rotated(d) )
	
	
