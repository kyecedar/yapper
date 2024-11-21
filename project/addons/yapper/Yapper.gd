@tool
extends Node3D



@export_multiline var text : String = "" : set = _set_text

@export var enable_formatting : bool = false

## From start to end, how many characters are hidden.[br][b][code]0[/code] means none is hidden.[/b]
@export_range(0, 100000, 1, "or_greater", "suffix:index") var hide_start : int = 0

## From end to start, how many characters are hidden.[br][b][code]0[/code] means none is hidden.[/b]
@export_range(0, 100000, 1, "or_greater", "suffix:index") var hide_end   : int = 0

## When letters scatter, what should they collide with?
@export_flags_3d_physics var collision_mask = 0

@export var billboard : BaseMaterial3D.BillboardMode = BaseMaterial3D.BillboardMode.BILLBOARD_DISABLED



## Only the portion of text that is rendered.
var rendered_text : String : set = _set_rendered_text
var rendered_length : int : get = _get_rendered_length



var regex_tag_open := RegEx.new()
var regex_tag_open_pattern := "\\[[a-zA-Z0-9]+[=]?[^\\[\\]]*\\]"
var regex_tag_close := RegEx.new()
var regex_tag_close_pattern := "\\[\\/[a-zA-Z0-9]+\\]"

var test : String = "Lorem ipsum dolor sit amet, [b]consectetur adipiscing elit[/b], [char=uf6e3]sed do eiusmod tempor incididunt ut labore [font otv=\"wght=200,wdth=400\"]et dolore magna aliqua[/font]. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit [ashit][thefuck]in [color=#FFFFFF88]voluptate[/color] velit esse cillum dolore [pulse freq=1.0 color=#ffffff40 ease=-2.0]eu fugiat nulla pariatur.[/pulse] Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

const VERY_GOOD_VERY_COOL_RENTXT_PRFIX = ",?)"



func _enter_tree() -> void:
	rendered_text = VERY_GOOD_VERY_COOL_RENTXT_PRFIX + text
	regex_tag_open.compile(regex_tag_open_pattern)
	regex_tag_close.compile(regex_tag_close_pattern)
	#regex_match_tag_open.compile("\\[[a-zA-Z0-9]+[=]?[^\\[\\]]*\\]")
	#for thing in regex_match_tag_open.search_all(test):
		#print()
		#print(thing.get_start())
		#print(thing.get_end())
		#print(thing.get_string())
	
	get_formatted()
	



func get_formatted() -> Array[YapperItem]:
	var temp_text : String = test
	
	rendered_text = VERY_GOOD_VERY_COOL_RENTXT_PRFIX
	regex_tag_open.compile("\\[[a-zA-Z0-9]+[=]?[^\\[\\]]*\\]")
	
	var thing : RegExMatch = regex_tag_open.search(temp_text)
	var openers : Array = []
	var closers : Array = []
	var start : int
	
	while thing:
		start = thing.get_start()
		temp_text = temp_text.substr(0, start) + temp_text.substr(thing.get_end())
		openers.append([start, thing.get_string()])
		thing = regex_tag_open.search(temp_text)
	
	thing = regex_tag_close.search(temp_text)
	
	while thing:
		start = thing.get_start()
		temp_text = temp_text.substr(0, thing.get_start()) + temp_text.substr(thing.get_end())
		closers.append([start, thing.get_string()])
		thing = regex_tag_close.search(temp_text)
	
	print()
	print(temp_text)
	print()
	print(openers)
	print()
	print(closers)
	
	#print()
	#print()
	#print(thing.get_start())
	#print(thing.get_end())
	#print(thing.get_string())
	return []



#region // GETTERS & SETTERS

func _set_text(val: String) -> void:
	text = val

func _set_rendered_text(val: String) -> void:
	if val.begins_with(VERY_GOOD_VERY_COOL_RENTXT_PRFIX):
		rendered_text = val.substr(3)
		return
	push_warning("Cannot set via 'rendered_text' member. It's only meant to be used to get currently rendered text.")

func _get_rendered_length() -> int:
	return rendered_text.length()

#endregion GETTERS & SETTERS
