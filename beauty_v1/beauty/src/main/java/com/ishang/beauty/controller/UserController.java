package com.ishang.beauty.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ishang.beauty.entity.User;
import com.ishang.beauty.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService service;

//	@GetMapping("/getAll")
//	public  DataResponse getAll() {
//		DataResponse response = new DataResponse();
//		List<User> result = service.findall();
//		return response.success(result);
//	}

	@RequestMapping("/userList")
	public ModelAndView findall(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
		// 第pn页显示五行数据
		PageHelper.startPage(pn, 5);
		List<User> uList = service.findall();
		PageInfo<User> page = new PageInfo<User>(uList, 5);
		/*
		 * 测试page中的参数 System.out.println("页码数:"+page.getPageNum());
		 * System.out.println("总页码:"+page.getPages());
		 * System.out.println("总条数:"+page.getTotal());
		 * System.out.println(page.getNavigatePages());
		 *
		 *
		 * for(User u : list) {
		 * System.out.println("id:"+u.getId()+"name:"+u.getUsername());
		 * 
		 * }
		 */
		/*
		 * int []num=page.getNavigatepageNums(); for(int i:num) {
		 * 
		 * System.out.println(" "+i); } for(User u : list) {
		 * System.out.println("id:"+u.getId()+"name:"+u.getUsername());
		 * 
		 * }
		 */

		ModelAndView mv = new ModelAndView("backuserList");
		mv.addObject("pageInfo", page);
		return mv;
	}

	@RequestMapping("/login")
	public String login(@RequestParam("username") String username, @RequestParam("password") String password,
			Model model, HttpServletRequest request, HttpServletResponse response) {
		User record = new User();
		record.setUsername(username);
		record.setPassword(password);
		// 判断是否记住密码
		Boolean re = false;
		String checkboxNum = request.getParameter("checkboxNum");
		if (checkboxNum != null) {
			if (checkboxNum.equals("on"))
				re = true;
		}

		List<User> result = service.findbyentity(record);
		if (result.size() > 0 && result.get(0).getPassword().equals(password)) {
			// 设置session
			HttpSession session = request.getSession();
			session.setAttribute("SESSION_UserName", result.get(0).getUsername());
			session.setAttribute("SESSION_PassWord", result.get(0).getPassword());
			// 由于CookieVersion 0不支持逗号，因此换成#号
			String loginInfo = result.get(0).getUsername() + "#" + result.get(0).getPassword() + "#"
					+ result.get(0).getId();
			// 如果记住密码设置cookie
			if (re) {
				Cookie userCookie = new Cookie("user", loginInfo);
				// 设置保存7天cookie
				userCookie.setMaxAge(7 * 24 * 60 * 60);
				userCookie.setPath("/");
				response.addCookie(userCookie);
			} else {// 没有选中记住密码，删除cookie
				Cookie newCookie = new Cookie("user", null);
				newCookie.setMaxAge(0);
				newCookie.setPath("/");
				// 覆盖之前的userCookie
				response.addCookie(newCookie);
			}

			return "index";
		} else {
			model.addAttribute("errMsg", "用户名或密码错误，请重新输入");

			return "login";
		}
	}

	//
	@RequestMapping("/tologin")
	public String tologin() {
		return "login";

	}

	@RequestMapping("/toregist")
	public String toadd() {
		return "regist";

	}

	// ajax传json值传到后端

	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	// @ResponseBody

	public ModelAndView adduser(@RequestBody User u) {
		// 判断username,password,roleid是否为空
		System.out.println("进入注册");
		ModelAndView mv = new ModelAndView();
		if (u.getUsername().equals(null) || u.getPassword().equals(null) || u.getRoleid().equals(null)) {
			// 已经在前端验证
			// mv.addObject("errMsg", "请填入必填字段");
			mv.setViewName("regist");
			return mv;
		} else {
			u.setDel_flag(1);
			int r = service.addone(u);
			// mv.addObject("success", "注册成功");
			mv.setViewName("login");
			return mv;
		}
	}

	// 登出
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "login";

	}

}
