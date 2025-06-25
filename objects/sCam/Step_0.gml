var _room = instance_position(global.cam_alvo.x, global.cam_alvo.y,oRoom)
global.cam_x = global.cam_alvo.x - global.cam_w/2
global.cam_y = global.cam_alvo.y - global.cam_h/2


if (_room){
	
	global.cam_x_min = _room.x
	global.cam_x_max = _room.x + (global.cam_w*_room.image_xscale) - global.cam_w
	global.cam_y_min = _room.y
	global.cam_y_max = _room.y + (global.cam_h*_room.image_yscale) - global.cam_h
	
	
	
}else{
	
	
}



global.cam_x = clamp(global.cam_x, global.cam_x_min, global.cam_x_max)
global.cam_y = clamp(global.cam_y, global.cam_y_min, global.cam_y_max)


camera_set_view_pos(view_camera[0], global.cam_w, global.cam_y)

