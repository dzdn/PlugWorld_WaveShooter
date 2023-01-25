extends Sprite

var speed = 150
var velocity = Vector2()

var bullet = preload("res://Bullet.tscn")

var can_shoot = true

func _process(delta):
	velocity.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	velocity.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	
	velocity = velocity.normalized()
	
	global_position += speed * velocity * delta
	
	if Input.is_action_pressed("click") && Global.node_creation_parent != null && can_shoot:
		Global.instance_node(bullet, global_position, Global.node_creation_parent)
		$ReloadSpeed.start()
		can_shoot = false


func _on_ReloadSpeed_timeout():
	can_shoot = true
