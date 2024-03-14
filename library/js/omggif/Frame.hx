package js.omggif;

typedef Frame =
{
	var data_length : Int;
	var data_offset : Int;
	var delay : Int;
	var disposal : Int;
	var has_local_palette : Bool;
	var height : Int;
	var interlaced : Bool;
	var palette_offset : Int;
	var palette_size : Int;
	var transparent_index : Int;
	var width : Int;
	var x : Int;
	var y : Int;
}