package com.qpq.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qpq.mapper.MyDynamicMapper;
import com.qpq.pojo.Dynamic;
import com.qpq.pojo.Paging;

@Service
public class MyDynamicServiceImpl{

	@Autowired
	private MyDynamicMapper dao;

	public Paging<Dynamic> searchMyDynamic(int id, int PageSize, int currPage) {
		Paging<Dynamic> paging = new Paging<Dynamic>(PageSize,currPage);
		HashMap<String,Object> map = new HashMap<>();
		
		try {
			
			int rowsCount = dao.selectDynamicCount(id);
			
			//多少页
			int pageCount = (int)Math.ceil(rowsCount/(double)PageSize);
			int begin = (currPage-1)*PageSize;
			
			map.put("uid", id);
			map.put("begin", begin);
			map.put("end", PageSize);
			List<Dynamic> list = dao.selectMyDy(map);
			
			//封装
			paging.setData(list);
			paging.setPageCount(pageCount);
			paging.setRowsCount(rowsCount);
			
			return paging;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

	public void addLikeNum(int did) {
		try {
			dao.addLike(did);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public int getLikeNum(int id) {
		try {
			return dao.searchLikeNum(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}



}
