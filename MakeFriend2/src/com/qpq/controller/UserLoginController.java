package com.qpq.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.qpq.pojo.Message;
import com.qpq.pojo.Paging;
import com.qpq.pojo.Success;
import com.qpq.pojo.User;
import com.qpq.service.MessageServiceImpl;
import com.qpq.service.SuccessServiceImpl;
import com.qpq.service.UserServiceImpl;







//@WebServlet("/login")
@Controller
public class UserLoginController
{
	
	@Autowired
	private UserServiceImpl service;
	@Autowired
	private SuccessServiceImpl service1;
	@Autowired
	private MessageServiceImpl mservice;
	
	private static int pageSize=8;
	
	String uu = null;
	
	
	//用户登录
	@RequestMapping(value="/login.do",method = RequestMethod.POST)
	public void uLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		ModelAndView mv = new ModelAndView();
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		req.setCharacterEncoding("utf-8");

		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		String ch = req.getParameter("checkcode");

		//调用Service登录方法
		
		User user = service.login(username, password);
		String che = (String)req.getSession().getAttribute("checkcode");
		if(user != null) {
			//得到用户性别，根据性别推荐
			String userSex = user.getSex();
			System.out.println(user);
			
			//验证码验证
			if(che.equalsIgnoreCase(ch)) {
				//记住账号	
				String remember = req.getParameter("userCookie");
				if(remember!=null) {
					Cookie c1 = new Cookie("username",user.getLoginName());
					c1.setMaxAge(60*60*24);
					resp.addCookie(c1);
				}
				
				if(user.getState()==1) {
			
					req.setAttribute("errUser", "该账号已被冻结");
					req.getRequestDispatcher("login.jsp").forward(req, resp);
			
					return;
				}
	
				Paging<User> a=null;
				if("男".equals(userSex)) {
					a= service.searchBySex("女",1,8);
			
					req.getSession().setAttribute("user", a);
				}else{
					a = service.searchBySex("男",1,8);
					
					List<User> users = a.getData();
				
					req.getSession().setAttribute("user", a);
				}

				int pageSize1=4;
				int currPage =1;
			
				System.out.println("登录成功");
				req.getSession().setAttribute("CurrUser", user);
				
				Paging<Success> success=service1.search(pageSize1, currPage);
				
				req.setAttribute("success", success);
			
				req.getRequestDispatcher("index.jsp").forward(req, resp);
			}else {
			
				req.setAttribute("err", "验证码错误");
				
			req.getRequestDispatcher("login.jsp").forward(req, resp);
			}
		}else {
		
			req.setAttribute("errUser1", "账号密码不匹配");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
	
	}
	
	@RequestMapping(value="/logout.do")
	public void uLoout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
	
