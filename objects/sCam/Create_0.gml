global.cam_alvo = obj_player

global.cam_w = camera_get_view_width(view_camera[1])
global.cam_h = camera_get_view_height(view_camera[1])

global.cam_x = global.cam_alvo.x
global.cam_y = global.cam_alvo.y

global.cam_x_min = 0
global.cam_x_max = room_width - global.cam_w

global.cam_y_min = 0
global.cam_y_max = room_height - global.cam_h