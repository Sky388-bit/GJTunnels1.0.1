function scr_huntPlayer(){
	alarm[0] = 1
	randomise()
	choice = irandom_range(0, 2)
	if scr_inLight() == false and oPlayer.flashlightOn == true{
		if point_distance(x, y, oPlayer.x, oPlayer.y) < 200{ 
			direction = point_direction(x, y, oPlayer.x, oPlayer.y)
			speed = 1
		}
	}
	
	else if oPlayer.flashlightOn == false{
		direction = point_direction(x, y, global.lastPlayerx, global.lastPlayery)
		speed = 1
	}
	/*
	//in range kill player
	if point_distance(x, y, oPlayer.x, oPlayer.y) < 200{ 
		direction = point_direction(x, y, oPlayer.x, oPlayer.y)
		speed = 1
	}
	*/
	
}