extends Control

@onready var start = $VBoxContainer/start
@onready var vs_player = $VBoxContainer/vs
@onready var vs_ai = $VBoxContainer/vsai
@onready var options = $VBoxContainer/opions
@onready var exit = $VBoxContainer/exit
@onready var back = $VBoxContainer/back


func _ready():
	vs_player.visible = false
	vs_ai.visible = false
	back.visible = false
	
func reset():
	start.visible = true
	options.visible = true
	exit.visible = true
	vs_ai.visible = false
	vs_player.visible = false
	back.visible = false
	




func _on_start_pressed():
	start.visible =false
	options.visible = false
	exit.visible = false
	vs_ai.visible = true
	vs_player.visible =true
	back.visible = true

	print("start pressed")


func _on_options_pressed():
	print("options pressed")


func _on_exit_pressed():
	get_tree().quit()
	print("exit pressed")
	


func _on_vs_pressed():
	get_tree().change_scene_to_file("res://scenes/vs_player.tscn")
	print("vs pressed")


func _on_vs_ai_pressed():
	get_tree().change_scene_to_file("res://scenes/background.tscn")
	print("vs ai pressed")


func back_pressed():
	reset()
	print("back pressed")
	
