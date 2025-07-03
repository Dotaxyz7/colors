draw_set_color(c_white);
draw_set_font(fnt_intro)
var linha = "";
var y_atual = y_texto;
var max_larg = max_largura;

for (var i = 1; i <= letras_mostradas; i++) {
    var letra = string_char_at(texto, i);
    var teste_linha = linha + letra;

    // Verifica largura do texto atual na linha
    if (string_width(teste_linha) > max_larg) {
        // Quebra linha: desenha linha atual, começa nova linha
        draw_text(x_texto, y_atual, linha);
        linha = letra;
        y_atual += linha_altura;
    } else {
        linha = teste_linha;
    }
}

// Desenha última linha (restante)
draw_text(x_texto, y_atual, linha);
