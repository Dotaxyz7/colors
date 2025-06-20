var temp = place_meeting(x, y + 1, obj_plataforma)

if (temp && !chao){
    xscale = 1.2
    yscale = .8
}

if keyboard_check_pressed(vk_enter){
    game_restart()
}
