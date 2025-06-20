// Colisão Horizontal
if place_meeting(x + hveloc, y, obj_plataforma){
    while (!place_meeting(x + sign(hveloc), y, obj_plataforma)){
        x += sign(hveloc)
    }
    hveloc = 0
}
x += hveloc

// Colisão Vertical
if place_meeting(x, y + vveloc, obj_plataforma){
    while (!place_meeting(x, y + sign(vveloc), obj_plataforma)){
        y += sign(vveloc)
    }
    vveloc = 0
}
y += vveloc
