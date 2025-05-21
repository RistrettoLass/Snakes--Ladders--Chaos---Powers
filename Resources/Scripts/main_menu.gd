extends Control

func _ready():
	ButtonAudioManager.connect_buttons(self)

func _on_singleplayer_pressed() -> void:
	get_tree().change_scene_to_file("res://Resources/Scene/game.tscn")

func _on_quit_pressed() -> void:
	await get_tree().create_timer(1).timeout
	get_tree().quit()


func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://Resources/Scene/Options_Menu.tscn")
