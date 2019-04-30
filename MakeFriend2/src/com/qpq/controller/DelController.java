package com.qpq.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qpq.service.DynamicServiceImp;
import com.qpq.service.UserServiceImpl;

@Controller
public class DelController {
	
	
	@Autowired
	private DynamicServiceImp service;
	

	
	@RequestMapping("/del.do")
	public void delWeb(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		int did=0;
		try{
			did=Integer.parseInt(req.getParameter("did"));
		}catch(Exception e){
			
		}
		int result=service.deleteDy(did);
		System.out.println(result);
		req.getRequestDispatcher("/content.do").forward(req, resp);
		
	}
	
	@RequestMapping("/delUser.do")
	public void delUser(HttpServletRequest request, HttpServletResponse response) throws Exception  {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();
		request.setCharacterEncoding("utf-8");
		String UserID = request.getParameter("id");
		int id = Integer.parseInt(UserID);
		
		UserServiceImpl service1  = new UserServiceImpl();
		boolean flag = service1.removeById(id);
		if(flag) {
			//request.getRequestDispatcher("top.jsp").forward(request, response);
			response.sendRedirect("top.jsp");
		}else {
			pw.write("刪除失敗");
		}
		
		
	}
}
