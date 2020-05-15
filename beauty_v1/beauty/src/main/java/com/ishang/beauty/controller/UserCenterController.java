package com.ishang.beauty.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.ishang.beauty.entity.User;
import com.ishang.beauty.entity.UserFollow;
import com.ishang.beauty.service.impl.UserServiceImpl;

/**
 * 
 * @author 24466 修改头像，修改密码，更改个人信息，获取关注数和关注列表， 获取粉丝数和粉丝列表，获取收藏blog数量与列表
 */
@Controller

@RequestMapping("/center")
public class UserCenterController {
	@Autowired
	private UserServiceImpl service;

	// 修改头像
	/* delete date: 0515
	 * @RequestMapping("/toupdateimg") public String updateImg() { return
	 * "updateimg.jsp"; }
	 */

	// 头像上传
	@RequestMapping("/upload")
	public String upload(User user, HttpServletRequest request, Model model) throws IllegalStateException, IOException {
		// 保存数据库的路径
		String sqlPath = null;
		// 定义文件保存的本地路径
		// fbw: "D:\\git\\repository\\beauty\\beauty_v1\\beauty\\src\\main\\webapp\\images\\userimg"
//		String localPath = "C:\\Users\\24466\\Documents\\GitHub\\beauty\\beauty_v1\\beauty\\src\\main\\webapp\\images\\userimg\\";
		//String localPath =  "D:\\git\\repository\\beauty\\beauty_v1\\beauty\\src\\main\\webapp\\images\\userimg";
		
		String tomcatpath=System.getProperty("catalina.home");
		String addpath="\\webapps\\beauty\\images\\userimg\\";
		String localPath=tomcatpath+addpath;

		// 定义文件名
		String filename = null;
		if (!user.getFile().isEmpty()) {
			// 生成uuid作为文件名称
			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
			// 获得文件类型（可以判断如果不是图片，禁止上传）
			String contentType = user.getFile().getContentType();
			// 获得文件后缀名
			String suffixName = contentType.substring(contentType.indexOf("/") + 1);
			// 得到 文件名
			filename = uuid + "." + suffixName;
			System.out.println(filename);
			// 文件保存路径
			user.getFile().transferTo(new File(localPath + filename));
		}
		// 把图片的相对路径保存至数据库
		sqlPath = "images/userimg/" + filename;
		System.out.println(sqlPath);
		user.setProfileimg(sqlPath);

		service.updateImg(user);
		//model.addAttribute("image", user);
		return "user/user_setting.jsp";
	}
	
	//跳转到个人中心
	@RequestMapping("/tocenter")
	public String tocenter(Model model) {
		return "usercenter.jsp";
	}

	// 获取查询到的头像
	@RequestMapping("/getpic")
	public String getPic(@RequestParam Integer id, HttpSession session) {

		String getpic = service.selectImg(id);
		System.out.println(getpic);
		session.setAttribute("getpic", getpic);
		// model.addAttribute("getpic", getpic);
		return "usercenter.jsp";
	}

	@RequestMapping("/getpic2")
	public String getPic2(@RequestParam Integer id, HttpSession session) {
		String getpic2 = service.selectImg(id);
		System.out.println(getpic2);
		session.setAttribute("getpic2", getpic2);
		// model.addAttribute("getpic", getpic);
//		return "index.jsp";
		return "../index";
	}
	
	@RequestMapping("/getpic3")
	public String getPic3(@RequestParam Integer id, HttpSession session) {
		String getpic3 = service.selectImg(id);
		System.out.println(getpic3);
		session.setAttribute("getpic3", getpic3);
		// model.addAttribute("getpic", getpic);
		return "uploader.jsp";
	}
	// 修改密码
	@RequestMapping(value = "/modifypwd",method = RequestMethod.POST)
	public String ModifyPwd(@RequestBody User user) {
//		user.setDel_flag(1);
//		user.setRoleid(2);
//		System.out.println(user.getBirthday());
		System.out.println(user);
//		System.out.println("以上为user内容，包含id和password");
		service.updatepswd(user);
		//TODO 将新密码存入cookie中
		return "usercenter.jsp";

	}

	//修改用户信息
	@RequestMapping(value = "/updateInfo" ,method = RequestMethod.POST)
	public String UpdateInfo(@RequestBody User user) throws ParseException {
		user.setDel_flag(1);	
		System.out.println(user);
		service.updateone(user);
		return "index.jsp";
	}
	
	@ResponseBody
	@RequestMapping(value = "/loaduserinfo", method = RequestMethod.POST)
	public Map<String, User> loaduserinfo(@RequestParam("userid") String str_userid) {
		Map<String, User> map = new HashMap<String, User>();
		int userid=1;
		if(!( str_userid ==null || str_userid.isEmpty())) userid=Integer.parseInt(str_userid);
		User result = service.selectbyid(userid).get(0);
		map.put("cuser",result);
		return map;
	}
		
	//转到user_info.jsp
	@RequestMapping("/toinfo")
	public String ToInfo() {
		return "user/user_info.jsp";
	}
	
	//转到user_setting.jsp
	@RequestMapping("/tosetting")
	public String ToSetting() {
		return "user/user_setting.jsp";	
	}
	
	@RequestMapping("/tolove")
	public String Tolove() {
		return "user/user_love.jsp";
	}
	
	// 获取关注数

	// 获取关注列表
	@RequestMapping("/user_follow")
	public String followList(@RequestParam Integer followerid,HttpServletRequest request, Model model) {
		int fcount = service.followcount(followerid);
		System.out.println(fcount);

		List<UserFollow> flist = service.followList(followerid);
		model.addAttribute("fcount", fcount);
		model.addAttribute("flist", flist);
		//request.setAttribute("flist", flist);
		//list本身就是一个列表
		//System.out.println(flist);

		return "user/user_follow.jsp";
	}
	
