package com.ishang.beauty.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.Charsets;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ishang.beauty.entity.Blog;
import com.ishang.beauty.entity.BlogComment;
import com.ishang.beauty.entity.BlogType;
import com.ishang.beauty.entity.User;
import com.ishang.beauty.entity.UserRole;
import com.ishang.beauty.service.BlogCommentService;
import com.ishang.beauty.service.BlogService;
import com.ishang.beauty.service.BlogTypeService;
import com.ishang.beauty.service.UserRoleService;
import com.ishang.beauty.service.UserService;
import com.ishang.beauty.utils.EncodingTool;
import com.ishang.beauty.utils.Md5Utils;

@Controller    
@RequestMapping("/back") 
public class ManageSystemController {
	@Autowired
	private BlogService blogservice;
	@Autowired
	private UserService userservice;
	@Autowired
	private BlogCommentService cmtservice;
	@Autowired
	private BlogTypeService typeservice;
	@Autowired
	private UserRoleService roleservice;
	
	
	private Integer loginid=0;
	
	// 页面跳转
	//------------------------------------------------------
	@RequestMapping("/login")
	public String tologin(Model model) {
		return "../ms/login.jsp";
	}
	
	@RequestMapping("/index")
	public String toindex(Model model) {
		if(loginid>0) {
			User user = userservice.selectbyid(loginid).get(0);
			model.addAttribute("loginuser", user);
		}
		return "../ms/index.jsp";
	}
	
	@RequestMapping("/adminuser")
	public String touser(Model model) {
		return "../ms/ms-user.jsp";
	}
	@RequestMapping("/adminblog")
	public String toblog(Model model) {
		return "../ms/ms-blog.jsp";
	}
	@RequestMapping("/admintype")
	public String totype(Model model) {
		return "../back/gettype";
	}
	@RequestMapping("/adminrole")
	public String torole(Model model) {
		return "../back/getrole";
	}
	@RequestMapping("/admincomment")
	public String tocmt(Model model) {
		return "../ms/ms-comment.jsp";
	}
	
	@RequestMapping("/upblog")
	public String toblogUP(Model model) {
		return "../ms/ms-blog.jsp";
	}
	@RequestMapping("/upcomment")
	public String tocmtUP(Model model) {
		return "../ms/ms-comment.jsp";
	}
	//------------------------------------------------------
	
