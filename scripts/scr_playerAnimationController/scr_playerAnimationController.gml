function scr_playerAnimationController(){
// If sprite is not the hit sprite,
	// meaning the hero isn't currently being hit...
	if (sprite_index != sPlayerSheet){
		// If speed is over 0...
		if (hspeed > 0)
		{
			// Set sprite to the running sprite.
			sprite_index = sPlayerRightWalk;
		}
		
		if (hspeed < 0)
		{
			// Set sprite to the running sprite.
			sprite_index = sPlayerLeftWalk;
		}
		
		if (vspeed < 0)
		{
			// Set sprite to the running sprite.
			sprite_index = sPlayerUpWalk;
		}
		
		if (vspeed > 0)
		{
			// Set sprite to the running sprite.
			sprite_index = sPlayerDownWalk;
		}
	
		if speed == 0{
			if direction == 0{
				sprite_index = sPlayerRightIdle
			}
			
			if direction == 90{
				sprite_index = sPlayerUpIdle
			}
			
			if direction == 180{
				sprite_index = sPlayerLeftIdle
			}
			
			if direction == 270{
				sprite_index = sPlayerDownIdle
			}
			
			if direction > 90 &&  direction < 180{
				sprite_index = sPlayerLeftUpIdle
			}
			
			if direction > 180 &&  direction < 270{
				sprite_index = sPlayerLeftDownIdle
			}
			
			if (direction > 270 &&  direction < 360){
				sprite_index = sPlayerRightDownIdle
			}
			
			if  direction > 0 &&  direction < 90{
				sprite_index = sPlayerRightUpIdle
			}
		}
	}
}