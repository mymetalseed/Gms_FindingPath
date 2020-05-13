//地图大小
#macro MAP_STAMP_WIDTH 31
#macro MAP_STAMP_HEIGHT 23
//显示地图的宽高(使用prim随机生成法)
#macro MAP_SHOW_WIDTH MAP_STAMP_WIDTH*2+1
#macro MAP_SHOW_HEIGHT MAP_STAMP_HEIGHT*2+1

//创建地图栅格(数组,用于计算迷宫)
map_stamp_id = ds_grid_create(MAP_STAMP_WIDTH,MAP_SHOW_HEIGHT);
map_stamp_numbers = 0;//总共标记了多少次
//显示地图栅格创建(用于显示)
map_show_id = ds_grid_create(MAP_SHOW_WIDTH,MAP_SHOW_HEIGHT);


//寻路路径
map_path_id = path_add();
map_path_mp_id = mp_grid_create(8,8,MAP_SHOW_WIDTH,MAP_SHOW_HEIGHT,16,16);
//(8,8)起始点(16,16)格子最小单位宽高

//寻路算法所需
tag_id = ds_grid_create(MAP_SHOW_WIDTH,MAP_SHOW_HEIGHT);
//起始点,结束点
_sx=0
_sy=0
_ex=0
_ey=0;
//全部经过的路径记录
dist_list_id = ds_list_create();
//从起点直到终点路程的记录
dist_stack_id = ds_stack_create();
dist_s_to_e_id = ds_list_create();
//单次寻路是否已结束
_done=0;
//四向列表
_dir=[[1,0],[-1,0],[0,1],[0,-1]];

//bfs控制路径记录方法
//在路径列表记录[nx,ny,cid,pid]
//pid是前直节点在list的下标
bfs_queue_id = ds_queue_create();
bfs_list_id = ds_list_create();
bfs_ed_index=0;

//A*控制路径记录方法
//只比bfs多了一个权值
aStar_priority_queue_id = ds_priority_create();
aStar_list_id = ds_list_create();
aStar_ed_index=0;

//Dijkstra
dj_priority_queue_id = ds_priority_create();
dj_list_id = ds_list_create();
//如果reverse为true,则求最远距离
reverse=0;


//控制渲染变量
can_building=0;
//0代表dfs,1代表bfs,2代表A*,3代表Dijkstra
building_type=0;
//是否重新生成迷宫
rebuilding_maze=0;


