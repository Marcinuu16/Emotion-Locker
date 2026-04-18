extends Node2D

@onready var state = "closed"
@onready var locker_sprite = $Area2D/AnimatedSprite2D
@onready var sound_player = $Area2D/AudioStreamPlayer2D

func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_area_2d_mouse_entered() -> void:
	if state == "closed":
		locker_sprite.animation = "default"
		locker_sprite.frame = 1
		print("podkreslam zamkniete ")
	elif state == "open":
		locker_sprite.animation = "opened"
		locker_sprite.frame = 1
		print("podkreslam otwarte")

func _on_area_2d_mouse_exited() -> void:
	if state == "closed":
		locker_sprite.animation = "default"
		locker_sprite.frame = 0
		print("nie podkreslam zamkniete ")
	elif state == "open":
		locker_sprite.animation = "opened"
		locker_sprite.frame = 0
		print("nie podkreslam otwarte")
	
func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if state == "closed":
				locker_sprite.play("moving")
				state = "moving_to_open"
			if state == "open":
				locker_sprite.play_backwards("moving")
				state = "moving_to_close"
		elif event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			print("wchodze")
		
		sound_player.play()
	
func _on_animated_sprite_2d_animation_finished() -> void:
	var animation = locker_sprite.animation
	
	if animation == "moving" and state == "moving_to_open":
		print("otwarte")
		state = "open"	
	elif animation == "moving" and state == "moving_to_close":
		print("zamknięte")
		state = "closed"
