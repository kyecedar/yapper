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
	RIGHT_OPEN,
	RIGHT_CLOSE,
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



static var obold_pattern := "[b]"
static var cbold_pattern := "[/b]"
static var oitalic_pattern := "[i]"
static var citalic_pattern := "[/i]"
static var ounderline_pattern := "[u]"
static var cunderline_pattern := "[/u]"
static var ostrikethrough_pattern := "[s]"
static var cstrikethrough_pattern := "[/s]"
static var ocode_pattern := "[code]"
static var ccode_pattern := "[/code]"
static var ocenter_pattern := "[center]"
static var ccenter_pattern := "[/center]"
static var oleft_pattern := "[left]"
static var cleft_pattern := "[/left]"
static var oright_pattern := "[right]"
static var cright_pattern := "[/right]"
static var ofill_pattern := "[fill]"
static var cfill_pattern := "[/fill]"
static var oindent_pattern := "[indent]"
static var cindent_pattern := "[/indent]"

static var lrm_pattern := "[lrm]"
static var rlm_pattern := "[rlm]"
static var lre_pattern := "[lre]"
static var rle_pattern := "[rle]"
static var lro_pattern := "[lro]"
static var rlo_pattern := "[rlo]"
static var pdf_pattern := "[pdf]"
static var alm_pattern := "[alm]"
static var lri_pattern := "[lri]"
static var rli_pattern := "[rli]"
static var fsi_pattern := "[fsi]"
static var pdi_pattern := "[pdi]"
static var zwnj_pattern := "[zwnj]"
static var wj_pattern := "[wj]"
static var shy_pattern := "[shy]"

static var regex_paragraph := RegEx.new()
static var regex_paragraph_pattern := ""
static var cparagraph_pattern := "[/p]"

static var regex_char := RegEx.new()
static var regex_char_pattern := ""



static func tag_format(text: String) -> YapperTag:
	var tag = YapperTag.new()
	
	if text.contains(obold_pattern):
		tag.type = YapperTagType.BOLD_OPEN
	elif text.contains(cbold_pattern):
		tag.type = YapperTagType.BOLD_CLOSE
	elif text.contains(ounderline_pattern):
		tag.type = YapperTagType.UNDERLINE_OPEN
	elif text.contains(cunderline_pattern):
		tag.type = YapperTagType.UNDERLINE_CLOSE
	elif text.contains(ostrikethrough_pattern):
		tag.type = YapperTagType.STRIKETHROUGH_OPEN
	elif text.contains(cstrikethrough_pattern):
		tag.type = YapperTagType.STRIKETHROUGH_CLOSE
	elif text.contains(ocode_pattern):
		tag.type = YapperTagType.CODE_OPEN
	elif text.contains(ccode_pattern):
		tag.type = YapperTagType.CODE_CLOSE
	elif text.contains(ocenter_pattern):
		tag.type = YapperTagType.CENTER_OPEN
	elif text.contains(ccenter_pattern):
		tag.type = YapperTagType.CENTER_CLOSE
	elif text.contains(oleft_pattern):
		tag.type = YapperTagType.LEFT_OPEN
	elif text.contains(cleft_pattern):
		tag.type = YapperTagType.LEFT_CLOSE
	elif text.contains(oright_pattern):
		tag.type = YapperTagType.RIGHT_OPEN
	elif text.contains(cright_pattern):
		tag.type = YapperTagType.RIGHT_CLOSE
	elif text.contains(ofill_pattern):
		tag.type = YapperTagType.FILL_OPEN
	elif text.contains(cfill_pattern):
		tag.type = YapperTagType.FILL_CLOSE
	elif text.contains(oindent_pattern):
		tag.type = YapperTagType.INDENT_OPEN
	elif text.contains(cindent_pattern):
		tag.type = YapperTagType.INDENT_CLOSE
	
	return tag

static func text_tag(text: String) -> YapperTag:
	var tag = YapperTag.new()
	
	tag.type = YapperTagType.TEXT
	tag.content = text
	
	return tag
