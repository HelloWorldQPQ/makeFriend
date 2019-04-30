package com.qpq.mapper;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.qpq.pojo.Paging;
import com.qpq.pojo.User;

/**
 * 用户的数据访问接口 
 */
@Repository
public interface UserMapper {
	int  insert(User user) throws Exception;
	int  update(User user) throws Exception;
	int  delete(int id) throws Exception;
	User  selectById(int id)   throws Exception;
	//List<User>  selectByName(String name)  throws Exception;
	List<User>  selectByName(HashMap<String,Object> map)  throws Exception;
	/** 按照名称分页查询数据 */
    //List<User>  selectByName(String name,int begin,int size) throws Exception;
    List<User>  selectByName1(HashMap<String,Object> map)  throws Exception;
	//User login(String loginName,String password) throws Exception;
	User login(HashMap<String,Object> map) throws Exception;
	
	/** 按照名称查询数据数量 */
    //int  selectByNameCount(String name) throws Exception;
	int  selectByNameCount(HashMap<String,Object> map) throws Exception;
   
	//List<User> searchAll(int begin,int pageSize) throws Exception;
	List<User> searchAll(HashMap<String,Object> map) throws Exception;

	int selectCount() throws Exception;
	
	//List<User> selectSearch(String sex, int age1, int age2, double high1, double high2, int weight1, int weight2,
			//String education, String marry,int begin,int pageSize) throws Exception;
	List<User> selectSearch(HashMap<String,Object> map) throws Exception;
	
	//int selectSearchCount(String sex, int age1, int age2, double high1, double high2, int weight1, int weight2,
		//	String education, String marry) throws Exception;
	int selectSearchCount(HashMap<String,Object> map) throws Exception;
	
	//按性别推荐
	//List<User> searchBySex(String sex,int pageSize,int currPage) throws Exception;
	List<User> searchBySex(HashMap<String,Object> map) throws Exception;
	
	int  updateById(User user) throws Exception;
	List<User> selectAllUser() throws Exception;
	
	
	
	
	
}
