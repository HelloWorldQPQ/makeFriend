package com.qpq.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qpq.mapper.UserMapper;
import com.qpq.pojo.Paging;
import com.qpq.pojo.User;


/**
 * 业务接口实现类
 */
@Service
public class UserServiceImpl{

	@Autowired
	private UserMapper  userDao;
	

	
	
	

	public User findById(int id) {
		try {
			return userDao.selectById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 按照名称查询
	 */

	public List<User> findByName(String name) {
		HashMap<String,Object> map =new HashMap<>();
		try {
			map.put("name", name);
			return userDao.selectByName(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}


	public boolean edit(User user) {
		
		try {
			return userDao.update(user)>0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}


	public boolean removeById(int id) {
		try {
			return userDao.delete(id)>0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}




	public boolean insert(User user) {
		try {
			return userDao.insert(user)>0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}




	public User login(String loginName, String password) {
		HashMap<String,Object> map =new HashMap<>();
		try {
			map.put("loginname", loginName);
			map.put("password", password);
			return userDao.login(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	

	public Paging<User> search(String name, int pageSize, int currPage) {
		HashMap<String,Object> map =new HashMap<>();
		HashMap<String,Object> map1 =new HashMap<>();
		//实例化分页对象
		 Paging<User>  paging = new Paging<>(pageSize,currPage);
		 
		 try {
			//查询出总记录数
			 map.put("name", name);
			 int rowsCount = userDao.selectByNameCount(map);
			 //计算出总页数
			 int pageCount = (int)Math.ceil(rowsCount/(double)pageSize);
			 
			 //计算出起始位置  起始位置 = （当前页-1）*每页显示多少条
			 int begin = (currPage-1)*pageSize;
			 map1.put("name", name);
			 map1.put("begin", begin);
			 map1.put("end", pageSize);
			 //查询出分页显示的数据
			 List<User> list = userDao.selectByName1(map1);
			 
			 //封装到分页对象
			 paging.setRowsCount(rowsCount);
			 paging.setPageCount(pageCount);
			 paging.setData(list);
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
		return paging;
	}




	public Paging<User> searchAll(int pageSize, int currPage) {
		HashMap<String,Object> map1 =new HashMap<>();
		//实例化分页对象
		 Paging<User>  paging = new Paging<>(pageSize,currPage);
		 
		 try {
			//查询出总记录数
			 int rowsCount = userDao.selectCount();
			 //计算出总页数
			 int pageCount = (int)Math.ceil(rowsCount/(double)pageSize);
			 
			 //计算出起始位置  起始位置 = （当前页-1）*每页显示多少条
			 int begin = (currPage-1)*pageSize;
			 map1.put("begin", begin);
			 map1.put("end", pageSize);
			 //查询出分页显示的数据
			 List<User> list = userDao.searchAll(map1);
			 
			 //封装到分页对象
			 paging.setRowsCount(rowsCount);
			 paging.setPageCount(pageCount);
			 paging.setData(list);
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
		return paging;
	}



	public Paging<User> searchTiaoJian(String sex, int age1, int age2, double high1, double high2, int weight1, int weight2,
			String education, String marry,int pageSize,int currPage) {
		 Paging<User>  paging = new Paging<>(pageSize,currPage);
		 HashMap<String,Object> map =new HashMap<>();
		 HashMap<String,Object> map1 =new HashMap<>();
		 try {
			 map.put("sex", sex);
			 map.put("age1", age1);
			 map.put("age2", age2);
			 map.put("high1", high1);
			 map.put("high2", high2);
			 map.put("weight1", weight1);
			 map.put("weight2", weight2);
			 map.put("education", education);
			 map.put("marry", marry);
			 
			//取得总记录数
			int rowsCount = userDao.selectSearchCount(map);
			//向上取整 总记录数/总页数得到 页数
			int pageCount = (int)Math.ceil(rowsCount/(double)pageSize);
			//每页从第几个开始
			int begin = (currPage-1)*pageSize;
			 map1.put("sex", sex);
			 map1.put("age1", age1);
			 map1.put("age2", age2);
			 map1.put("high1", high1);
			 map1.put("high2", high2);
			 map1.put("weight1", weight1);
			 map1.put("weight2", weight2);
			 map1.put("education", education);
			 map1.put("marry", marry);
			 map1.put("begin", begin);
			 map1.put("end", pageSize);
			List<User> list = userDao.selectSearch(map1);
			paging.setRowsCount(rowsCount);
			paging.setPageCount(pageCount);
			paging.setData(list);

			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return paging;
	}




	public Paging<User> searchBySex(String sex, int pageSize, int currPage) {
		Paging<User>  paging = new Paging<>(pageSize,currPage);
		HashMap<String,Object> map =new HashMap<>();
		 try {
			//查询出总记录数
			 int rowsCount = userDao.selectCount();
			 //计算出总页数
			 int pageCount = (int)Math.ceil(rowsCount/(double)pageSize);
			 
			 //计算出起始位置  起始位置 = （当前页-1）*每页显示多少条
			 int begin = (currPage-1)*pageSize;
			 map.put("sex", sex);
			 map.put("begin", begin);
			 map.put("end", pageSize);
			 //查询出分页显示的数据
			 List<User> list = userDao.searchBySex(map);
			 
			 //封装到分页对象
			 paging.setRowsCount(rowsCount);
			 paging.setPageCount(pageCount);
			 paging.setData(list);
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
		return paging;
	}




	public boolean updateUser(User user) {
		try {
			return userDao.updateById(user)>0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	
}
