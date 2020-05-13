var _x,_y;
_x=argument0;
_y=argument1;

if(_x<0 || _y<0 || _x>=MAP_STAMP_WIDTH || _y>=MAP_STAMP_HEIGHT || map_stamp_id[# _x,_y]){
	return 0;
}

return 1;