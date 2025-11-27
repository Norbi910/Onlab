extends Control

var is_visible: bool = false
@onready var volume_slider: HSlider = %VolumeSlider
@onready var settings_button: Button = %SettingsButton

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		if is_visible:
			visible = false
			get_tree().paused = false
			is_visible = false
		else:
			visible = true
			get_tree().paused = true
			is_visible = true

func _on_resume_button_pressed() -> void:
	Input.action_press("pause")


func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_settings_button_pressed() -> void:
	settings_button.disabled = true
	settings_button.visible = false
	volume_slider.scrollable = true
	volume_slider.visible = true
	
func _on_h_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, value)
	AudioServer.set_bus_mute(0, (value == volume_slider.min_value))
