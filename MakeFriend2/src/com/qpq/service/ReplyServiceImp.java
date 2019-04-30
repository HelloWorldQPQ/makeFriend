package com.qpq.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qpq.mapper.DynamicMapper;
import com.qpq.mapper.ReplyMapper;
import com.qpq.mapper.SuccessMapper;
import com.qpq.pojo.Dynamic;
import com.qpq.pojo.Reply;
import com.qpq.pojo.User;

@Service
public class ReplyServiceImp{
	
	@Autowired
	private ReplyMapper dao;
	private DynamicMapper dydao;
	private SuccessMapper s1;
	
	//查看回复
	public List<Reply> selectReplyService(int did) throws SQLException{
		/*
		 * try { return dao.selectReply(did); } catch (SQLException e) { // TODO
		 * Auto-generated catch block e.printStackTrace(); }
		 */
		  List<Reply> list=dao.selectReply(did);
		    for (Reply reply : list) {
			int uid=reply.getUid();
			User user = dao.findUser(uid);
			Dynamic dynamic= dao.findDynamic(reply.getDid());
			reply.setUser(user);
			reply.setDynamic(dynamic);
		}
		
		return list;
	}
	
	
	public int replyDenamic(int uid, int did, String content) {
		HashMap<String,Object> map = new HashMap<>();
		try {
			map.put("uid", uid);
			map.put("did", did);
			map.put("content", content);
			return  dao.insertReply(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	
	public Dynamic selectDynamicServcic(int did) throws Exception {
		
		try {
			Dynamic dy =dydao.selectByDid(did);
			User u1 = s1.selectByIdU(dy.getUid());
			dy.setUser(u1);
			return dy;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
