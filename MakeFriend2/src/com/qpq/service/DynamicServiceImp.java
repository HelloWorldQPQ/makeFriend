package com.qpq.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qpq.mapper.DynamicMapper;
import com.qpq.mapper.SuccessMapper;
import com.qpq.mapper.UserMapper;
import com.qpq.pojo.Dynamic;
import com.qpq.pojo.Page;
import com.qpq.pojo.Success;
import com.qpq.pojo.User;



@Service
public class DynamicServiceImp{
	
	
	@Autowired
	private DynamicMapper dao;
	private SuccessMapper s1;
	
	
	//按页查询业务
	
	public Page<Dynamic> selectDynamicService(int currpage, int size) throws Exception {
		
		try {
			//获取到page属性
			int rowcount=dao.selectAll();
			int pagecount=(int)Math.ceil((double)rowcount/size);
			int begin=(currpage-1)*size;
			
			HashMap<String,Object> map = new HashMap<>();
			map.put("begin", size);
			map.put("size", size);
			
			
			List<Dynamic> list=dao.selectBypage(map);
			
			for (Dynamic dynamic : list) {
				int uid=dynamic.getUid();
				User user= s1.selectByIdU(uid);	
				dynamic.setUser(user);
				
			}
			
			//封装
			Page<Dynamic> page=new Page<>(size,currpage);
			page.setRowcount(rowcount);
			page.setPagecount(pagecount);
			page.setData(list);
			
			
			return page;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}


	//发表
	
	public int publich(int uid, String content) {
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("uid", uid);
		map.put("content", content);
		
		try {
			return dao.insertDynamic(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}



	public int deleteDy(int did) {
		try {
			return dao.deleteDynamic(did);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	//点赞

	public int updataLikenumService(int did) {
		try {
			return dao.updataLikenum(did);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

}
