extends Label

func _ready() -> void:
	text = _changeTime()

func _changeTime() -> String:
	var timer:= Time.get_datetime_dict_from_system() 
	var format_Time: String = "%02d:%02d" % [timer.hour, timer.minute]
	return format_Time


func _on_timer_timeout() -> void:
	text = _changeTime()
