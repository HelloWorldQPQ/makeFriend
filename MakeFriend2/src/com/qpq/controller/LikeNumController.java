package com.qpq.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qpq.pojo.Dynamic;
import com.qpq.service.DynamicServiceImp;
import com.qpq.service.MyDynamicServiceImpl;
import com.qpq.service.ReplyServiceImp;



@Controller
public class LikeNumController {
	
	@Autowired
	private DynamicServiceImp service;
	@Autowired
	private ReplyServiceImp rservice;
	@Autowired
	private MyDynamicServiceImpl mservice;
	
	
	
	@RequestMapping("/likeadd.do")
	public void likeNumAdd(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		int did=0;
		String dname=req.getParameter("sdid");
		try{
			did=Integer.parseInt(dname);
		}catch(Exception e){}
		
		int i=service.updataLikenumService(did);
		System.out.println("like:"+i);
		
		Dynamic dynamic=rservice.selectDynamicServcic(did);
		int likenum=dynamic.getLikenum();
		pw.print(likenum);
	}
	
	
	@RequestMapping("/like")
	public void likeNum(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		
		//动态的id
		String id = req.getParameter("did");
		int did = -1;
		if(id!=null&&id!="") {
			did = Integer.parseInt(id);
		}
		if(did!=-1) {
			//根据动态id更新动态
			mservice.addLikeNum(did);
			int likeNum = mservice.getLikeNum(did);
			System.out.println(likeNum);
			pw.write(""+likeNum);
		}
	}

}
