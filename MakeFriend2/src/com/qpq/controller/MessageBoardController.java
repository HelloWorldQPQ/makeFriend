package com.qpq.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.qpq.pojo.Message2;
import com.qpq.pojo.Paging;
import com.qpq.pojo.User;
import com.qpq.service.MessageServiceImpl;



@Controller
public class MessageBoardController {
	
	private static final long serialVersionUID = 1L;
	//每页显示3条
	private static final int PAGESIZE = 3;
	//业务对象
	@Autowired
	private MessageServiceImpl service;
	
	
	
	@RequestMapping("/msgboard.do")
	public void unReadMessage(HttpServletRequest req, HttpServletResponse resp) throws Exception, IOException {
		resp.setContentType("text/html;charset=utf-8");
//		PrintWriter pw = resp.getWriter();
		int currPage = 1;
		
		String  curr = req.getParameter("p");
		if(curr!=null) {

			currPage = Integer.parseInt(curr);
			
		}

		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("CurrUser");
		
		//查询未读消息
		Paging<Message2> list = service.getURMessage(user.getId(), PAGESIZE, currPage);
		req.setAttribute("curPage", currPage);
		session.setAttribute("paging", list);		
		req.getRequestDispatcher("msgbord.jsp").forward(req, resp);
		
		
		
	}
	
	@RequestMapping("/msgbord1.do")
	public void allMessage(HttpServletRequest req, HttpServletResponse resp) throws Exception, IOException {
		resp.setContentType("text/html;charset=utf-8");
//		PrintWriter pw = resp.getWriter();
		
		int currPage = 1;
		
		String  curr = req.getParameter("p");
		if(curr!=null) {
			currPage = Integer.parseInt(curr);
		}
	
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("CurrUser");
		
		//查询所有消息
		Paging<Message2> list = service.getAllMessage(user.getId(), PAGESIZE, currPage);
		
		//System.out.println("全部消息页数:"+list.getPageCount());
		session.setAttribute("paging1", list);
		req.setAttribute("curPage", currPage);
		req.getRequestDispatcher("msg_er.jsp").forward(req, resp);
		
	}
	
	
	Message2 msg2 = new Message2();
	
	@RequestMapping(value="/pub.do",method = RequestMethod.GET)
	public void sendTG(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException  {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		req.setCharacterEncoding("utf-8");
		
		
		String id = req.getParameter("recId");
		String sid = req.getParameter("sendId");
		int recId = -1;
		int sendId = -1;
		if(id!=null) {
			recId = Integer.parseInt(id);
		}
		if(sid!=null) {
			sendId = Integer.parseInt(sid);
		}
		msg2.setSendId(sendId);
		msg2.setRecId(recId);
		
			req.getRequestDispatcher("sendT.jsp").forward(req, resp);
		
		
	}
	
	
	@RequestMapping(value="/pub.do",method = RequestMethod.POST)
	public void sendTP(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException  {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		String context = req.getParameter("context");

		msg2.setContext(context);
		boolean b = service.insetMessage2(msg2);
		Paging<Message2> paging = service.seachAll();
		Paging<User> Puser =service.searchUser(); 
		
		req.setAttribute("puser", Puser);
		req.setAttribute("paging", paging);
		
		req.getRequestDispatcher("sendT.jsp").forward(req, resp);
	}
	
	
	@RequestMapping(value="/pub1.do",method = RequestMethod.POST)
	public void sendT2(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException  {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		String context = req.getParameter("context");
	
		User aa = (User) req.getSession().getAttribute("CurrUser");
		int sendId = aa.getId();
		System.out.println(aa);
		//页面传过来的参数
		int recId = -1;
		//收信人id
		String bb = req.getParameter("recId");
		if(bb!=null) {
			recId = Integer.parseInt(bb);
		}
		System.out.println("dao:"+recId);
	
		
		msg2.setSendId(sendId);
		
		msg2.setContext(context);
		
		msg2.setRecId(recId);
		
		//boolean b = message.publishMessage(msg2);
		boolean b = service.insetMessage2(msg2);
		
		if(b) {
			pw.write(context);
		}
		msg2.setContext(context);
		
		Paging<Message2> paging = service.seachAll();
		Paging<User> Puser =service.searchUser(); 
		
		req.setAttribute("puser", Puser);
		req.setAttribute("paging", paging);
		
	}

}
