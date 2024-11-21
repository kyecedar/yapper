extends Node
class_name YapperTag

## Mostly ported from RichTextLabel. Not all work yet.
enum YapperTagType {
	TEXT,
	BOLD_OPEN,
	BOLD_CLOSE,
	ITALIC_OPEN,
	ITALIC_CLOSE,
	UNDERLINE_OPEN,
	UNDERLINE_CLOSE,
	STRIKETHROUGH_OPEN,
	STRIKETHROUGH_CLOSE,
	CODE_OPEN,
	CODE_CLOSE,
	CHAR,
	PARAGRAPH_OPEN,
	PARAGRAPH_CLOSE,
	CENTER_OPEN,
	CENTER_CLOSE,
	LEFT_OPEN,
	LEFT_CLOSE,
	FILL_OPEN,
	FILL_CLOSE,
	INDENT_OPEN,
	INDENT_CLOSE,
	URL_OPEN,
	URL_CLOSE,
	HINT_OPEN,
	HINT_CLOSE,
	IMG_OPEN,
	IMG_CLOSE,
	FONT_OPEN,
	FONT_CLOSE,
	FONT_SIZE_OPEN,
	FONT_SIZE_CLOSE,
	DROPCAP_OPEN,
	DROPCAP_CLOSE,
	OPENTYPE_FEATURES_OPEN,
	OPENTYPE_FEATURES_CLOSE,
	LANG_OPEN,
	LANG_CLOSE,
	COLOR_OPEN,
	COLOR_CLOSE,
	BGCOLOR_OPEN,
	BGCOLOR_CLOSE,
	FGCOLOR_OPEN,
	FGCOLOR_CLOSE,
	OUTLINE_SIZE_OPEN,
	OUTLINE_SIZE_CLOSE,
	OUTLINE_COLOR_OPEN,
	OUTLINE_COLOR_CLOSE,
	TABLE_OPEN,
	TABLE_CLOSE,
	CELL_OPEN,
	CELL_CLOSE,
	UL_OPEN,
	UL_CLOSE,
	OL_OPEN,
	OL_CLOSE,
	LB, ## Left bracket.
	RB, ## Right bracket.
	
	# no clue what these are, just ported from RichTextLabel.
	LRM, ## Left-to-right mark.
	RLM, ## Right-to-left mark.
	LRE, ## Left-to-right embedding.
	RLE, ## Right-to-left embedding.
	LRO, ## Left-to-right override.
	RLO, ## Right-to-left override.
	PDF, ## Pop directional formatting.
	ALM, ## Arabic letter mark.
	LRI, ## Left-to-right isolate.
	RLI, ## Right-to-left isolate.
	FSI, ## First strong isolate.
	ZWJ, ## Zero-width joiner.
	ZWNJ, ## Zero-width non-joiner.
	WJ, ## Word joiner.
	SHY, ## Soft hyphen.
}

var type : YapperTagType
var content : String = ""
var options : YapperTagOptions = null



static var regex_bold := RegEx.new()



static func tag_format(text: String) -> YapperTag:
	return null