	@RequestMapping("/uploader")
	public String Uploader(@RequestParam Integer uploaderid,Model model) {
		int fan=service.fancount(uploaderid);
		System.out.println(fan);
		//List<UserFollow> fanlist=service.FanList(uploaderid);
		List<User> uplist=service.selectbyid(uploaderid);
		//System.out.println(fanlist);
		System.out.println(uplist);
		model.addAttribute("fan", fan);
		//model.addAttribute("fanlist", fanlist);
		model.addAttribute("uplist", uplist);

		return "uploader.jsp";

	}
	
	//通过用户id查询password，用于修改密码(user_setting)
	@ResponseBody
	@RequestMapping("/findpwd")
	public Map<String, Object> findpwd(@RequestParam Integer id,HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<User> list=service.findbyid(id);
		String pwd=list.get(0).getPassword();
		map.put("pwd", pwd);
		return map;
	}
	/*   ljt
	 * public String findpwd(@RequestParam Integer id,HttpSession session) {
	 * List<User> list=service.findbyid(id); String pwd=list.get(0).getPassword();
	 * session.setAttribute("pwd", pwd); return "user/user_setting.jsp"; }
	 */
	
	//将结果放到uploaderFanList中
	@RequestMapping("/upfanlist")
	public String upfanlist(@RequestParam Integer id,Model model) {
		int fan=service.fancount(id);
		System.out.println(fan);
		List<UserFollow> fanlist=service.FanList(id);
		List<User> uplist=service.selectbyid(id);
		System.out.println(fanlist);
		System.out.println(uplist);
		model.addAttribute("fan", fan);
		model.addAttribute("fanlist", fanlist);
		model.addAttribute("uplist", uplist);
		return "uploaderFanList.jsp";
	}
	
	// 关注功能前，判断是否关注
	@RequestMapping("/subscribe")
	public String subscribe(@RequestParam Integer followerid, @RequestParam Integer uploaderid, Model model,
			HttpSession session) {
		// 传入两个id，followerid-关注>uploaderid
		// 判断是否已经关注
		List<UserFollow> sub = service.Subscribe(followerid, uploaderid);
		/*
		 * if(sub==null) { //未关注的话，插入新的关注信息 int count=service.subinsert(followerid,
		 * uploaderid); System.out.println(count); }
		 */
		String text = "";
		if (sub.isEmpty())
			text = "未关注";
		else {
			text = "已关注";
		}
		System.out.println(text);
		session.setAttribute("text", text);
		session.setAttribute("sub", sub);

		System.out.println(sub);
		return "uploader.jsp";
	}

	// followerid不变，uploaderid应该从遍历的列表中取，只是返回两个不同的页面(似乎不能共用一个)
	@RequestMapping("/subscribelist")
	public String subscribe1(@RequestParam Integer followerid, Integer[] arr, Model model, HttpSession session) {
		// 传入两个id，followerid-关注>uploaderid
		// 判断是否已经关注

		System.out.println("arr值为" + arr);
		int uploaderid=0;
		String []arr2 = new String[arr.length];
		
		for(int i=0;i<arr.length;i++ ) {
		         uploaderid=arr[i];
		List<UserFollow> sub = service.Subscribe(followerid, uploaderid);
		// 如果未关注->text=1,关注->text=2
		System.out.println(sub);
		String text1;
		if (sub.isEmpty())
			text1 = "未关注";
		else {
			text1 = "已关注";
		}
	
		arr2[i]=text1;
		}
		System.out.println(arr2);
		
		session.setAttribute("arr2", arr2);
		
		return "uploaderFanList.jsp";

	}

	// 如果是未关注->，调用此接口
	@RequestMapping("/subinsert")
	public String subins(@RequestParam Integer followerid, @RequestParam Integer uploaderid, Model model,
			HttpSession session) {
		int ins = service.subinsert(followerid, uploaderid);
		model.addAttribute("success", "已成功关注");
		return "uploader.jsp";

	}

	// 同上，用于fanlist
	@RequestMapping("/subinsert1")
	public String subins1(@RequestParam Integer followerid, @RequestParam Integer uploaderid, Model model,
			HttpSession session) {

		// 判断是否已经关注
		List<UserFollow> sub = service.Subscribe(followerid, uploaderid);
		String msg = "";
		if (sub.size() != 0) {
			msg = "您已经关注该用户";
			System.out.println(msg);
		} else {
			int ins = service.subinsert(followerid, uploaderid);
			msg = "关注成功";
		}
		session.setAttribute("msg", msg);

		return "uploaderFanList.jsp";

	}

	// 如果是已经关注->取消关注，调用此接口,需要参数:2个
	@RequestMapping("/subdelete")
	public String subdel(@RequestParam Integer followerid, @RequestParam Integer uploaderid, Model model,
			HttpSession session) {
		int del = service.subdelete(followerid, uploaderid);
		// sql语句执行之后，返回uploader.jsp时会自动判断（自我认为）
		model.addAttribute("success", "已取消关注");
		return "uploader.jsp";

	}

	// 如果是已经关注->取消关注，调用此接口,需要参数:2个
	@RequestMapping("/subdelete1")
	public String subdel1(@RequestParam Integer followerid, @RequestParam Integer uploaderid, Model model,
			HttpSession session) {
		int del = service.subdelete(followerid, uploaderid);
		// sql语句执行之后，返回uploader.jsp时会自动判断（自我认为）
		model.addAttribute("success", "已取消关注");
		return "uploaderFanList.jsp";

	}
}
