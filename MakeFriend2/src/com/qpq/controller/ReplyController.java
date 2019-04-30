package com.qpq.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qpq.pojo.Dynamic;
import com.qpq.pojo.Reply;
import com.qpq.pojo.User;
import com.qpq.service.ReplyServiceImp;

@Controller
public class ReplyController {
	
	@Autowired
	private ReplyServiceImp rservice;
	
	@RequestMapping("/rep.do")
	public void replyWeb(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		int did=0;
		try{
			did=Integer.parseInt(req.getParameter("did"));
		}catch(Exception e){}
		
		Dynamic dynamic=rservice.selectDynamicServcic(did);
		System.out.println("******1+1");
		System.out.println(dynamic);
		
		List<Reply> reply =  rservice.selectReplyService(did);
		String reusers=dynamic.getUser().getUsername();
		String recontents=dynamic.getContent();
		String reuserimgs=dynamic.getUser().getUserImg();
		
		
		req.getSession().setAttribute("redid", dynamic.getDid());
		req.getSession().setAttribute("reuser", reusers);
		req.getSession().setAttribute("recontent", recontents);
		req.getSession().setAttribute("reuserimg", reuserimgs);
		req.getSession().setAttribute("replys",reply);
		
		req.getRequestDispatcher("/回复动态.jsp").forward(req, resp); 
	}
	
	@RequestMapping("/redna.do")
	public void reDynamic(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		int did1= (int) req.getSession().getAttribute("redid");
		User user=(User) req.getSession().getAttribute("CurrUser");
		int uid=user.getId();
		
		req.setAttribute("did", did1);
		String content=req.getParameter("content");
		rservice.replyDenamic(uid, did1, content);
		req.getRequestDispatcher("/rep.do?did="+did1).forward(req, resp);
	}

}
