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

import org.apache.commons.io.FilenameUtils;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.qpq.pojo.Dynamic;
import com.qpq.pojo.Page;
import com.qpq.pojo.Paging;
import com.qpq.pojo.User;
import com.qpq.service.DynamicServiceImp;
import com.qpq.service.MessageServiceImpl;
import com.qpq.service.MyDynamicServiceImpl;
import com.qpq.service.UserServiceImpl;

@Controller
public class DynamicController {

	private final int PAGESIZE = 3;//每页显示
	//业务对象
	@Autowired
    private MyDynamicServiceImpl dyService;
	@Autowired
    private UserServiceImpl service;
	@Autowired
    private MessageServiceImpl msgService;
	@Autowired
	private DynamicServiceImp dservice;
	
	private static final long serialVersionUID = 1L;

	// 上传文件存储目录
    private static final String UPLOAD_DIRECTORY = "upload";
 
    // 上传配置
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB

	

	@RequestMapping("/hisPage.do")
	public void hisPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		
		//得到对方id
		String userId = req.getParameter("id");
		int id = 0;
		if(userId!=null) {
			id = Integer.parseInt(userId);
		}else {
			pw.println("未找到该用户");
		}

		//查询动态分页信息
		int currPage = 1;
		try {
			currPage = Integer.parseInt(req.getParameter("p"));
		} catch (Exception e) {
			
		}
		
		//根据id找到用户
		User user = service.findById(id);
		if(user!=null) {
			Paging<Dynamic> list = dyService.searchMyDynamic(user.getId(), PAGESIZE, currPage);
			HttpSession session = req.getSession();
			session.setAttribute("paging", list);
			session.setAttribute("frdUser", user);
			req.getRequestDispatcher("hisPage.jsp").forward(req, resp);
			System.out.println("----"+user.getUserImg());
			return ;
		}
		
		
	}
	
	
	@RequestMapping(value="/upload.do",method = RequestMethod.GET)
	public void uploadG(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		User user = null;
		//获取当前用户
		HttpSession session = req.getSession();
		try {
			user = (User) session.getAttribute("CurrUser");
		} catch (Exception e) {
			
		}
		
		
		//查询动态分页信息
		int currPage = 1;
		try {
			currPage = Integer.parseInt(req.getParameter("p"));
		} catch (Exception e) {
			
		}
		
		if(user!=null) {
			Paging<Dynamic> list = dyService.searchMyDynamic(user.getId(), PAGESIZE, currPage);
			session.setAttribute("paging", list);
			req.setAttribute("curpage", currPage);
			session.setAttribute("pagingSize", list.getData().size());
			//查询用户消息是否大于0，如果大于0，则在‘我的主页’里出现未读消息提示
			int uReadMsgCount = msgService.getUReadMessageCount(user.getId());
			System.out.println(uReadMsgCount);
			
			if(uReadMsgCount>0) {
				//把未读消息数放在session
				session.setAttribute("uReadMsgCount", uReadMsgCount);
				
			}
			System.out.println(user);
			req.getRequestDispatcher("myPage.jsp").forward(req, resp);
			
			System.out.println("----"+user.getUserImg());
			return ;
		}else {
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
	
	}
	
	
	@RequestMapping(value="/upload.do",method = RequestMethod.POST)
	public void uploadP(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		
		// 检测是否为多媒体上传
        if (!ServletFileUpload.isMultipartContent(req)) {
            // 如果不是则停止
            PrintWriter writer = resp.getWriter();
            writer.println("Error: 表单必须包含 enctype=multipart/form-data");
            writer.flush();
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
        //String uploadPath = "/usr/local/tomcat/upload";
        String uploadPath = "/usr/local/tomcat/webapps/myimages";
        
       
//        uploadPath=uploadPath.replace("\\", "/"); 
//        String uploadPath = "\\upload";
        
        System.out.println("存储路径"+uploadPath);
         
        // 如果目录不存在则创建
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        
        //测试，，实际从session能获取
    	HttpSession session = req.getSession();
		User user = (User) session.getAttribute("CurrUser");
        
      
		UserServiceImpl service = new UserServiceImpl();
        try {
            // 解析请求的内容提取文件数据
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest((RequestContext) req);
 
            if (formItems != null && formItems.size() > 0) {
                // 迭代表单数据
                for (FileItem item : formItems) {
                    // 处理不在表单中的字段
                    if (!item.isFormField()) {
                    	//是文件得到文件名 全称加后缀
                    	String fileName = new File(item.getName()).getName();
                        //新文件名
                        String newFileName = "";
                        //文件后缀名
                        String format = FilenameUtils.getExtension(fileName);
                        //避免文件重名，起一个新名字
                        String fileUUIDName = UUID.randomUUID().toString();
                        newFileName =newFileName+ fileUUIDName+"."+format;
                        String filePath = uploadPath+"/"+newFileName;
                        File storeFile = new File(filePath);
                        // 保存文件到硬盘
                        item.write(storeFile);
                        req.setAttribute("message",
                            "文件上传成功!");
                        System.out.println("文件名："+newFileName);
                        //把文件名存进用户
                        user.setUserImg(newFileName);
                       //更新数据库的用户
                       boolean a = service.edit(user);
                       System.out.println("上传状态"+a);
                    }
                }
            }
        } catch (Exception ex) {
            req.setAttribute("message",
                    "错误信息: " + ex.getMessage());
        }
        
       
        
		
		
		//查询当前用户
		User user1 = service.findById(user.getId());
		
		
		if(user1!=null) {

			session.setAttribute("currUser", user1);
		

			System.out.println("-----"+user1.getUserImg());
		}
        
        // 跳转到 message.jsp

		
		req.getRequestDispatcher("/myPage.jsp").forward(req, resp);
	}
	
	
	private int pagesize=4;
	
	@RequestMapping(value="/content.do")
	public void userDynamic(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		resp.setContentType("text/html;charset=utf-8");
//		PrintWriter pw = resp.getWriter();
		int currpage=1;
		String curp = req.getParameter("curr");
		System.out.println("点击传入"+curp);
		if(curp!=null) {
			
			currpage=Integer.parseInt(curp);
		}
		
		Page<Dynamic> page=dservice.selectDynamicService(currpage, pagesize);
		
		
		
		req.getSession().setAttribute("pages", page);
		req.getSession().setAttribute("currpage", page.getCurrpage());
		
		req.getRequestDispatcher("动态.jsp").forward(req, resp);
	}
	
}
