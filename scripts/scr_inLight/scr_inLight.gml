function scr_inLight(){
	alarm[0] = 1
	lightDirection = point_direction(oPlayer.x, oPlayer.y, mouse_x, mouse_y)
	diff = angle_difference(oMonter.monterDirection, lightDirection)
	if abs(diff) <= 35{
		speed = 0
		return true
	}
	return false
}