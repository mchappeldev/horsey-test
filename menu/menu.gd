extends Node2D



func _ready() -> void:
	var menu_buttons = get_tree().get_nodes_in_group("menu_buttons")
	for menu_button in menu_buttons:
		menu_button.pressed.connect(_launch_game.bind(menu_button))
	
	
func _launch_game(menu_button) -> void:
	get_tree().change_scene_to_packed(menu_button.scene);
