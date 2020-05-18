package com.ishang.beauty.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ishang.beauty.entity.Blog;
import com.ishang.beauty.entity.User;

public interface BlogMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Blog record);

    Blog selectByPrimaryKey(Integer id);

    List<Blog> selectAll();

    int updateByPrimaryKey(Blog record);
    
    /**
     * 自动生成的update
     * 区别于上一个的局部更新
     * */
    int updateByPrimaryKeyfull(Blog record);
    
    /**
     * 模糊查找
     * */
    List<Blog> selectlike(Blog record);
    
	/**
	 * 模糊查找
	 * 推荐列表
	 * */
    List<Blog> selectrec();
    
	/**
	 * 模糊查找up主的blogs
	 * 时间 默认降序
	 * */
    List<Blog> selectuptime(int userid);
    
	/**
	 * 模糊查找up主的blogs
	 * 收藏数 默认降序
	 * */
    List<Blog> selectupstar(int userid);
    
      /**
     * 获取关注up主一周内更新的blog
     * */
    List<Blog> selectlatestblog(int followerid);
    
    /**
     * 模糊查找某up的blog
     * */
    List<Blog> selectuplike(@Param("upid")int upid, @Param("keyword")String keyword);

    /**
     * 获取全部blog
     * 包括被删除的
     * */
	List<Blog> selectrealall();
	
	 /**
     * 获取某up的全部blog
     * 包括被删除的
     * */
	List<Blog> selectupreal(int userid);
    
}