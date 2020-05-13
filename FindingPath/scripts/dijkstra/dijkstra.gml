//dfs寻路
//A*算法
var _x=argument0;
var _y=argument1;


var _next;
if(reverse) _next=-1;
else _next=1;

//标记_x,_y已访问,且加入访问列表[x,y当前节点 ,当前节点下标cid, 前驱节点下标pid]
ds_list_add(dj_list_id,[_x,_y,0,-1]);
tag_id[# _x,_y]=1;
//dijkstra优先队列,_x,y为当前点的下标,第三个参数为当前点在list中的下标
//第四个值为暂定路径长度, 其中优先级为长度
ds_priority_add(dj_priority_queue_id,[_x,_y,0,0],0);
var _i;
var _break=0;
while(!ds_priority_empty(dj_priority_queue_id) && !_break){
	var ar = ds_priority_find_min(dj_priority_queue_id);
	ds_priority_delete_min(dj_priority_queue_id);
	//lid为当前坐标在list中的下标
	var lid = ar[2];
	//四方向check
	for(_i=0;_i<4;_i++){
		var arr=array_get(_dir,_i);
		var _nx= ar[0]+arr[0];
		var _ny = ar[1]+arr[1];
		if(scr_can_go(_nx,_ny)){
			//入队列同时记录下当前节点下标与前驱节点下标
			//方便寻路
			var cid = ds_list_size(dj_list_id);
			ds_list_add(dj_list_id,[_nx,_ny,cid,lid]);
			tag_id[# _nx,_ny]=1;
			if(_nx==_ex && _ny==_ey){
				_break=1;
				break;
			}
			ds_priority_add(dj_priority_queue_id,[_nx,_ny,cid,ar[3]+_next],ar[3]+_next);
		}
	}
}