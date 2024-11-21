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

## Length of only the portion of text that is rendered.
var rendered_length : int : get = _get_rendered_length



static var regex_tag_open := RegEx.new()
static var regex_tag_open_pattern := "\\[[a-zA-Z0-9]+[=]?[^\\[\\]]*\\]"
static var regex_tag_close := RegEx.new()
static var regex_tag_close_pattern := "\\[\\/[a-zA-Z0-9]+\\]"

var test : String = "Lorem ipsum dolor sit amet, [b]consectetur adipiscing elit[/b], [char=uf6e3]sed do eiusmod tempor incididunt ut labore [font otv=\"wght=200,wdth=400\"]et dolore magna aliqua[/font]. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit [ashit][thefuck]in [color=#FFFFFF88]voluptate[/color] velit esse cillum dolore [pulse freq=1.0 color=#ffffff40 ease=-2.0]eu fugiat nulla pariatur.[/pulse] Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

const VERY_GOOD_VERY_COOL_RENTXT_PRFIX : String = ",?)"



func _enter_tree() -> void:
	rendered_text = VERY_GOOD_VERY_COOL_RENTXT_PRFIX + text
	regex_tag_open.compile(regex_tag_open_pattern)
	regex_tag_close.compile(regex_tag_close_pattern)
	
	get_formatted()



## Try to run as little as possible.
func get_formatted() -> Array[YapperTag]:
	var full_text : String = test
	
	var onext : RegExMatch = regex_tag_open.search(full_text) ## Next opening tag.
	var cnext : RegExMatch = regex_tag_close.search(full_text) ## Next closing tag.
	var tags : Dictionary = {}
	var ostart : int ## Start of next opening tag.
	var cstart : int ## Start of next closing tag.
	
	# find tags, remove them from text, and put them in tags.
	# keeps track of if opening or closing tag comes first so the index will always be accurate to the just text string.
	while onext or cnext:
		ostart = onext.get_start() if onext else -1
		cstart = cnext.get_start() if cnext else -1
		
		# only closing tags left.
		if not onext:
			if not tags.has(cstart):
				tags[cstart] = []
			
			tags[cstart].append("c" + cnext.get_string())
			full_text = full_text.substr(0, cstart) + full_text.substr(cnext.get_end())
			
			cnext = regex_tag_close.search(full_text)
			continue
		
		# only opening tags left.
		elif not cnext:
			if not tags.has(ostart):
				tags[ostart] = []
			
			tags[ostart].append("o" + onext.get_string())
			full_text = full_text.substr(0, ostart) + full_text.substr(onext.get_end())
			
			onext = regex_tag_open.search(full_text)
			continue
		
		# next opening comes before next closing.
		if ostart < cstart:
			if not tags.has(ostart):
				tags[ostart] = []
			
			tags[ostart].append("o" + onext.get_string())
			full_text = full_text.substr(0, ostart) + full_text.substr(onext.get_end())
			
			onext = regex_tag_open.search(full_text)
		
		# next closing comes before next opening.
		else:
			if not tags.has(cstart):
				tags[cstart] = []
			
			tags[cstart].append("c" + cnext.get_string())
			full_text = full_text.substr(0, cstart) + full_text.substr(cnext.get_end())
			
			cnext = regex_tag_close.search(full_text)
	
	rendered_text = VERY_GOOD_VERY_COOL_RENTXT_PRFIX + full_text
	
	print()
	print(full_text)
	print()
	print(tags)
	print()
	
	var formatted : Array = []
	
	var keys = tags.keys()
	var last_index : int = 0
	
	for key in keys:
		# scan before, add text.
		formatted.append(full_text.substr(last_index, key))
		
		last_index = key
		
		for tag in tags[key]:
			formatted.append(_get_tag_from_text(tag))
	
	if keys:
		# scan last portion of the text.
		formatted.append(full_text.substr(last_index))
		print(keys[-1])
	
	print(formatted)
	
	return []

func _get_tag_from_text(string: String) -> YapperTag:
	var opening = string.begins_with("o")
	
	return null



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
