extends Node

var click_sound: AudioStream = preload("res://Resources/Assets/SFX/blipSelect.wav")
var player: AudioStreamPlayer

func _ready():
	player = AudioStreamPlayer.new()
	player.stream = click_sound
	add_child(player)

func play_click():
	player.set_pitch_scale(randf_range(0.89,1.12))
	if player.playing:
		player.stop()
	player.play()

func connect_buttons(node: Node):
	for child in node.get_children():
		if child is Button:
			if not child.pressed.is_connected(_on_button_pressed):
				child.pressed.connect(_on_button_pressed)
		elif child.get_child_count() > 0:
			connect_buttons(child)

func _on_button_pressed():
	play_click()
