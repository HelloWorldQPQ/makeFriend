package com.qpq.service;

import java.util.HashMap;
import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qpq.mapper.SuccessMapper;
import com.qpq.pojo.Paging;
import com.qpq.pojo.Success;
import com.qpq.pojo.User;

@Service
public class SuccessServiceImpl{
	
	@Autowired
	private SuccessMapper sd;
	

//根据id查案例
	public Success searchSuccessById(int sid) {
		
		try {
			
			Success s1 = sd.selectById(sid);
			int authorid = s1.getUid();
			//根据id找到作者
			User u1 = sd.selectByIdU(authorid);
			s1.setUser(u1);
			return s1;
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return null;
	}

//上传案例
	public boolean publishSuccess(Success suc) {
		try {
			return sd.insertSuccess(suc)>0;
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return false;
		
	}

//删除
	public boolean deleteSuccessById(int id) {
		
		try {
			return sd.deleteSuccess(id)>0;
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return false;
	}

//分页查询
	public Paging<Success> search(int pageSize, int currPage) {
		Paging<Success>paging=new Paging<>(pageSize,currPage);
		HashMap<String,Object> map = new HashMap<>();
		//1、取得数据总记录数
		int rowsCount;
		try {
			rowsCount = sd.selectCount();//数据总条数
			int pageCount=(int)Math.ceil(rowsCount/(double)pageSize);//总页数（向上取整）
			int begin=(currPage-1)*pageSize;//起始位置=（当前页-1）*每页的个数
			map.put("begin", begin);
			map.put("end", pageSize);
			System.out.println("jieshou++++++++");
			List<Success> list=sd.selectAllSuccess(map);
			System.out.println("jieshou"+list.toString());
			for (Success mes : list) {
				int authorid=mes.getUid();
				//通过id找作者
				User author = sd.selectByIdU(authorid);
				mes.setUser(author);
			}
			
			
			//2、封装
			paging.setRowsCount(rowsCount);
			paging.setPageCount(pageCount);
			paging.setData(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return paging;
	}
	
}
