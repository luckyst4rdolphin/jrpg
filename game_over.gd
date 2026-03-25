extends Node2D

@onready var rect: ColorRect = $ColorRect
@onready var text_1: RichTextLabel = $gameover_text

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rect.size = get_viewport_rect().size
	text_1.text = 'GAME OVER'
	text_1.global_position = (get_viewport_rect().size * 0.5) - Vector2(250, 100)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
