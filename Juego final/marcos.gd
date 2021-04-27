extends Area2D
var speed = 400
var life
func _ready():
	var scal = rand_range(0.3,0.7)
	scale = Vector2(scal,scal)
	if scal >= 0.7:
		life = 3
		speed =600
	if scal <=0.5:
		life = 2
		speed = 700
	if scal<= 0.4:
		life=1
		speed=750
func _process(delta):
	position += Vector2(0,speed*delta)


func _on_Timer_timeout():
	queue_free()
