@tool
extends EditorPlugin



func _enter_tree():
	# Initialization of the plugin goes here.
	add_custom_type("Yapper", "Node3D", preload("Yapper.gd"), preload("icon.png"))

func _exit_tree():
	# Clean-up of the plugin goes here.
	remove_custom_type("Yapper")
