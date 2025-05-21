extends Node2D

@onready var mainMenu = "res://Resources/Scene/Main_Menu.tscn"
var players = []

func _on_main_menu_btn_pressed() -> void:
	get_tree().change_scene_to_file(mainMenu)

func _ready():
	ButtonAudioManager.connect_buttons(self)
