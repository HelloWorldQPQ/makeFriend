package com.qpq.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.apache.commons.io.FilenameUtils;

import com.qpq.pojo.Success;
import com.qpq.pojo.User;
import com.qpq.service.DynamicServiceImp;
import com.qpq.service.MessageServiceImpl;
import com.qpq.service.SuccessServiceImpl;




@Controller
public class FunctionController {
	
	@Autowired
	private SuccessServiceImpl service1;
	@Autowired
	private MessageServiceImpl mservice;
	@Autowired
	private DynamicServiceImp dservice;
	
	//删除留言
	@RequestMapping("/dellove.do")
	public void deleteLove(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		
		String str_id = req.getParameter("sid");
		
		int id=Integer.parseInt(str_id);
		if(service1.deleteSuccessById(id)){
			pw.println("<h2>删除成功</h2>");
			pw.println("<a href='success.jsp'>返回首页</a>");
		}else{
			pw.println("<h2>删除失败</h2>");
		}
	}
	
	//已读
	@RequestMapping("/hasRead.do")
	public void hasRead(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		
		//获取留言的id
		String messageId = req.getParameter("id");		
		int id = Integer.parseInt(messageId);
		
		System.out.println("留言id"+id);
		//修改为已读
		mservice.changeStatus(id);
		
		req.getRequestDispatcher("msgboard.do").forward(req, resp);
	}
	
	//未读
	@RequestMapping("/UnReadCount.do")
	public void unReadCount(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		User user = null;
		//获取当前用户
		HttpSession session = req.getSession();
		try {
			user = (User) session.getAttribute("CurrUser");
		} catch (Exception e) {
			
		}
		
		//查询用户消息是否大于0，如果大于0，则在‘我的主页’里出现未读消息提示
		int uReadMsgCount= mservice.getUReadMessageCount(user.getId());
	
	
//		session.setAttribute("uReadMsgCount", uReadMsgCount);
		pw.print(uReadMsgCount);
		//pw.write(uReadMsgCount);
	}
	
	//查询该用户的所有未读消息
	@RequestMapping("/ReciveMeaasgeServlet.do")
	public void reciveMessage(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("CurrUser");
	}
	
	//成功案例
	@RequestMapping("/pubw.do")
	public void publishWeb(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		int uid=0;
		User user=(User) req.getSession().getAttribute("CurrUser");
		uid=user.getId();
		
		String cont=req.getParameter("cont");
		if(cont!=""&&cont!=null) {
			dservice.publich(uid, cont);
			
		}
		req.getRequestDispatcher("/content.do").forward(req, resp);
		
	}
	
	
	// 上传文件存储目录
	private static final String UPLOAD_DIRECTORY = "upload";
	// 上传配置
	private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3; // 3MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB
	Success success = new Success();

	
	
	@RequestMapping("/publishlove.do")
	public void publishLove(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		String basePath = req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort()
				+ req.getContextPath();

		// 检测是否为多媒体上传
		if (!ServletFileUpload.isMultipartContent(req)) {
			// 如果不是则停止
			PrintWriter writer = resp.getWriter();
			writer.println("Error: 表单必须包含 enctype=multipart/form-data");
			writer.flush();

			System.out.println("不是则停止");
			return;
		}
		// 配置上传参数
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
		factory.setSizeThreshold(MEMORY_THRESHOLD);
		// 设置临时存储目录
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

		ServletFileUpload upload = new ServletFileUpload(factory);

		// 设置最大文件上传值
		upload.setFileSizeMax(MAX_FILE_SIZE);

		// 设置最大请求值 (包含文件和表单数据)
		upload.setSizeMax(MAX_REQUEST_SIZE);

		// 中文处理
		upload.setHeaderEncoding("UTF-8");

		// 构造临时路径来存储上传的文件
		// 这个路径相对当前应用的目录
//        String uploadPath = getServletContext().getRealPath("/") +UPLOAD_DIRECTORY;
		String uploadPath = "d:/project";
//        uploadPath=uploadPath.replace("/", "\\"); 
//        uploadPath=uploadPath.replace("\\", "/"); 
//        String uploadPath = "\\upload";

		// 如果目录不存在则创建
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}

		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("CurrUser");
		System.out.println(user);
		try {
			// 解析请求的内容提取文件数据
			@SuppressWarnings("unchecked")
			List<FileItem> formItems = upload.parseRequest((RequestContext) req);

			if (formItems != null && formItems.size() > 0) {
				// 迭代表单数据
				for (FileItem item : formItems) {
					// 处理不在表单中的字段
					if (!item.isFormField()) {
						// 是文件得到文件名 全称加后缀
						String fileName = new File(item.getName()).getName();
						System.out.println(fileName);

						// 新文件名
						String newFileName = "";

						// 文件后缀名
						String format = FilenameUtils.getExtension(fileName);
						// 避免文件重名，起一个新名字
						String fileUUIDName = UUID.randomUUID().toString();

						newFileName = newFileName + fileUUIDName + "." + format;

						String filePath = uploadPath + "//" + newFileName;

						System.out.println(filePath);
						File storeFile = new File(filePath);
						
						
						System.out.println("storeFile:"+storeFile);
						// 保存文件到硬盘
						item.write(storeFile);
						req.setAttribute("message", "文件上传成功!");

					
						success.setImg(newFileName);

					}else {
//						String name = item.getFieldName();
						
						String content =item.getString("utf-8");
						success.setContent(content);
						System.out.println(content);
						
						
						
					}
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			req.setAttribute("message", "错误信息: " + ex.getMessage());
		}
//        success.setContent(req.getParameter("content"));
		success.setUid(user.getId());

		boolean b = service1.publishSuccess(success);
		if (b) {
			System.out.println("上传成功");
			System.out.println(success);
			session.setAttribute("success", success);
			resp.sendRedirect("success");
			//req.getRequestDispatcher("success.jsp").forward(req, resp);

		} else {
			req.getRequestDispatcher("index.jsp").forward(req, resp);
		}
	
	}
	
	private int pageSize=3;
	
	@RequestMapping("/success.do")
	public void successWeb(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int currpage=1;
		try {
			currpage=Integer.parseInt(req.getParameter("p"));
		} catch (Exception e) {
			
		}
		
		/*//调用业务
		Success success=(Success) req.getSession().getAttribute("success");
		System.out.println(success);*/
		req.getSession().setAttribute("paging", service1.search(pageSize, currpage));
		System.out.println(service1.search(pageSize, currpage));
		//转发
		req.getRequestDispatcher("success.jsp").forward(req, resp);
		
	}
	
	
	
}
	
	


