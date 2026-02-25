randomize()
_dir = irandom(3)
width = sprite_get_width(sTest)
max_tile_count = irandom_range(63, 107)
tile_count = 0



while tile_count <= max_tile_count{
	
	//move and  make tiles
	if _dir = 0{
		x += width
	}

	if _dir = 1{
		y -= width
	}

	if _dir = 2{
		x -= width
	}

	if _dir = 3{
		y += width
	}
	
	//if there is not a tile, place one and increase tile count
	if !place_meeting(x,y,oTile){
		instance_create_depth(x, y, 0, oTile)
		tile_count++
	}
	
	_dir = irandom(3)
	
	if tile_count == max_tile_count{
		with oTile{
			if place_free(x, y+oBuilder.width){
				instance_create_depth(x, y+oBuilder.width, 0, oWall)
			}
		}
	
		with oTile{
			if place_free(x, y-oBuilder.width){
				instance_create_depth(x, y-oBuilder.width, 0, oWall)
			}
		}
	
		with oTile{
			if place_free(x-oBuilder.width, y){
				instance_create_depth(x-oBuilder.width, y, 0, oWall)
			}
		}
	
		with oTile{
			if place_free(x+oBuilder.width, y){
				instance_create_depth(x+oBuilder.width, y, 0, oWall)
			}
		}
		
		
		instance_destroy()
		
	}
}