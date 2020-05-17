package com.ishang.beauty.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ishang.beauty.entity.BlogComment;
import com.ishang.beauty.entity.WholeComment;

@Service
public interface BlogCommentService {

	/**
	 * 查询所有
	 * */
	List<BlogComment> findall();
	
	/**
	 * 添加
	 * */
	int addone(BlogComment record);
	
	/**
	 * 逻辑删除
	 * */
	int deleteone(BlogComment record);
	
	/**
	 * 恢复一条数据
	 * */
	int undodel(BlogComment record);
	
	/**
	 * 修改评论
	 * 没有修改功能
	 * */
	int updateone(BlogComment record);
	
	/**
	 * 精确查找
	 * */
	BlogComment findbyid(int id);
	
	/**
	 * 模糊查找
	 * */
	List<BlogComment> findbyentity(BlogComment record);
	
	/**
	 * 查找普通评论
	 * 排除楼中楼
	 * */
	List<BlogComment> findcmtlist(int blogid);
	
	/**
	 * 查找楼中楼
	 * */
	List<BlogComment> findreply(int blogid, int cmtid);
	
	/**
	 * 查找某blog的所有reply
	 * */
	List<BlogComment> findallreply(int blogid);
	
	/**
	 * 返回某normal cmt的reply集合
	 * ncmtid: normal cmt 
	 * */
	public List<BlogComment> getonecmtreply(int ncmtid) ;
	
	/**
	 * 集成所有get cmt&reply的操作
	 * */
	public WholeComment getwholecomment(int blogid);
	
	/**
	 * 获取某user的总获评数
	 * */
	public int getupcmtnum(int upid);
	
	/**
     * 模糊查找某up收到的评论
     * */
    List<BlogComment> getuplike(BlogComment record);
    
    /**
     * 获取全部comment
     * 包括被删除的
     * */
	List<BlogComment> getrealall();
	
	 /**
     * 获取某up的全部comment
     * 包括被删除的
     * */
	List<BlogComment> getupreal(int userid);
}
