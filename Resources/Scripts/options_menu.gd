extends Control

func _ready() -> void:
	$"Main Settings".show()
	$"Video Settings".hide()
	$"Video Settings".hide()
	ButtonAudioManager.connect_buttons(self)

func _on_video_settings_pressed() -> void:
	$"Main Settings".hide()
	$"Video Settings".show()

func _on_audio_settings_pressed() -> void:
	$"Main Settings".hide()
	$"Audio Settings".show()

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Resources/Scene/Main_Menu.tscn")

func _on_mstr_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, value)

func _on_sfx_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(1, value)

func _on_mus_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(2, value)

func _on_button__pressed() -> void:
	$"Main Settings".show()
	$"Audio Settings".hide()

func _on_button___pressed() -> void:
	$"Main Settings".show()
	$"Video Settings".hide()


func _on_fs_cb_toggled(toggled_on: bool) -> void: # Toggles fullscreen upon button signal
	var mode := DisplayServer.window_get_mode()
	var is_window : bool = mode != DisplayServer.WINDOW_MODE_FULLSCREEN
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN if is_window else DisplayServer.WINDOW_MODE_WINDOWED)

func _on_bl_cb_pressed() -> void: # Toggles border upon button signal
	pass

func _on_vs_cb_pressed() -> void:
	var mode := DisplayServer.window_get_vsync_mode()
	var is_vsync : bool = mode != DisplayServer.VSYNC_ENABLED
	DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED if is_vsync else DisplayServer.VSYNC_DISABLED) 
