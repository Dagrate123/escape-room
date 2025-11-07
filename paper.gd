extends Node2D

var inside_paper = null

@onready var papers = [$paper1, $paper2, $paper3, $paper4]



func _ready():
	for paper in papers:
		paper.get_node("Area2D").mouse_entered.connect(_on_paper_mouse_entered.bind(paper))
		paper.get_node("Area2D").mouse_exited.connect(_on_paper_mouse_exited.bind(paper))
	

		
func _on_paper_mouse_entered(paper: Node) -> void:
	Input.set_custom_mouse_cursor(Global.hand_cursor)
	inside_paper = paper

func _on_paper_mouse_exited(paper: Node) -> void:
	Input.set_custom_mouse_cursor(Global.on_cursor)
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if inside_paper:
			var index = papers.find(inside_paper)
			if index != -1:
				# Kombinerer/zipper de sammen
				Global.paper_number = Global.paper_array[index]
				
			Global.paper_opened = true
			inside_paper = null
