function scr_playerMovement(){
	

		// Player Movement

// Set speed to 0.
	// We increase it again below.
	hspeed = 0;
	vspeed = 0;

	// If the W key is down...
	if (keyboard_check(ord("W")))
	{
		// Add -2 to vertical speed.
		vspeed += -2 
	}

	// If the S key is down...
	if (keyboard_check(ord("S")))
	{
		// Add 2 to vertical speed.
		vspeed += 2
	}
	
	// If the A key is down...
	if (keyboard_check(ord("A")))
	{
		// Add -2 to horizontal speed.
		hspeed += -2
	}

	// If the D key is down...
	if (keyboard_check(ord("D")))
	{
		// Add 2 to horizontal speed.
		hspeed += 2
	}
			
	
	
	// Normalize hspeed and vspeed
	var _speed = sqrt(sqr(hspeed) + sqr(vspeed));
	if(_speed > 10)
	{
		hspeed *= 3 / _speed;
		vspeed *= 3 / _speed;
	}
}