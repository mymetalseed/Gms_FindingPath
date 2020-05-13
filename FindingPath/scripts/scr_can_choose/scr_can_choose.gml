//是否是死路
//四联通

var _x= argument0;
var _y=argument1;
if(scr_can_throw(_x+1,_y) ||scr_can_throw(_x,_y+1) ||scr_can_throw(_x-1,_y) ||scr_can_throw(_x,_y-1) ){
	return 1;
}

return 0;