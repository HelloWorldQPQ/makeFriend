package com.qpq.mapper;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.qpq.pojo.Dynamic;

@Repository
public interface MyDynamicMapper {
	
	//根据id查询用户自己的动态分页展示
	//List<Dynamic> selectMyDy(int id,int begin,int end) throws SQLException;
	List<Dynamic> selectMyDy(HashMap<String,Object> map) throws SQLException;
	
	//查询用户发的动态总条数
	int selectDynamicCount(int id)throws SQLException;
	
	//给动态的点赞数+1
	int addLike(int did) throws SQLException;
	
	//查询动态的点赞数
	int searchLikeNum(int id) throws SQLException;
	
	
}
