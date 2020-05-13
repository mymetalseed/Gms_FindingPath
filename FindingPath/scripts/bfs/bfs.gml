//dfs寻路

var _x=argument0;
var _y=argument1;

//标记_x,_y已访问,且加入访问列表[x,y当前节点 
//,当前节点下标cid, 前驱节点下标pid]
ds_list_add(bfs_list_id,[_x,_y,0,-1]);
tag_id[# _x,_y]=1;
//bfs栈,[x,y当前节点 ,当前节点在list中下标cid]
ds_queue_enqueue(bfs_queue_id,[_x,_y,0]);
var _i;
var _break=0;
while(!ds_queue_empty(bfs_queue_id) && !_break){
	var ar = ds_queue_head(bfs_queue_id);
	 ds_queue_dequeue(bfs_queue_id);
	var lid = ar[2];
	//show_debug_message(_cnt++);
	//四方向check
	for(_i=0;_i<4;_i++){
		var arr=array_get(_dir,_i);
		var _nx=ar[0]+arr[0];
		var _ny = ar[1]+arr[1];
		if(scr_can_go(_nx,_ny)){
			//入栈同时记录下当前节点下标与前驱节点下标
			//方便寻路
			var cid = ds_list_size(bfs_list_id);
			ds_list_add(bfs_list_id,[_nx,_ny,cid,lid]);
			tag_id[# _nx,_ny]=1;
			if(_nx==_ex && _ny==_ey){
				bfs_ed_index=cid;
				_break=1;
				break;
			}
			ds_queue_enqueue(bfs_queue_id,[_nx,_ny,cid]);
		}
	}
}