extends Node2D

var is_dragging = false
var hand_cursor = preload("res://main room/Micro Icon Pack/Computer Systems/1. Pointer.png")
var on_cursor = preload("res://main room/Micro Icon Pack/Computer Systems/3. Hand Hover.png")

var paper_array = []

var paper_opened = false
var paper_number = null

var code_input = null

var part_2show = false

var win = false

func _ready() -> void:
	for i in 4:
		var my_random_number = (randi() % 10)
		paper_array.append(my_random_number)
		print(my_random_number)
	print(paper_array[3])
