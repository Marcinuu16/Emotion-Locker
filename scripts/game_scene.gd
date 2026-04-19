extends Node2D
@onready var items = ["gum", "drink", "note1",  "note2",  "note3", "paper" , "pen" ,"trash", "book","pin","braclet","ticket","headphones","diary"];
@onready var game = get_tree().current_scene
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func load_screen(path, old_scene_name):
	var locks = game.get_node("corridor/lockers").get_children()
	print(locks)

	var old_scene = game.get_node(old_scene_name)
	old_scene.queue_free()

	game.get_node("corridor").queue_free()

	var new_scene = load("res://scenes/inside_locker_scene.tscn").instantiate()
	new_scene.name = "szafka"
	game.add_child(new_scene)

	var random_item = items.pick_random()
	var index_item = items.find(random_item)

	print("Random item: ", random_item, " at Index:", index_item)

	var random_shelf = randi() % 4 + 1
	var pathy = "Area2D%d/AnimatedSprite2D" % random_shelf

	var item = new_scene.get_node(pathy)
	item.frame = index_item * 2
