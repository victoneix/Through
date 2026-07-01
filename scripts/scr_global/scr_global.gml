global.transition = true;
function trasicao_end(){
	global.transition = false;
	layer_sequence_destroy(sq_start);
}

/// @description Adds a shadow to text.
/// @function draw_text_shadow_ext_transformed(x, y, string, font, shadow_size, shadow_colour, text_colour, sep, w, xscale, yscale, angle);
/// @param x
/// @param y
/// @param string
/// @param font
/// @param shadow_size
/// @param shadow_color
/// @param text_color
/// @param _sep
/// @param _w
/// @param _xscale
/// @param _yscale
/// @param _angle
function draw_text_shadow_ext_transformed(){
    var _x, _y, _string, _font, _shadow_size, _shadow_colour, _text_colour, _sep, _w, _xscale, _yscale, _angle;
    _x = argument[0];
    _y = argument[1];
    _string = argument[2];
    _font = argument[3];
    _shadow_size = argument[4];
    _shadow_colour = argument[5];
    _text_colour = argument[6];
	_sep = argument[7];
	_w = argument[8];
	_xscale = argument[9];
	_yscale = argument[10];
	_angle = argument[11];
    draw_set_font(_font);
    draw_set_colour(_shadow_colour);
    draw_text_ext_transformed((_x + _shadow_size), (_y + _shadow_size), string(_string), (_sep + _shadow_size), (_w + _shadow_size), _xscale, _yscale, _angle);
    draw_set_colour(_text_colour);
    draw_text_ext_transformed(_x, _y, string(_string), _sep, _w, _xscale, _yscale, _angle);
}