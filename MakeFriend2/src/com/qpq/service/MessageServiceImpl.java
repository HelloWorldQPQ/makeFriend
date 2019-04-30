package com.qpq.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qpq.mapper.MessageMapper;
import com.qpq.mapper.UserMapper;
import com.qpq.pojo.Message;
import com.qpq.pojo.Message2;
import com.qpq.pojo.Paging;
import com.qpq.pojo.User;

@Service
public class MessageServiceImpl{	
	
	@Autowired
	private MessageMapper msgDao;
	private UserMapper userDao;
	
	public int getUReadMessageCount(int id) {
		
		try {
			return msgDao.selectMessageCount(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	
	public Paging<Message2> getURMessage(int id,int pageSize,int currPage) {
		
		HashMap<String,Object> map = new HashMap<>();
		Paging<Message2> paging = new Paging<Message2>(pageSize,currPage);
		
		
		int begin = (currPage-1)*pageSize;
		
		
		try {
			
			int rows = msgDao.selectMessageCount(id);
			int pageCount = (int)Math.ceil((double)rows/pageSize);
			
			map.put("recId", id);
			map.put("begin", begin);
			map.put("end", pageSize);

			List<Message2> list = msgDao.selectURMessage(map);
			
			Iterator<Message2> it = list.iterator();
			User user = null;
			while(it.hasNext()) {
				
				Message2 msg = it.next();
				user = userDao.selectById(msg.getSendId());
				msg.setSendUser(user);
			}
			
			paging.setPageCount(pageCount);
			paging.setRowsCount(rows);
			paging.setData(list);
			
			return paging;
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
			
		return null;
	}
	
	
	public Paging<Message2> getAllMessage(int id,int pageSize,int currPage) {
		HashMap<String,Object> map = new HashMap<>();
		Paging<Message2> paging = new Paging<Message2>(pageSize,currPage);
		int begin = (currPage-1)*pageSize;
		try {
			
			int rows = msgDao.selectAllMessageCount(id);
			int pageCount = (int)Math.ceil((double)rows/pageSize);
			
			map.put("recId", id);
			map.put("begin", begin);
			map.put("end", pageSize);
			List<Message2> list = msgDao.selectAllMessage(map);
		
			Iterator<Message2> it = list.iterator();
			User user = null;
			while(it.hasNext()) {
				Message2 msg = it.next();
				user = userDao.selectById(msg.getSendId());
				msg.setSendUser(user);
			}
			paging.setPageCount(pageCount);
			paging.setRowsCount(rows);
			paging.setData(list);
			
			return paging;
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		
		return null;
	}

	
	public void changeStatus(int id) {
		try {
			msgDao.changeStatus(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	public boolean insetMessage2(Message2 msg2) {
		// TODO Auto-generated method stub
		try {
			return msgDao.insertMessage2(msg2)>0;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	
	public Paging<Message2> seachAll() {
		Paging<Message2> paging = new Paging<>();		
		
		List<Message2> list;
		try {
			list = msgDao.selectAllMessages();
			paging.setData(list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return paging;
	}
	

	public Paging<User> searchUser() {
		Paging<User> puser = new Paging<>();
		
		List<User> list;
		
		try {
			list = userDao.selectAllUser();
			puser.setData(list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return puser;
	}


	public int getMessageCount(int id) {
		
		try {
			return msgDao.selectAllMessageCount(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	/**
	 * 修改
	 */

	public boolean editMessage(Message msg) {
		try {
			return msgDao.updateMessage(msg)>0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
