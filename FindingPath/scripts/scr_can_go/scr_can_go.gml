var _x,_y;
_x=argument0;
_y=argument1;

if(_x<0 || _y<0 || _x>=MAP_SHOW_WIDTH 
	|| _y>=MAP_SHOW_HEIGHT 
	|| map_show_id[# _x,_y] 
	|| tag_id[# _x,_y]){
	return 0;
}

return 1;