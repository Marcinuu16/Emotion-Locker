extends Node2D

func _on_exit_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		print(get_tree().current_scene.get_tree_string())
		
		var root = get_tree().current_scene
		root.get_node("szafka").queue_free()

		var new_scene = load("res://scenes/corridor_scene.tscn").instantiate()
		new_scene.name = "corridor"
		root.game.add_child(new_scene)

		print("powrot")
