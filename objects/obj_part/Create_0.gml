image_angle = random(360)
direction = random(360)

speed = random_range(1,5)

image_xscale = random_range(.2,1)

image_yscale = image_xscale

image_speed = 0

image_index = irandom(image_number - 1)
image_blend = make_color_rgb(irandom(255), irandom(255), irandom(255)) 



if (image_xscale >= .6) inc = -.05
else inc = .01