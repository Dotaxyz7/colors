if (timer > 0 )
	
	timer--;
else voltar = true

// Indo para o meu Destino

if (voltar && !voltei)
{
	
speed = 0

image_angle = point_direction(x,y,dest_x,dest_y)

x+=lengthdir_x(vel, image_angle)
y+=lengthdir_y(vel, image_angle)
	
	 if (abs (x-dest_x) < 5 && abs(y-dest_y) < 5){
		 
		voltei = true
	 }
}

if (criador && voltei) // Posso voltar ao ponto inicial
{
	

	if (instance_exists(obj_pedaco)){
		 
		 for (var i = 0; i < array_length_1d(lista) - 1; i++;)
		 {
			 
			if (lista[i].voltei == false)
			{
				
				destruir_tudo = false
				break; // Quebrando o código
				
			}else {
				
				
				destruir_tudo = true
				
				
			}
			 
		 }
		 
		 if (destruir_tudo) {
    var novo_player = instance_create_layer(dest_x, dest_y, layer, obj_player);
    global.cam_alvo = novo_player; // câmera volta a seguir o novo player
    instance_destroy(obj_pedaco);
}

		
	}
}
