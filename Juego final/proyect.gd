extends RigidBody2D

export (int)var velocida_min
export (int)var velocida_max
var tipo_roca = ['grande','pequeño']

func _ready():
	$AnimatedSprite.animation = tipo_roca[randi() % tipo_roca.size()]
	if $AnimatedSprite.animation == 'grande':
		$CollisionShape2D.scale.x = 1.5

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
