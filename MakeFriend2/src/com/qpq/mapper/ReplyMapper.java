package com.qpq.mapper;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.qpq.pojo.Dynamic;
import com.qpq.pojo.Reply;
import com.qpq.pojo.User;

@Repository
public interface ReplyMapper {
	
	//查询回复
	List<Reply> selectReply(int did) throws SQLException;
	User findUser(int id) throws SQLException;
	
	Dynamic findDynamic(int id) throws SQLException;
	
	//回复动态
	int insertReply(HashMap<String,Object> map) throws SQLException;
}
