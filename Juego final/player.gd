 extends Area2D
export var velocidad = 400
var Movimiento = Vector2()
var limite
signal golpe

func _ready():
	#hide()
	limite = get_viewport_rect().size




func _process(delta):
	Movimiento = Vector2()
	if Input.is_action_pressed("ui_right"):
		Movimiento.x += 1
	if Input.is_action_pressed("ui_left"):
		Movimiento.x -= 1
	if Input.is_action_pressed("ui_down"):
		Movimiento.y += 1
	if Input.is_action_pressed("ui_up"):
		Movimiento.y -= 1
	if Movimiento.length() > 0: 
		Movimiento = Movimiento.normalized() * velocidad
	position += Movimiento * delta
	position.x = clamp(position.x, 0, limite.x)
	position.y = clamp(position.y, 0, limite.y)
	if Movimiento.x != 0:
		$AnimatedSprite.animation = 'derecha'
		$AnimatedSprite.flip_h = Movimiento.x < 0
	elif Movimiento.y < 0:
		$AnimatedSprite.animation = 'espalda'
		$AnimatedSprite.flip_v = Movimiento.y > 0
	elif Movimiento.y > 0:
		$AnimatedSprite.animation = 'frente_activ'
	else:
		$AnimatedSprite.animation = 'frente'



func inicio(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false;
	
func _on_player_area_entered(area):
	velocidad -= 100
	if velocidad <= 0:
		queue_free()
	
