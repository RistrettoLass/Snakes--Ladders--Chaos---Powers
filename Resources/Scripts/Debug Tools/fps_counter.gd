extends RichTextLabel

func _process(delta: float) -> void:
	var fps = int(1.0 / delta)
	var string : String
	if fps < 30: string = "[color=#e36e4b]"+str(fps)+"[/color]"
	else: string = "[color=#8bbf37]"+str(fps)+"[/color]"
	text = "FPS: "+str(string)
