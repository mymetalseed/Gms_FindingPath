draw_circle_color((_sx+1)*16,_sy*16+16,8,c_white,c_blue,0);
//路径终点
draw_circle_color(_ex*16+16,_ey*16+16,8,c_white,c_red,0);
if(building_type==0){
	//dfs绘制
	//绘制全路径
	for(var _i=0;_i<ds_list_size(dist_list_id)-1;_i++){
		var arr=ds_list_find_value(dist_list_id,_i);
		var arr2=ds_list_find_value(dist_list_id,_i+1);
		//向前判断后画边
		if(abs(arr[0]-arr2[0])+abs(arr[1]-arr2[1])==1){
			draw_line_width_colour(arr[0]*16+16, arr[1]*16+16, arr2[0]*16+16, arr2[1]*16+16, 3, c_red, c_red);
		}
	}
	//绘制直达路径
	for(var _i=0;_i<ds_list_size(dist_s_to_e_id)-1;_i++){
		var arr=ds_list_find_value(dist_s_to_e_id,_i);
		var arr2=ds_list_find_value(dist_s_to_e_id,_i+1);
		//向前判断后画边
		if(abs(arr[0]-arr2[0])+abs(arr[1]-arr2[1])==1){
			draw_line_width_colour(arr[0]*16+16, arr[1]*16+16, arr2[0]*16+16, arr2[1]*16+16, 5, c_white, c_maroon);
		}
	}
}else if(building_type==1){
	//bfs绘制
	//全路径绘制思路,从bfs列表中遍历出每一条边,绘制出来
	for(var _i=1;_i<ds_list_size(bfs_list_id);_i++){
		var arr=ds_list_find_value(bfs_list_id,_i);
		var arr2=ds_list_find_value(bfs_list_id,arr[3]);
		draw_line_width_colour(arr[0]*16+16, arr[1]*16+16, arr2[0]*16+16, arr2[1]*16+16, 3, c_red, c_red);
	}
	//直达路径绘制,从终点出发,向前绘制
	var arr = ds_list_find_value(bfs_list_id,bfs_ed_index);
	while(true){
		var arr2 = ds_list_find_value(bfs_list_id,arr[3]);
		draw_line_width_colour(arr[0]*16+16, arr[1]*16+16, arr2[0]*16+16, arr2[1]*16+16, 5, c_white,c_purple);
		arr=arr2;
		if(arr2[0]==_sx && arr2[1]==_sy) break;
	}
}else if(building_type==2){
	//A*绘制
	//全路径绘制思路,从astar列表中遍历出每一条边,绘制出来
	for(var _i=1;_i<ds_list_size(aStar_list_id);_i++){
		var arr=ds_list_find_value(aStar_list_id,_i);
		var arr2=ds_list_find_value(aStar_list_id ,arr[3]);
		draw_line_width_colour(arr[0]*16+16, arr[1]*16+16, arr2[0]*16+16, arr2[1]*16+16, 3, c_red, c_red);
	}
	//直达路径绘制,从终点出发,向前绘制
	var arr = ds_list_find_value(aStar_list_id ,aStar_ed_index);
	while(true){
		var arr2 = ds_list_find_value(aStar_list_id,arr[3]);
		draw_line_width_colour(arr[0]*16+16, arr[1]*16+16, arr2[0]*16+16, arr2[1]*16+16, 5, c_white,c_purple);
		arr=arr2;
		if(arr2[0]==_sx && arr2[1]==_sy) break;
	}
}else if(building_type==3){
	//dijkstra绘制
	//全路径绘制思路,从dj列表中遍历出每一条边,绘制出来
	for(var _i=1;_i<ds_list_size(dj_list_id);_i++){
		var arr=ds_list_find_value(dj_list_id,_i);
		var arr2=ds_list_find_value(dj_list_id ,arr[3]);
		draw_line_width_colour(arr[0]*16+16, arr[1]*16+16, arr2[0]*16+16, arr2[1]*16+16, 3, c_red, c_red);
	}
	//直达路径绘制,从终点出发,向前绘制
	var arr = ds_list_find_value(dj_list_id ,ds_list_size(dj_list_id)-1);
	while(true){
		var arr2 = ds_list_find_value(dj_list_id,arr[3]);
		draw_line_width_colour(arr[0]*16+16, arr[1]*16+16, arr2[0]*16+16, arr2[1]*16+16, 5, c_white,c_purple);
		arr=arr2;
		if(arr2[0]==_sx && arr2[1]==_sy) break;
	}
}