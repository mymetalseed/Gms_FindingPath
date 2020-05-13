//show_debug_message(can_building);
if(rebuilding_maze){
	#region 地图初始化
	//标记次数清零
	map_stamp_numbers = 0;
	var i,j;
	//显示地图初始化
	ds_grid_clear(map_show_id,1);
	for(j = 1;j<MAP_SHOW_HEIGHT;j+=1){
		for(i=1;i<MAP_SHOW_WIDTH;i+=1){
			if((i mod 2)&&(j mod 2)) map_show_id[# i,j]=0;
		}
	}
	#endregion
	
	#region 出口入口
	var _inx,_iny,_outx,_outy;
	//随机入口,1为左右,0为上下
	if(irandom(1)){
		//入口只允许奇数位,prim构图法
		_inx = irandom(MAP_STAMP_WIDTH-1)*2+1;
		//有时你想随机选择数值之外的内容.
		//或是想从给定范围中选择一个数字。
		//这种情况下应该使用 choose()来产生随机的结果。
		//会随机选取一个给定的值返回
		_iny = choose(0,MAP_SHOW_HEIGHT-1);
	}else{
		_inx = choose(0,MAP_SHOW_WIDTH-1);
		_iny = irandom(MAP_STAMP_HEIGHT-1)*2+1;
	}
	//随机出口
	do{
		if(irandom(1)){
			_outx = irandom(MAP_STAMP_WIDTH-1)*2+1;
			_outy = choose(0,MAP_SHOW_HEIGHT-1);
		}else{
			_outx = choose(0,MAP_SHOW_WIDTH-1);
			_outy = irandom(MAP_STAMP_HEIGHT-1)*2+1;
		}
	}until(_inx!=_outx && _iny!=_outy)
	map_show_id[# _inx,_iny] = 0;
	map_show_id[# _outx,_outy] = 0;
	_sx=_inx;
	_sy=_iny;
	_ex=_outx;
	_ey=_outy;
	#endregion
	
	#region 地图计算
	//计算
	random_set_seed(current_time);
	randomize();
	ds_grid_clear(map_stamp_id,0);
	//生成迷宫
	do{
		var _i,_j,_end;
		_end=0;
		//寻找构建地图的起始点(dfs每次会生成一条路,路径上的点会被标记)
		//但是其余的点没有被标记,在那些点中寻找一个起始点
		for(_j=0;_j<MAP_STAMP_HEIGHT;_j++){
			for(_i=0;_i<MAP_STAMP_WIDTH;_i++){
				if(!map_stamp_id[# _i,_j]){
					_end=1;
					break;
				}
			}
			if(_end) break;
		}
		scr_create_maze(_i,_j);
	}until((_i+1)*(_j+1)>=MAP_STAMP_WIDTH*MAP_STAMP_HEIGHT);
	#endregion
	
	#region 地图绘制
	//清除地图块
	with(obj_wall)instance_destroy();
	instance_destroy(obj_floor);
	//建立图块
	for(j=0;j<MAP_SHOW_HEIGHT;j+=1){
		for(i=0;i<MAP_SHOW_WIDTH;i+=1){
			if(map_show_id[# i,j])instance_create_depth(i*16+8,j*16+8,0,obj_wall);
			else instance_create_depth(i*16+8,j*16+8,0,obj_floor);
		}
	}

	#endregion
	rebuilding_maze=0;
	building_type=-1;
}

if(can_building){

	#region 路径生成
	if(building_type==0)
		dfs_pre();
	else if(building_type==1){
		bfs_pre();
	}else if(building_type==2){
		A_star_pre();
	}else if(building_type==3){
		dj_pre();
	}
	#endregion
	can_building=0;
}
