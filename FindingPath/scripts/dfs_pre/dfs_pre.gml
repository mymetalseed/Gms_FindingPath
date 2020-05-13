//dfs寻路,前置脚本
//需要参数: map,起点坐标_sx,_sy,终点坐标_ex,_ey
//map_show_id数组中1为墙,0为通路
//初始化
ds_grid_clear(tag_id,0);
ds_list_clear(dist_list_id);
ds_list_clear(dist_s_to_e_id);
ds_stack_clear(dist_stack_id);
_done=0;
dfs(_sx,_sy);
//将直达路径用列表记录
while(!ds_stack_empty(dist_stack_id)){
	ar = ds_stack_top(dist_stack_id);ds_stack_pop(dist_stack_id);
	ds_list_add(dist_s_to_e_id,ar);
}