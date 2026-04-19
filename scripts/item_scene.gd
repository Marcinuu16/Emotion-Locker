extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		print("zebrałeś itemek")
		queue_free()


func _on_mouse_entered() -> void:
	$AnimatedSprite2D.frame += 1


func _on_mouse_exited() -> void:
	$AnimatedSprite2D.frame -= 1
