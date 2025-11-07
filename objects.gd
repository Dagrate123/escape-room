extends StaticBody2D

var inside_dropable = false

# Called when the node ensssssssters the scene tree for the first time.
func _ready() -> void:
	modulate = Color(Color.MEDIUM_PURPLE, 0.7)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func change_cursor_hand():
	Input.set_custom_mouse_cursor(Global.on_cursor) #endrer cursor
	inside_dropable = true #og den detecter at musen er inni dropable
 
func change_cursor_back():
	Input.set_custom_mouse_cursor(Global.hand_cursor)
	inside_dropable = false
	
func _input(event: InputEvent) -> void: #når du klikker så fjernes busken
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if inside_dropable:
			#locksound
			pass
