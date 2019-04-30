package com.qpq.mapper;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.qpq.pojo.Dynamic;

@Repository
public interface DynamicMapper {

	public int selectAll() throws SQLException;
	//按页查找
	//public List<Dynamic> selectBypage(int begin, int size) throws SQLException;
	public List<Dynamic> selectBypage(HashMap<String,Object> map) throws SQLException;
	
	//发表动态
	//public int insertDynamic(int uid,String content)throws SQLException;
	public int insertDynamic(HashMap<String,Object> map)throws SQLException;
	
	//删除
	public int deleteDynamic(int did) throws SQLException;
	
	//查询个别动态
	public Dynamic selectByDid(int did)throws SQLException;
	
	//点赞
	public int updataLikenum(int did) throws SQLException;
	
}
