gravidade = .4

acel_chao = .2
acel_ar = .07

acel = acel_chao

desl = 2

// Velocidades
hveloc = 0
vveloc = 0

len=10

max_hveloc = 6
max_vveloc = 8

// Controle do chão e parede
chao=false
parede_dir = false
parede_esq = false

// Dash
dura = room_speed/4
dir=0
carga = 2
set = 255

// Pulo
limite_pulo = 6
timer_pulo = 0

limite_buffer = 6
timer_queda = 0
buffer_pulo = false

// Parede
limite_parede = 6
timer_parede = 0
ultima_parede = 0

// Escala
xscale = 1
yscale = 1

// Direção de olhar
ver = 1

// Máquina de estados
enum state {
    parado,
    movendo,
    dash
}

estado = state.parado

if (!instance_exists(obj_camera)){
    instance_create_layer(x,y, "Instances", obj_camera)
}

image_blend = c_white

limite_recarga = room_speed // tempo no chão para recarregar (1 segundo)
timer_recarga = 0
max_carga = 1


