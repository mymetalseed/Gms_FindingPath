//dfs寻路

var _x=argument0;
var _y=argument1;

if(_done) return;
//标记_x,_y已访问,且加入访问列表
ds_list_add(dist_list_id,[_x,_y]);
tag_id[# _x,_y]=1;
//真路径栈,每次遍历到,先入栈
ds_stack_push(dist_stack_id,[_x,_y]);
if(_x==_ex && _y==_ey){
	//找到了
	_done=1;
	return;
}
//从x,y开始遍历,第一次是起始点,直到_ex和_ey为止
var _i;

for(_i=0;_i<4;_i++){
	var ar=array_get(_dir,_i);
	var _nx=_x+ar[0];
	var _ny = _y+ar[1];
	if(scr_can_go(_nx,_ny)){
		dfs(_nx,_ny);
		if(!_done)
			ds_stack_pop(dist_stack_id);
	}
}


