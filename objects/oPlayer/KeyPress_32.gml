flashlightOn = !flashlightOn

if flashlightOn == true{
	instance_create_layer(x, y, "Instances", oFlashlight)
}

if flashlightOn == false{
	global.lastPlayerx = x
	global.lastPlayery = y
	instance_destroy(oFlashlight)
}