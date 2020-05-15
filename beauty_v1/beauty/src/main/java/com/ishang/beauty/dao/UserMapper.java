package com.ishang.beauty.dao;

import com.ishang.beauty.entity.User;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface UserMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(User record);

	List<User> selectByPrimaryKey(Integer id);

	List<User> selectAll();

	int updateByPrimaryKey(User record);
	
	int updateByPrimaryKeyPlus(User record);

	/**
	 * 模糊查找
	 * */
	List<User> selectlike(User record);
	
	/**
	 * 修改个人头像
	 */
	int updateImg(User record);
	
	String selectImg(Integer id);
	
	/**
	 * 模糊查找(正式)
	 */
	List<User> selectLike(String username);
	
    /**
     * 获取一周内有更新的关注up主
     * */
    List<User> selectlatestup(int followerid);
    
    /**
     * 仅修改password
     * */
    int updatepswd(@Param("userid")int userid, @Param("pswd")String pswd);
	
    /**
     * 后台简易的登陆验证
     * */
    List<User> backlogin(@Param("username")String username, @Param("password")String password);
}