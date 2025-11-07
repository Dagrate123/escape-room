extends Node2D
 
var inside_dropable = false
 
func _ready() -> void:
	Input.set_custom_mouse_cursor(Global.hand_cursor) #setter hånda til custom 
 
func change_cursor_hand():
	Input.set_custom_mouse_cursor(Global.on_cursor) #endrer cursor
	scale = Vector2(1.05, 1.05) #gjør den større
	inside_dropable = true #og den detecter at musen er inni dropable
 
func change_cursor_back():
	Input.set_custom_mouse_cursor(Global.hand_cursor)
	scale = Vector2(1, 1)
	inside_dropable = false
		 
 
func _input(event: InputEvent) -> void: #når du klikker så fjernes busken
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if inside_dropable and Global.part_2show:
			queue_free()
			
func _process(delta: float) -> void:
	if Global.part_2show:
		$".".visible = true
	else:
		$".".visible = false
 