		req.getSession().invalidate();
		//重定向到indexServlet
		resp.sendRedirect("login.jsp");
	}
	
	//用户注册
	@RequestMapping(value="/regist.do")
	public void uRegist(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		//URLEncoder.encode(username, "UTF-8");
		//username = new String(username.getBytes("iso8859-1"),"utf8");
		  String loginName = request.getParameter("loginName");
		  String password = request.getParameter("password");
		  String sex = request.getParameter("gender");
		 // sex = new String(sex.getBytes("iso8859-1"),"utf8");
		  String birthday = request.getParameter("birthday");
		  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		  //Date birthday = (Date)request.getAttribute("birthday");
		  System.out.println(request.getParameter("birthday"));
		  String age1 = birthday.substring(0, 4);
		  int age = 2018-Integer.parseInt(age1); 
		  String email = request.getParameter("email");
		  String  card = request.getParameter("card");
		  String  tel = request.getParameter("tel");
		  String  job = request.getParameter("job");
		  String salary = request.getParameter("salary");
		  //System.out.println("工资:"+salary);
		  String marry = request.getParameter("marry");
		  //System.out.println("婚姻："+marry);
		  String heigh = request.getParameter("heigh");
		  //System.out.println("身高："+heigh);
		  String weight = request.getParameter("weight");
		  //System.out.println("体重："+weight);
		  String address = request.getParameter("province")+"省"+request.getParameter("city")+"市"+request.getParameter("qu");
		 //System.out.println("地址："+address);
		  String edu = request.getParameter("edu");
		  String intruct = request.getParameter("intruct");
		  

	User user = new User();
	user.setLoginName(loginName);
	try {
		user.setBirthday(sdf.parse(birthday));
	} catch (ParseException e) {
		
		e.printStackTrace();
	}
	user.setEmail(email);
	user.setSex(sex);
	user.setUsername(username);
	user.setPassword(password);
	user.setCard(card);
	user.setPhone(tel);
	user.setJob(job);
	user.setSalary(salary);
	user.setMarriage(marry);
	user.setHeight(Double.parseDouble(heigh));
	user.setWeight(Integer.parseInt(weight));
	user.setAddress(address);
	user.setEducation(edu);
	user.setIntroduction(intruct);
	user.setAge(age);

	
	
	if(service.insert(user)){
		//response.sendRedirect("index.jsp");
		//pw.println("注册成功");
	
			response.sendRedirect("login.jsp");

	}else{
		pw.println("注册失败");
	}

	}
	
	
	//管理员登录
	@RequestMapping(value="/login2.do")
	public void adminLogin(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		System.out.println(username);
		System.out.println(password);
		
//		User bean = new User();
		//调用Service登录方法
		
		User user = service.login(username, password);
//		System.out.println("----"+user);
		

		if("admin".equals(username) && "123".equals(password)) {
			req.getRequestDispatcher("bb.do").forward(req, resp);
			
		}else {
			pw.println("登录失败");
		}
			
				
		
	}
	
	//主页显示
	@RequestMapping(value="/index.do")
	public void index(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int pageSize=8;
		int currPage =1;
	
		Paging<User> user = service.searchAll(pageSize, currPage);
		System.out.println(user);
		request.setAttribute("user", user);
		//高颜值cp
		int pageSize1=4;
		Paging<Success> success=service1.search(pageSize1, currPage);
		request.setAttribute("success", success);
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
		
	}
	
	//根据姓名查用户
	@RequestMapping(value="/bb.do",method=RequestMethod.GET)
	public void findUserG(HttpServletRequest req, HttpServletResponse resp) throws Exception, IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		int currPage=1;
		System.out.println("username"+uu);
		
		
		try {
		currPage = Integer.parseInt(req.getParameter("p"));
		
		} catch (Exception e) {}
		System.out.println("点击页码"+currPage);
		
		/* Paging<User> user = service.searchAll(pageSize,currPage);*/
		
		Paging<User> list = service.search(uu, pageSize, currPage);
		if(list!=null) {
			System.out.println("返回数据"+list.getData());
			req.setAttribute("lname", list);
			req.getRequestDispatcher("top.jsp").forward(req, resp);
		}else {
			pw.println("查询失败");
		}
		
	}
	
	
	
	
	@RequestMapping(value="/bb.do",method=RequestMethod.POST)
	public void findUserP(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		uu =req.getParameter("uname");
		System.out.println(uu);
		PrintWriter pw = resp.getWriter();
		int currPage=1;
		try {
		currPage = Integer.parseInt(req.getParameter("p"));
		
		} catch (Exception e) {}
	
		
		/* Paging<User> user = service.searchAll(pageSize,currPage);*/
		
		Paging<User> list = service.search(uu, pageSize, currPage);
		if(list!=null) {
			System.out.println("返回数据"+list.getData());
			req.setAttribute("lname", list);
			req.getRequestDispatcher("top.jsp").forward(req, resp);
		}else {
			pw.println("查询失败");
		}
	}
	
	/**
	 * 处理Get请求 , 接受一个id 查找到要修改的 留言
	 */
	@RequestMapping(value="/edit.do",method=RequestMethod.GET)
	public void editGet(HttpServletRequest request, HttpServletResponse response) throws Exception  {
		String str_id = request.getParameter("id");
		int id = Integer.parseInt(str_id);
		
		//调用业务
		User u = service.findById(id);
		System.out.println(u);
		//存入作用域
		request.setAttribute("User", u);
		
		//转发
		request.getRequestDispatcher("/edit.jsp").forward(request, response);
	}
	
	
	/**
	 * 处理Post请求, 接受修改的留言
	 * @throws Exception 
	 */
	@RequestMapping(value="/edit.do",method=RequestMethod.POST)
	public void editPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//设置请求编码
				request.setCharacterEncoding("UTF-8");
				//接受修改的留言的参数
				String id = request.getParameter("id");
				String state = request.getParameter("state");
				
				//封装
				Message msg = new Message();
				msg.setUid(Integer.parseInt(id));
				msg.setContext(state);
				
				//调用业务
				boolean b = mservice.editMessage(msg);
				
				//判断
				if(b) {
					//成功  重定向到FindAllStateServlet
					response.sendRedirect("top.jsp");
				}else {
					request.setAttribute("Err", "修改留言失败！");
					request.getRequestDispatcher("/edit.jsp").forward(request, response);
				}
				
				
	}
	
	@RequestMapping(value="/uppost.do",method=RequestMethod.POST)
	public void updateU(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();
		request.setCharacterEncoding("utf-8");
		
		String userid = request.getParameter("id");
		int id = Integer.parseInt(userid);
		String username = request.getParameter("username");
		//URLEncoder.encode(username, "UTF-8");
		//username = new String(username.getBytes("iso8859-1"),"utf8");
		  String loginName = request.getParameter("loginName");
		  String password = request.getParameter("password");
		  String sex = request.getParameter("gender");
		 // sex = new String(sex.getBytes("iso8859-1"),"utf8");
		  String birthday = request.getParameter("birthday");
		  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		  //Date birthday = (Date)request.getAttribute("birthday");
		  System.out.println(request.getParameter("birthday"));
		  String age1 = birthday.substring(0, 4);
		  int age = 2018-Integer.parseInt(age1); 
		  String email = request.getParameter("email");
		  String  card = request.getParameter("card");
		  String  tel = request.getParameter("tel");
		  String  job = request.getParameter("job");
		  String salary = request.getParameter("salary");
		  //System.out.println("工资:"+salary);
		  String marry = request.getParameter("marry");
		  //System.out.println("婚姻："+marry);
		  String height = request.getParameter("height");
		  //System.out.println("身高："+heigh);
		  String weight = request.getParameter("weight");
		  //System.out.println("体重："+weight);
		  String address = request.getParameter("province")+"省"+request.getParameter("city")+"市"+request.getParameter("qu");
		 //System.out.println("地址："+address);
		  String edu = request.getParameter("edu");
		  String intruct = request.getParameter("intruct");
		  
		  User user = new User();
		    user.setId(id);
			user.setEmail(email);
			user.setSex(sex);
			user.setUsername(username);
			user.setLoginName(loginName);
			user.setPassword(password);
			user.setCard(card);
			user.setPhone(tel);
			user.setJob(job);
			user.setSalary(salary);
			user.setMarriage(marry);
			user.setHeight(Double.parseDouble(height));
			user.setWeight(Integer.parseInt(weight));
			user.setAddress(address);
			user.setEducation(edu);
			user.setIntroduction(intruct);
			user.setAge(age);
		  
		  
		  
		
		UserServiceImpl service1  = new UserServiceImpl();
		  boolean flag = service1.updateUser(user);
		  System.out.println("修改测试"+flag);
		  if(flag) {
			  request.getRequestDispatcher("/login.jsp").forward(request, response); 
		  }else {
			  pw.write("修改失败");
		  }
	}
	
	@RequestMapping(value="/update.do")
	public void updateA(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();
		request.setCharacterEncoding("utf-8");
		
		String UserID = request.getParameter("id");
		int id = Integer.parseInt(UserID);
		
		UserServiceImpl service1  = new UserServiceImpl();
		User u1 =service1.findById(id);
		
        request.setAttribute("User1", u1);
		
		//转发
		request.getRequestDispatcher("/update.jsp").forward(request, response); 
		
	}
	
	
	}
	

