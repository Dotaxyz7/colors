// Tamanho base do jogo (câmera/view)
var base_w = 480;
var base_h = 320;

// Tamanho real da tela
var screen_w = display_get_width();
var screen_h = display_get_height();

// Escala pixel-perfect (fator inteiro)
var scale = min(floor(screen_w / base_w), floor(screen_h / base_h));

// Tamanho final da janela do jogo
var final_w = base_w * scale;
var final_h = base_h * scale;

// Centralizar a janela
var offset_x = (screen_w - final_w) div 2;
var offset_y = (screen_h - final_h) div 2;

// Aplicar configurações
window_set_size(final_w, final_h);
window_set_position(offset_x, offset_y);

display_set_gui_size(base_w, base_h); // GUI do HUD etc.
surface_resize(application_surface, final_w, final_h);

// Fullscreen
window_set_fullscreen(true);
