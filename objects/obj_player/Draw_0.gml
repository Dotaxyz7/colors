if (hveloc != 0){
    ver = sign(hveloc)
}

draw_sprite_ext(sprite_index, image_index, 
    x, y + (sprite_height/6 - sprite_height/6 * yscale),
    xscale * ver, yscale,
    image_angle, image_blend, image_alpha)

// Caixa de texto acima da cabeça do player com número de cargas e cronômetro
var texto = string(carga);
var altura = y - sprite_height * yscale - 20;

// Estilo
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Caixa de fundo
draw_set_alpha(0.7);
draw_set_color(c_black);
draw_rectangle(x - 16, altura - 10, x + 16, altura + 10, false); // borda
draw_set_alpha(0.4);
draw_rectangle(x - 16, altura - 10, x + 16, altura + 10, true); // fundo
draw_set_alpha(1);

// Texto de carga
draw_set_color(c_white);
draw_text(x, altura, texto);

// Cronômetro abaixo da caixa (só se a carga não está cheia)
if (carga < max_carga) {
    var segundos_restantes = round((limite_recarga - timer_recarga) / room_speed);
    var altura_crono = altura + 14;

    draw_set_color(c_red);
    draw_text(x, altura_crono, string(segundos_restantes) + "s");
}
