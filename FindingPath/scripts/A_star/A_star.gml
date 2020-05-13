//dfs寻路
//A*算法
var _x=argument0;
var _y=argument1;

//标记_x,_y已访问,且加入访问列表[x,y当前节点 ,当前节点下标cid, 前驱节点下标pid]
ds_list_add(aStar_list_id,[_x,_y,0,-1]);
tag_id[# _x,_y]=1;
//aStar优先队列,[x,y当前节点 ,当前节点在list中下标cid,从起点沿路径到这里的G值]
//优先级设置为从前一个节点到当前节点的距离G和到终点的H和F
//F=G+H   第一个节点优先级直接为0
ds_priority_add(aStar_priority_queue_id,[_x,_y,0,0],0);
var _i;
var _break=0;
while(!ds_priority_empty(aStar_priority_queue_id) && !_break){
	var ar = ds_priority_find_min(aStar_priority_queue_id);
	ds_priority_delete_min(aStar_priority_queue_id);
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
			var cid = ds_list_size(aStar_list_id);
			ds_list_add(aStar_list_id,[_nx,_ny,cid,lid]);
			tag_id[# _nx,_ny]=1;
			if(_nx==_ex && _ny==_ey){
				aStar_ed_index=cid;
				_break=1;
				break;
			}
			//用F=G+H做为优先级
			//g为沿当前路径过来时的花费,每走一步花费为10
			//h为估算到终点的值,该值为哈密顿距离
			var g=ar[3]+10;
			var h=(abs(_ex-_nx)+abs(_ey-_ny))*10;
			var f=g+h;
			ds_priority_add(aStar_priority_queue_id,[_nx,_ny,cid,g],f);
		}
	}
}