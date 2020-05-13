//迷宫计算(一次)
var _x = argument0;
var _y = argument1;

//随机选择方向(即该次遍历方向)
repeat(4){
	//由角度计算下一个坐标,只有四个方向
	var _dir=choose(0,90,180,270);
	var _dx=lengthdir_x(1,_dir);//走一步,方向是dir
	var _dy=lengthdir_y(1,_dir);
}
//如果下一个节点不能通过,结束递归
if(!scr_can_throw(_x+_dx,_y+_dy)) exit;

//can throw
{
	//sign in map which can throw
	map_show_id[# _x*2+_dx+1,_y*2+_dy+1] = 0;
	_x+=_dx;
	_y+=_dy;
	//sign in stamp
	map_stamp_id[# _x,_y]=1;
	map_stamp_numbers ++;
}
//因为gml没有严格意义上的函数
//递归寻找下一个可以通过的位置,这个是用来模拟dfs,即返回到本函数后四方向check
while(map_stamp_numbers<MAP_STAMP_WIDTH*MAP_STAMP_HEIGHT){
	if(scr_can_choose(_x,_y)){
		scr_create_maze(_x,_y);
	}else{
		break;
	}
}