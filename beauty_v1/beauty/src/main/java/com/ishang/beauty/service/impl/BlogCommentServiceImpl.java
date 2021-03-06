package com.ishang.beauty.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ishang.beauty.dao.BlogCommentMapper;
import com.ishang.beauty.dao.UserMapper;
import com.ishang.beauty.entity.BlogComment;
import com.ishang.beauty.entity.User;
import com.ishang.beauty.entity.WholeComment;
import com.ishang.beauty.service.BlogCommentService;

@Service
public class BlogCommentServiceImpl implements BlogCommentService {

	@Autowired
	private BlogCommentMapper dao;
	
	@Autowired
	private UserMapper userdao;
	
	@Override
	public List<BlogComment> findall() {
		return dao.selectAll();
	}

	@Override
	public int addone(BlogComment record) {
		return dao.insert(record);
	}

	@Override
	public int deleteone(BlogComment record) {
		record.setDelFlag(false);
		return updateone(record);
	}

	@Override
	public int updateone(BlogComment record) {
		return dao.updateByPrimaryKey(record);
	}

	@Override
	public BlogComment findbyid(int id) {
		return dao.selectByPrimaryKey(id);
	}

	@Override
	public List<BlogComment> findbyentity(BlogComment record) {
		return dao.selectlike(record);
	}

	@Override
	public List<BlogComment> findcmtlist(int blogid) {
		return dao.selectncmt(blogid);
	}

	@Override
	public List<BlogComment> findallreply(int blogid) {
		// comment的查询评论方法 service层 可能是不完善的方法
		// 查出当前blog下所有楼中楼
		List<BlogComment> replylist=dao.selectallreply(blogid);
		return replylist;
	}
	
	@Override
	public List<BlogComment> findreply(int blogid, int cmtid) {
		// comment的查询评论方法 service层 可能是不完善的方法
		// 查出当前normal cmt下所有reply
		List<BlogComment> replylist=dao.selectreply(blogid, cmtid);
		if(replylist.size()>0) return replylist;
		else return new ArrayList<BlogComment>();
	}
	
	@Override
	public List<BlogComment> getonecmtreply(int ncmtid) {
		
		List<BlogComment> rstlist= new ArrayList<BlogComment>();
		List<BlogComment> templist= new ArrayList<BlogComment>();
		
		BlogComment originalcmt = dao.selectByPrimaryKey(ncmtid);
		int blogid = originalcmt.getBlogid();
		
		templist=gettemplist(blogid, ncmtid);  //ncmt 的 一层 reply
		rstlist.addAll(templist);
		for(int i=0; i<rstlist.size(); i++) {
			BlogComment tempcmt=rstlist.get(i);
			System.out.println(tempcmt);
			int cmtid=tempcmt.getId();
			templist=gettemplist(blogid, cmtid);
			rstlist.addAll(templist);
		}
		
		return rstlist;
	}
	
	public List<BlogComment> gettemplist(int blogid, int ncmtid){
		return dao.selectreply(blogid, ncmtid);
	}

	@Override
	public WholeComment getwholecomment(int blogid) {
		
		WholeComment wholecmt= new WholeComment();

		// get cmt num
		wholecmt.setCmtnum(dao.getblogcmt(blogid));
		
		// get normal cmt
		wholecmt.setNormalcmt(findcmtlist(blogid));
		
		// get reply map
		Map<Integer, List<BlogComment>> replymap= new HashMap<Integer, List<BlogComment>>();
		Map<Integer,User> cmtermap=new HashMap<Integer, User>();
		for(BlogComment ncmt: wholecmt.getNormalcmt()) {
//			cmtermap.put(ncmt.getUserid(), userdao.selectByPrimaryKey(ncmt.getUserid()).get(0).getUsername());
			cmtermap.put(ncmt.getUserid(), userdao.selectByPrimaryKey(ncmt.getUserid()).get(0));
			replymap.put(ncmt.getId(),  getonecmtreply(ncmt.getId()));
		}	
		
		wholecmt.setReplymap(replymap);
		// get cmter
		for(List<BlogComment> collection:replymap.values()) {
			for(BlogComment rcmt:collection) {
//				cmtermap.put(rcmt.getUserid(), userdao.selectByPrimaryKey(rcmt.getUserid()).get(0).getUsername());
				cmtermap.put(rcmt.getUserid(), userdao.selectByPrimaryKey(rcmt.getUserid()).get(0));
			}
		}
		wholecmt.setCmtermap(cmtermap);
		
		return wholecmt;
	}

	@Override
	public int getupcmtnum(int upid) {
		return dao.getusercmtnum(upid);
	}

	@Override
	public List<BlogComment> getuplike(BlogComment record) {
		return Optional.ofNullable(record.getComment()).map(rst->dao.getupcmtlike(record)).orElse(getupreal(record.getUserid()));
//		Optional<String> nullobject = Optional.ofNullable(record.getComment());
		//return Optional.ofNullable(s).map(sl->sl.name).orElse("is Null");
//		List<BlogComment> rst = new ArrayList<BlogComment>();
		//if(record.getComment()!=null || record.getComment()!="") 
//		if(nullobject.isPresent())
//			rst = dao.getupcmtlike(record);
//		else 
//			rst = dao.getupcmt(record.getUserid());
//		return rst;
	}

	@Override
	public List<BlogComment> getrealall() {
		return dao.selectrealall();
	}

	@Override
	public List<BlogComment> getupreal(int userid) {
		return dao.selectupreal(userid);
	}

	@Override
	public int undodel(BlogComment record) {
		record.setDelFlag(true);
		return updateone(record);
	}

}
