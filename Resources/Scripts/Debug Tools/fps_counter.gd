extends RichTextLabel

func _process(delta: float) -> void:
	var fps = int(Engine.get_frames_per_second())
	text = "FPS: "+str(fps)
