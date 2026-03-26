extends Node2D

@onready var rect: ColorRect = $ColorRect
@onready var text_1: RichTextLabel = $gameover_text
@onready var restart_btn: Button = $RestartButton
@onready var hint_text: RichTextLabel = $HintText

func _ready() -> void:
	rect.size = get_viewport_rect().size
	text_1.global_position = (get_viewport_rect().size * 0.5) - Vector2(250, 120)
	restart_btn.global_position = (get_viewport_rect().size * 0.5) - Vector2(110, -10)
	hint_text.global_position = (get_viewport_rect().size * 0.5) - Vector2(170, -70)
	hint_text.text = "Press the button or R to restart"

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		restart_game()
		return

	if event is InputEventKey and event.pressed and not event.echo and event.keycode == KEY_R:
		restart_game()

func _on_restart_button_pressed() -> void:
	restart_game()

func restart_game() -> void:
	get_tree().reload_current_scene()
