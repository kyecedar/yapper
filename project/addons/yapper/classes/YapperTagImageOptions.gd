extends YapperTagOptions
class_name YapperTagImageOptions



var color : Color # TODO : set inherited
var width : int # TODO : set inherited
var height : int # TODO : set inherited

## Region rect of the image. This can be used to display a single image from a spritesheet.
var region : Rect2 # TODO : set inherited

## If set to [code]true[/code], and the image is smaller than the size specified by [code]width[/code] and [code]height[/code], the image padding is added to match the size instead of upscaling.
var pad : bool = false

## Image tooltip.
var tooltip : String = ""
