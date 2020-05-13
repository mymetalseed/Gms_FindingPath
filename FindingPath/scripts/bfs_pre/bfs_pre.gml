//dfs寻路,前置脚本
//需要参数: map,起点坐标_sx,_sy,终点坐标_ex,_ey
//map_show_id数组中1为墙,0为通路
//初始化
ds_grid_clear(tag_id,0);
ds_list_clear(bfs_list_id);
ds_queue_clear(bfs_queue_id);
_done=0;

bfs(_sx,_sy);