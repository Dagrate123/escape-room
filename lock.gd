extends Node2D

var inside_dropable = true
@onready var L = $LineEdit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	L.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func change_cursor_hand():
	Input.set_custom_mouse_cursor(Global.on_cursor) #endrer cursor
	inside_dropable = true #og den detecter at musen er inni dropable
 
func change_cursor_back():
	Input.set_custom_mouse_cursor(Global.hand_cursor)
	inside_dropable = false
		 
 
func _input(event: InputEvent) -> void: #når du klikker så vises linediten
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if inside_dropable:
			L.visible = true


func _on_line_edit_text_submitted(new_text: String) -> void:
	Global.code_input = (new_text)
	print(Global.code_input)
	
	var array_as_string = ""
	for element in Global.paper_array:
		array_as_string += str(element) + " "  #legger til mellomrom
		array_as_string = array_as_string.strip_edges()  # fjermer unødvendig innhold
	if Global.code_input == array_as_string:
		print("go dudes")
		Global.part_2show = true
