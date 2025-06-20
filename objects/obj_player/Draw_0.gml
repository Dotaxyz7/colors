if (hveloc != 0){
    ver = sign(hveloc)
}

draw_sprite_ext(sprite_index, image_index, 
    x, y + (sprite_height/6 - sprite_height/6 * yscale),
    xscale * ver, yscale,
    image_angle, image_blend, image_alpha)
