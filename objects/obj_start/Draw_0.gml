draw_set_halign(1);
draw_set_valign(1);
draw_sprite_ext(spr_logo, 0, 256/2, 64, 2, 2, 0, c_white, 1);

draw_text_shadow_ext_transformed(256/2, 88, "created by victoneix 2026", fnt_text, 0.8, #212123, c_white, 0, 999, 0.8, 0.8, 0);

draw_set_halign(0);
draw_set_valign(0);