	// 业务处理
	@RequestMapping(value = "/loginaction", method = RequestMethod.POST)
	public String backlogin(@RequestParam("username") String username,@RequestParam("password") String password,
			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		String stores[] = request.getParameterValues("reb");
		//System.out.println(stores);
		Boolean re= true;
		if(stores==null) re=false;
		request.setCharacterEncoding("UTF-8");
		System.out.println("原来："+username);
		username=EncodingTool.encodeStr(username);
		System.out.println("处理后："+username);
		User user = new User();
		user.setUsername(username);
		user.setPassword(Md5Utils.md5(password));		
		
		List<User> result = userservice.backlogin(user);
		if (result.size() > 0 ) {
			// set global variable loginid
			loginid=result.get(0).getId();
			
			// 设置session
			HttpSession session = request.getSession();
			session.setAttribute("SESSION_UserID", result.get(0).getId());
			session.setAttribute("SESSION_UserName", result.get(0).getUsername());
			session.setAttribute("SESSION_PassWord", null);
			String loginname = URLEncoder.encode(result.get(0).getUsername(), String.valueOf(Charsets.UTF_8));
			loginname=loginname.replaceAll("\\+", "%20");
			System.out.println(loginname);
			String loginInfo = loginname + "#" + password + "#" + result.get(0).getId();
			String loginInfo2 = loginname + "#" +'1'+ "#" + result.get(0).getId();
			// 如果记住密码设置cookie
			if (re) {
				session.setAttribute("SESSION_PassWord", result.get(0).getPassword());
				Cookie userCookie = new Cookie("backuser", loginInfo.toString());
				// 设置保存7天cookie
				userCookie.setMaxAge(7 * 24 * 60 * 60);
				userCookie.setPath("/");
				response.addCookie(userCookie);
			} else {// 没有选中记住密码，删除cookie
				Cookie newCookie = new Cookie("backuser", loginInfo2.toString());
				newCookie.setMaxAge(7 * 24 * 60 * 60);
				newCookie.setPath("/");
				// 覆盖之前的userCookie
				response.addCookie(newCookie);
			}
			int roleid = result.get(0).getRoleid();
			if(roleid==2) return "../index";
			else { 
				session.setAttribute("roleid", roleid);
				return "../back/index"; 
			}
		} else {
			request.setAttribute("msg", "用户名或密码错误，请检查后再试。");
			return "../ms/login.jsp";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/getall", method = RequestMethod.GET)    
    public Map<String, Object> findall(@RequestParam(value = "pn", defaultValue = "1") String strpn){    
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int pagesize=10;
		int pn = Integer.parseInt(strpn);
		// 在查询前设置limit
		PageHelper.startPage(pn, pagesize);
		List<Blog> rstlist=blogservice.findrealall();				
		PageInfo<Blog> page = new PageInfo<Blog>(rstlist);
		System.out.println("page:"+pn+": size="+rstlist.size());
		map.put("rstmap", rstlist);
		map.put("pageinfo", page);
		
		String[] typelist = 	new String[pagesize];
		int[] starlist = new int[pagesize];
		int[] cmtlist = new int[pagesize];
		
		for(int i=0; i<rstlist.size(); i++) {
			int id=rstlist.get(i).getId();
			typelist[i]=typeservice.findbyid(rstlist.get(i).getTypeid()).getTypename();
			starlist[i]=blogservice.getnum(id, "star");
			cmtlist[i]=blogservice.getnum(id, "cmt");
		}
		
		map.put("typemap", typelist);
		map.put("starmap", starlist);
		map.put("cmtmap", cmtlist);
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public Map<String, Object> backsearch(@RequestParam String keyword, @RequestParam Integer upid,
			HttpServletRequest request) throws UnsupportedEncodingException {
		Map<String, Object> map = new HashMap<String, Object>();
		keyword=URLDecoder.decode(keyword, "UTF-8");
		System.out.println(keyword);
		Blog record = new Blog();
		record.setUserid(upid);
		record.setTitle(keyword);
		List<Blog> rstlist= new ArrayList<Blog>();
		if(upid==1) rstlist=blogservice.findbyentity(record);
		else {
			record.setUserid(upid);
			rstlist=blogservice.findbyentity(record);
		}
		
		if(rstlist.size()>0) {
			int n=rstlist.size();
			System.out.println(n);
			map.put("rstmap", rstlist);
			String[] typelist = 	new String[n];
			int[] starlist = new int[n];
			int[] cmtlist = new int[n];
			for(int i=0; i<n; i++) {
				int id=rstlist.get(i).getId();
				typelist[i]=typeservice.findbyid(rstlist.get(i).getTypeid()).getTypename();
				starlist[i]=blogservice.getnum(id, "star");
				cmtlist[i]=blogservice.getnum(id, "cmt");
			}
			map.put("typemap", typelist);
			map.put("starmap", starlist);
			map.put("cmtmap", cmtlist);
		}else {
			System.out.println("back no result");
		}

		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getbyid", method = RequestMethod.GET)    
    public Map<String, Object> findbyid( @RequestParam Integer pn, @RequestParam Integer upid){    
			//@RequestParam(value = "pn", defaultValue = "1") String strpn, 
    		//@RequestParam("upid") String str_up){    
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int pagesize=10;
		//int pn = Integer.parseInt(strpn);
		//int upid=Integer.parseInt(str_up);
		// 在查询前设置limit
		PageHelper.startPage(pn, pagesize);
		List<Blog> rstlist = blogservice.findupreal(upid);
		PageInfo<Blog> page = new PageInfo<Blog>(rstlist);
		System.out.println("page:"+pn+": size="+rstlist.size());
		map.put("rstmap", rstlist);
		map.put("pageinfo", page);
		
		String[] typelist = 	new String[pagesize];
		int[] starlist = new int[pagesize];
		int[] cmtlist = new int[pagesize];
		
		for(int i=0; i<rstlist.size(); i++) {
			int id=rstlist.get(i).getId();
			typelist[i]=typeservice.findbyid(rstlist.get(i).getTypeid()).getTypename();
			starlist[i]=blogservice.getnum(id, "star");
			cmtlist[i]=blogservice.getnum(id, "cmt");
		}
		
		map.put("typemap", typelist);
		map.put("starmap", starlist);
		map.put("cmtmap", cmtlist);
		return map;
	}
	
	@RequestMapping("/gettype")
	public String gettype(HttpServletRequest request,Model model) throws UnsupportedEncodingException{    
		List<BlogType> rstlist = typeservice.findall();
		model.addAttribute("rstlist", rstlist);
		List<BlogType> reslist = typeservice.findres();
		model.addAttribute("reslist", reslist);
		return "../ms/ms-type.jsp";
	}
	
	@RequestMapping("/getrole")
	public String getrole(HttpServletRequest request,Model model) throws UnsupportedEncodingException{    
		List<UserRole> rstlist = roleservice.findall();
		model.addAttribute("rstlist", rstlist);
		List<UserRole> reslist = roleservice.findres();
		model.addAttribute("reslist", reslist);
		return "../ms/ms-role.jsp";
	}
	
	@ResponseBody
	@RequestMapping(value = "/getcmt", method = RequestMethod.POST)    
    public Map<String, Object> findcmt( @RequestParam Integer pn, @RequestParam(value = "upid", required = false) Integer upid, @RequestParam(value = "keyword", required = false) String keyword ) throws UnsupportedEncodingException{     
		keyword=URLDecoder.decode(keyword, "UTF-8");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int pagesize=10;
		PageHelper.startPage(pn, pagesize);
		
		List<BlogComment> rstlist=new ArrayList<BlogComment>();
		BlogComment record= new BlogComment();
		if(upid!=0) {
			record.setUserid(upid);
			if(keyword!="") record.setComment(keyword);
			rstlist = cmtservice.getuplike(record);
		}else {
			rstlist=cmtservice.getrealall();
			if(keyword!="") {
				record.setComment(keyword);
				rstlist=cmtservice.findbyentity(record);
			}
		}
		PageInfo<BlogComment> page = new PageInfo<BlogComment>(rstlist);
		System.out.println("page:"+pn+": size="+rstlist.size());
		map.put("rstmap", rstlist);
		map.put("pageinfo", page);
		
		int n=rstlist.size();
		if(n>0) {
			String[] cmter= new String[n];
			for(int i=0; i<n;i++) {
				cmter[i]=userservice.findbyid(rstlist.get(i).getUserid()).get(0).getUsername();
			}
			map.put("cmtermap",cmter);
		}		

		return map;
	}
	
	@RequestMapping(value = "/deleterole" , method = RequestMethod.GET)
	public String delrole(HttpServletRequest request,Model model) throws UnsupportedEncodingException{    
		String strrole= (String) request.getParameter("roleid");
		int roleid=Integer.parseInt(strrole);
		UserRole record = roleservice.findbyid(roleid);
		if(roleservice.deleteone(record)>0) request.setAttribute("msg", "删除成功");
		else request.setAttribute("msg", "添加失败");
		return "../back/adminrole";
	}
	
	@RequestMapping(value = "/deletetype" , method = RequestMethod.GET)
	public String deltype(HttpServletRequest request,Model model) throws UnsupportedEncodingException{    
		String strtype= (String) request.getParameter("typeid");
		int typeid=Integer.parseInt(strtype);
		BlogType record = typeservice.findbyid(typeid);
		if(typeservice.deleteone(record)>0) request.setAttribute("msg", "删除成功");
		else request.setAttribute("msg", "添加失败");
		return "../back/admintype";
	}
	
	@RequestMapping(value = "/addtype",  method = RequestMethod.POST)
	public String addtype(HttpServletRequest request, HttpServletResponse response ,Model model, @RequestParam(required = false) String typename) {
		Optional<String> nullobject = Optional.ofNullable(typename);
		if(nullobject.isPresent()) {
			BlogType record = new BlogType();
			record.setTypename(typename);
			record.setDelFlag(true);
			if(typeservice.addone(record)>0) request.setAttribute("msg", "添加成功");
			else request.setAttribute("msg", "添加失败");
		}else 
			request.setAttribute("msg", "添加失败");
		return "../back/admintype";
	}
	
	@RequestMapping(value = "/addrole",  method = RequestMethod.POST)
	public String addrole(HttpServletRequest request, HttpServletResponse response ,Model model, @RequestParam(required = false) String rolename) {
		Optional<String> nullobject = Optional.ofNullable(rolename);
		if(nullobject.isPresent()) {
			UserRole record = new UserRole();
			record.setRolename(rolename);
			record.setDelFlag(true);
			if(roleservice.addone(record)>0) request.setAttribute("msg", "添加成功");
			else request.setAttribute("msg", "添加失败");
		}else 
			request.setAttribute("msg", "添加失败");
		return "../back/adminrole";
	}
	
	@RequestMapping(value = "/undodeltype" , method = RequestMethod.GET)
	public String undodeltype(HttpServletRequest request,Model model) throws UnsupportedEncodingException{    
		String strtype= (String) request.getParameter("typeid");
		int typeid=Integer.parseInt(strtype);
		BlogType record = typeservice.findbyid(typeid);
		if(typeservice.undodelete(record)>0) request.setAttribute("msg", "恢复成功");
		else request.setAttribute("msg", "恢复失败");
		return "../back/admintype";
	}
	
	@RequestMapping(value = "/undodelrole" , method = RequestMethod.GET)
	public String undodelrole(HttpServletRequest request,Model model) throws UnsupportedEncodingException{    
		String strrole= (String) request.getParameter("roleid");
		int roleid=Integer.parseInt(strrole);
		UserRole record = roleservice.findbyid(roleid);
		if(roleservice.undodelone(record)>0) request.setAttribute("msg", "恢复成功");
		else request.setAttribute("msg", "恢复失败");
		return "../back/adminrole";
	}
	
	@RequestMapping(value = "/deleteblog" , method = RequestMethod.GET)
	public String delblog(HttpServletRequest request,Model model) throws UnsupportedEncodingException{    
//		String uri=request.getRequestURI();
//		System.out.println(uri);
		String strid= (String) request.getParameter("blogid");
		int blogid=Integer.parseInt(strid);
		Blog record = blogservice.findbyid(blogid);
		if(blogservice.deleteone(record)>0) request.setAttribute("msg", "删除成功");
		else request.setAttribute("msg", "删除失败");
		return "../ms/ms-blog.jsp";
	}
	
	@RequestMapping(value = "/undodelblog" , method = RequestMethod.GET)
	public String undodelblog(HttpServletRequest request,Model model) throws UnsupportedEncodingException{    
		String strid= (String) request.getParameter("blogid");
		int blogid=Integer.parseInt(strid);
		Blog record = blogservice.findbyid(blogid);
		if(blogservice.undodelete(record)>0) request.setAttribute("msg", "恢复成功");
		else request.setAttribute("msg", "恢复失败");
		return "../ms/ms-blog.jsp";
	}
	@RequestMapping(value = "/deletecmt" , method = RequestMethod.GET)
	public String delcmt(HttpServletRequest request,Model model) throws UnsupportedEncodingException{    
//		String uri=request.getRequestURI();
//		System.out.println(uri);
		String strid= (String) request.getParameter("id");
		int id=Integer.parseInt(strid);
		BlogComment record = cmtservice.findbyid(id);
		if(cmtservice.deleteone(record)>0) request.setAttribute("msg", "删除成功");
		else request.setAttribute("msg", "删除失败");
		return "../ms/ms-comment.jsp";
	}
	
	@RequestMapping(value = "/undodelcmt" , method = RequestMethod.GET)
	public String undodelcmt(HttpServletRequest request,Model model) throws UnsupportedEncodingException{    
		String strid= (String) request.getParameter("id");
		int id=Integer.parseInt(strid);
		BlogComment record = cmtservice.findbyid(id);
		if(cmtservice.undodel(record)>0) request.setAttribute("msg", "恢复成功");
		else request.setAttribute("msg", "恢复失败");
		return "../ms/ms-comment.jsp";
	}
}
