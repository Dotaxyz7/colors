contador++;

if (contador >= velocidade) {
    contador = 0;
    if (letras_mostradas < string_length(texto)) {
        letras_mostradas++;
        if (som_cooldown <= 0) {
            audio_play_sound(snd_digit, 1, false);
            som_cooldown = intervalo_som;
        }
    }
}

// Atualiza o cooldown do som
if (som_cooldown > 0) {
    som_cooldown--;
}


if (keyboard_check_pressed(vk_enter)){
	
	room_goto(Room1)
}