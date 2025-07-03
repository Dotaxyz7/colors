
texto = "Há muito tempo atrás, um mau tomou conta do mundo. O mundo ficou mais cinza, sem vida, sem propósito, sem razão para viver. Os Deuses antigos enviaram o único elemento capaz de salvar esse mundo... Alexander.";
velocidade = 1.6; // frames por letra
contador = 0;
letras_mostradas = 0;

max_largura = 500; // largura máxima do texto em pixels
linha_altura = 20; // altura da linha em pixels
x_texto = 50; // posição x para desenhar o texto
y_texto = 50; // posição y inicial para desenhar


som_cooldown = 0;  // contador para esperar antes de tocar outro som
intervalo_som = 8;  // quantidade de frames para esperar entre os sons
