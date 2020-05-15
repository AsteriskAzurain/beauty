package com.ishang.beauty.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.Charsets;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ishang.beauty.entity.Blog;
import com.ishang.beauty.entity.User;
import com.ishang.beauty.service.BlogCommentService;
import com.ishang.beauty.service.BlogService;
import com.ishang.beauty.service.BlogTypeService;
import com.ishang.beauty.service.UserService;

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
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String backlogin(@RequestParam("username") String username,@RequestParam("password") String password,
			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		String stores[] = request.getParameterValues("reb");
		//System.out.println(stores);
		Boolean re= true;
		if(stores==null) re=false;
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);		
		
		List<User> result = userservice.backlogin(user);
		if (result.size() > 0 ) {
			// 设置session
			HttpSession session = request.getSession();
			session.setAttribute("SESSION_UserName", result.get(0).getUsername());
			session.setAttribute("SESSION_PassWord", result.get(0).getPassword());
			String loginname = URLEncoder.encode(result.get(0).getUsername(), String.valueOf(Charsets.UTF_8));
			loginname=loginname.replaceAll("\\+", "%20");
			System.out.println(loginname);
			String loginInfo = loginname + "#" + result.get(0).getPassword() + "#" + result.get(0).getId();
			String loginInfo2 = loginname + "#" +'1'+ "#" + result.get(0).getId();
			// 如果记住密码设置cookie
			if (re) {
				Cookie userCookie = new Cookie("user", loginInfo.toString());
				// 设置保存7天cookie
				userCookie.setMaxAge(7 * 24 * 60 * 60);
				userCookie.setPath("/");
				response.addCookie(userCookie);
			} else {// 没有选中记住密码，删除cookie
				Cookie newCookie = new Cookie("user", loginInfo2.toString());
				newCookie.setMaxAge(7 * 24 * 60 * 60);
				newCookie.setPath("/");
				// 覆盖之前的userCookie
				response.addCookie(newCookie);
			}
			int roleid = result.get(0).getRoleid();
			if(roleid==1) {  //admin
				request.setAttribute("role", "admin");
				return "../ms/ms-user.jsp"; 
			}
			else if(roleid==2) return "../index";
			else {  //uploader
				request.setAttribute("role", "uploader");
				return "../ms/ms-blog.jsp"; 
			}
		} else {
			request.setAttribute("msg", "用户名或密码错误，请检查后再试。");
			return "../ms/login.jsp";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public Map<String, Object> backsearch(@RequestParam("keyword") String keyword) throws UnsupportedEncodingException {
		Map<String, Object> map = new HashMap<String, Object>();
		keyword=URLDecoder.decode(keyword, "UTF-8");
		System.out.println(keyword);
		Blog record = new Blog();
		record.setTitle(keyword);
		List<Blog> rstlist=blogservice.findbyentity(record);
		
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
	
}
