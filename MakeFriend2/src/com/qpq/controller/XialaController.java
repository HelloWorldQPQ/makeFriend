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
import org.springframework.web.bind.annotation.RequestMethod;

import com.qpq.pojo.Paging;
import com.qpq.pojo.User;
import com.qpq.service.UserServiceImpl;

@Controller
public class XialaController {
	
	
	@Autowired
	private UserServiceImpl service;
	//每页显示8条
	private int pageSize = 8;
	private int currPage = 1;
	
	//得到查询条件
		private String sex = null;
		String age;
		String age11 ;
		int age1;
		String age22;
		int age2;
		String marry;
		String education;
		String heigh;
		String high11;
		Double high1;
		String high22;
		Double high2;
		String weight;
		String weight11;
		int weight1;
		String weight22;
		int weight2;
		
		
    @RequestMapping(value="/xiala.do",method = RequestMethod.GET)
	public void xialaG(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//接受页码
		try {
			currPage = Integer.parseInt(req.getParameter("p"));
		} catch (Exception e) {}
		
		//Paging<User> user=service.searchTiaoJian(sex,age1,age2,high1,high2,weight1,weight2,education,marry,pageSize, currPage);
		Paging<User> userAll = service.searchAll(pageSize, currPage);
		
		List<User> uu = userAll.getData();
		System.out.println("uu是否为空"+uu.isEmpty());
		if(uu.isEmpty()) {
			req.setAttribute("err", "没有符合条件的嘉宾");

		}else {
			req.setAttribute("search", userAll);

		}
		req.getRequestDispatcher("xiala.jsp").forward(req, resp);
	}
	
    @RequestMapping(value="/xiala.do",method = RequestMethod.POST)
	public void xialaP(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		req.setCharacterEncoding("utf-8");
		PrintWriter pw = resp.getWriter();
		sex= req.getParameter("sex");
		System.out.println(sex);
		
		//接受页码
		try {
			currPage = Integer.parseInt(req.getParameter("p"));
		} catch (Exception e) {}
		
		age= req.getParameter("age");
		age11= age.substring(0, 2);
		age1 = Integer.parseInt(age11);
		//System.out.println("年龄1："+age1);
		
		age22 = age.substring(3, age.length());
		age2 = Integer.parseInt(age22);
		//System.out.println("年龄2："+age2);
		
		marry = req.getParameter("marry");
		//System.out.println(marry);
		education = req.getParameter("education");
		//System.out.println(education);
		
		heigh = req.getParameter("heigh");
		high11 = heigh.substring(0, 3);
		high1 = Double.parseDouble(high11);
		//System.out.println("身高1："+high1);
		
		high22 = heigh.substring(4, heigh.length());
		high2 = Double.parseDouble(high22);
		//System.out.println("身高2："+high2);
		
		weight = req.getParameter("wight");
		weight11 = weight.substring(0, 2);
		weight1 = Integer.parseInt(weight11);
		//System.out.println("体重1："+weight1);
		
		weight22 = weight.substring(3,5);
		weight2 = Integer.parseInt(weight22);
		//System.out.println("体重2："+weight2);
		
		//String adress = req.getParameter("province");
		
		 
		
		
		Paging<User> user=service.searchTiaoJian(sex,age1,age2,high1,high2,weight1,weight2,education,marry,pageSize, currPage);
		Paging<User> userAll = service.searchAll(pageSize, currPage);
		/*req.setAttribute("search", user);
		req.setAttribute("searchAll", userAll);*/
		
		List<User> uu = user.getData();
		System.out.println("uu是否为空"+uu.isEmpty());
		if(uu.isEmpty()) {
			req.setAttribute("err", "没有符合条件的嘉宾");
			
		}else {
			req.setAttribute("search", user);

		}
		//System.out.println(user.getData()!=null);
		/*List<User> all = userAll.getData();
		for (User user2 : all) {
		System.out.println(user2.toString());	
		}*/
		
		req.getRequestDispatcher("xiala.jsp").forward(req, resp);
	}
}
