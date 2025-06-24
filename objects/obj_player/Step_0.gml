// === COLISÕES ===
chao = place_meeting(x, y + 1, obj_plataforma);
parede_dir = place_meeting(x + 1, y, obj_plataforma);
parede_esq = place_meeting(x - 1, y, obj_plataforma);

if (chao) {
    timer_pulo = limite_pulo;
} else {
    if (timer_pulo > 0) timer_pulo--;
}

if (parede_dir || parede_esq) {
    ultima_parede = parede_dir ? 0 : 1;
    timer_parede = limite_parede;
} else {
    if (timer_parede > 0) timer_parede--;
}

// === CONTROLES ===
var direita = keyboard_check(ord("D"));
var esquerda = keyboard_check(ord("A"));
var pulo = keyboard_check(ord("Q"));
var pulo_s = keyboard_check_released(ord("Q"));
var dash = keyboard_check_pressed(ord("L"));
var up = keyboard_check(ord("W"));
var down = keyboard_check(ord("S"));

acel = chao ? acel_chao : acel_ar;
var avanco_h = (direita - esquerda) * max_hveloc;

// === MÁQUINA DE ESTADOS ===
switch (estado) {

case state.parado:
    hveloc = 0;
    vveloc = 0;

    if (!chao) vveloc += gravidade;

    if (abs(hveloc) > 0 || abs(vveloc) > 0 || direita || esquerda || pulo) {
        estado = state.movendo;
    }

    if (dash && carga > 0) {
        dir = point_direction(0, 0, (direita - esquerda), (down - up));
        estado = state.dash;
        carga -= 1;
        timer_recarga = 0;
    }
break;

case state.movendo:
    if (chao && down) {
        xscale = 1.5;
        yscale = 0.5;
    }

    hveloc = lerp(hveloc, avanco_h, acel);

    if (abs(hveloc) > max_hveloc - 0.5 && chao) {
        if (random(100) > 70) {
            for (var i = 0; i < irandom_range(4, 10); i++) {
                var xx = random_range(x - sprite_width / 2, x + sprite_width / 2);
                instance_create_depth(xx, y, depth - 1000, obj_vel);
            }
        }
    }

    if (!chao && (parede_dir || parede_esq || timer_parede)) {
        if (vveloc > 0) {
            vveloc = lerp(vveloc, desl, acel);
            if (random(100) > 85) {
                for (var i = 0; i < irandom_range(4, 10); i++) {
                    var onde = parede_dir - parede_esq;
                    var xx = x + onde * sprite_width / 2;
                    var yy = y + random_range(-sprite_height / 2, 0);
                    instance_create_depth(xx, yy, depth - 1000, obj_vel);
                }
            }
        } else {
            vveloc += gravidade;
        }

        if (!ultima_parede && pulo) {
            vveloc = -max_vveloc;
            hveloc = -max_hveloc;
            xscale = 0.5;
            yscale = 1.5;
        } else if (ultima_parede && pulo) {
            vveloc = -max_vveloc;
            hveloc = max_hveloc;
            xscale = 0.5;
            yscale = 1.5;
        }
    } else if (!chao) {
        vveloc += gravidade;
    }

    if (pulo && (chao || timer_pulo)) {
        vveloc = -max_vveloc;
        xscale = 0.5;
        yscale = 1.5;
        for (var i = 0; i < irandom_range(4, 10); i++) {
            var xx = random_range(x - sprite_width / 2, x + sprite_width / 2);
            instance_create_depth(xx, y, depth - 1000, obj_vel);
        }
    }

    if (pulo) timer_queda = limite_buffer;

    buffer_pulo = (timer_queda > 0);

    if (buffer_pulo) {
        if (chao || timer_pulo) {
            vveloc = -max_vveloc;
            xscale = 0.5;
            yscale = 1.5;
            timer_pulo = 0;
            timer_queda = 0;
        }
        timer_queda--;
    }

    if (pulo_s && vveloc < 0) vveloc *= 0.7;

    if (dash && carga > 0) {
        dir = point_direction(0, 0, (direita - esquerda), (down - up));
        estado = state.dash;
        carga -= 1;
        timer_recarga = 0;
    }

    vveloc = clamp(vveloc, -max_vveloc, max_vveloc);
break;

case state.dash:
    dura--;

    hveloc = lengthdir_x(len, dir);
    vveloc = lengthdir_y(len, dir);

    if (dir == 90 || dir == 270) {
        yscale = 1.5;
        xscale = 0.5;
    } else {
        yscale = 0.5;
        xscale = 1.5;
    }

    var rastro = instance_create_layer(x, y, layer, obj_player_rastro);
    rastro.xscale = xscale;
    rastro.yscale = yscale;

    if (dura <= 0) {
        estado = state.movendo;
        dura = room_speed / 4;
        hveloc = max_hveloc * sign(hveloc) * 0.5;
        vveloc = max_vveloc * sign(vveloc) * 0.5;
    }
break;
}

// === RECARGA DE DASH ===
if (carga < max_carga) {
    timer_recarga++;
    if (timer_recarga >= limite_recarga) {
        carga = min(carga + 1, max_carga);
        timer_recarga = 0;
    }
}

// === DEBUG E COR ===
show_debug_message(estado);

switch (carga) {
    case 0: set = lerp(set, 50, 0.05); break;
    case 1: set = lerp(set, 255, 0.05); break;
}

image_blend = make_color_hsv(50, set, 255);
xscale = lerp(xscale, 1, 0.15);
yscale = lerp(yscale, 1, 0.15);
