extends Node2D
 
var draggable = false #kan du dra den
var inside_dropable = false #er den inni
var body_ref: Node2D
var offset: Vector2
var initialPos: Vector2 #originalpos

func _ready() -> void:
	Input.set_custom_mouse_cursor(Global.hand_cursor)
 
func _process(_delta: float) -> void:
	if draggable and Global.part_2show: #hvis du kan dra den
		if Input.is_action_just_pressed("click"): #klikk
			initialPos = global_position #lagrer initial_pos som den nåverende pos
			offset = get_global_mouse_position() - global_position #lengden mellom mus og position
			Global.is_dragging = true
			print("start_dragging")
 
		elif Input.is_action_pressed("click") and Global.is_dragging:
			global_position = get_global_mouse_position() - offset #følger etter musen
			print("følger etter musen")
 
		elif Input.is_action_just_released("click") and Global.is_dragging:
			Global.is_dragging = false
			print("released")
			var tween = get_tree().create_tween() #lager keyframes sånn at det blir smooth
			print("tweening")
 
			if inside_dropable and body_ref:
				tween.tween_property(self, "global_position", body_ref.global_position, 0.2).set_ease(Tween.EASE_OUT)
				print("jeg er på plass")
				queue_free()
				change_cursor_back()
				Global.win = true
			else:
				tween.tween_property(self, "global_position", initialPos, 0.2).set_ease(Tween.EASE_OUT)
				print("jeg er tilbake")
				
	if Global.part_2show:
		$".".visible = true
	else:
		$".".visible = false
 
 
 
func change_cursor_hand():
	Input.set_custom_mouse_cursor(Global.on_cursor)
	if not Global.is_dragging:
		draggable = true
		scale = Vector2(1.05, 1.05)
 
 
func change_cursor_back():
	Input.set_custom_mouse_cursor(Global.hand_cursor)
	if not Global.is_dragging:
		draggable = false
		scale = Vector2(1, 1)
 
 
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print("oh yeah")
 
 
func _on_area_2d_body_entered(body: Node2D) -> void: #hvis den kan bli puttet der så blir den puttet der
	if body.is_in_group("dropable"):
		inside_dropable = true
		body.modulate = Color(Color.REBECCA_PURPLE, 1)
		body_ref = body
 
 
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("dropable"):
		inside_dropable = false
		body.modulate = Color(Color.MEDIUM_PURPLE, 0.7)
