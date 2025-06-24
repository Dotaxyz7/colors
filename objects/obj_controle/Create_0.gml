// Definir a resolução da tela
var display_width = display_get_width();
var display_height = display_get_height();

room_set_width(room, display_width);
room_set_height(room, display_height);

// Definir o jogo para tela cheia
window_set_fullscreen(true);
