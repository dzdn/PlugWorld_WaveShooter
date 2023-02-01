extends Sprite

var speed = 75

var velocity = Vector2()

var stun = false
var hp = 3

func _process(delta):
	if Global.player != null and stun == false:
		velocity = global_position.direction_to(Global.player.global_position)
	elif stun:
		velocity = lerp(velocity, Vector2(0, 0), 0.3)
	
	global_position += velocity * speed * delta
	
	if hp <= 0:
		queue_free()


func _on_Hitbox_area_entered(area):
	if area.is_in_group("enemy_damager"):
		modulate = Color.white
		velocity = -velocity * 6
		hp -= 1
		stun = true
		$StunTimer.start()
		area.get_parent().queue_free()
	


func _on_StunTimer_timeout():
	modulate = Color("e23333")
	stun = false
