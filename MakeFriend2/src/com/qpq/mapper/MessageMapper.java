package com.qpq.mapper;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.qpq.pojo.Message;
import com.qpq.pojo.Message2;

@Repository
public interface MessageMapper {
	
	//根据用户id查询该用户的未读消息数
	int selectMessageCount (int id) throws SQLException;
	
	//根据用户id查询该用户的消息数
	int selectAllMessageCount (int id) throws SQLException;
	
	//根据用户id查询该用户的未读消息分页显示
	//List<Message2> selectURMessage (int id,int begin,int end) throws SQLException;
	List<Message2> selectURMessage (HashMap<String,Object> map) throws SQLException;
	
	//根据用户id查询该用户的所有消息分页显示
	//List<Message2> selectAllMessage (int id,int begin,int end) throws SQLException;
	List<Message2> selectAllMessage (HashMap<String,Object> map) throws SQLException;
	
	/** b> 修改留言，编号不能修改 */
	int  updateMessage(Message msg) throws Exception;
	
	//根据留言id，设置留言状态为已读
	void changeStatus(int id) throws SQLException;
	
	int insertMessage2(Message2 msg2) throws Exception;

	List<Message2> selectAllMessages() throws Exception;
}
