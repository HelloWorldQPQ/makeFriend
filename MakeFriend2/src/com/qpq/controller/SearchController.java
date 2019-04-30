package com.qpq.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qpq.pojo.User;
import com.qpq.service.UserServiceImpl;

@Controller
public class SearchController {
	
	@Autowired
	private UserServiceImpl service;
	
	private String queryString;
	
	@RequestMapping("/search.do")
	public void search(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
		//接收表单参数
		queryString = request.getParameter("queryString");
		
		//调用业务类
		List<User> userList =  service.findByName(queryString);
		
		//存储到作用域
		request.setAttribute("UserList",userList);
		
		//转发
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}
	
	

}
