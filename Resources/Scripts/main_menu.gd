extends Control



func _on_singleplayer_pressed() -> void:
	get_tree().change_scene_to_file("res://Resources/Scene/game.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
