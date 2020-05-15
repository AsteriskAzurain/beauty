package com.ishang.beauty.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ishang.beauty.entity.UserFollow;

public interface UserFollowMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserFollow record);

    UserFollow selectByPrimaryKey(Integer id);

    List<UserFollow> selectAll();

    int updateByPrimaryKey(UserFollow record);
    
    //获取关注数
    int selectFollowCount(Integer followerid);
    
    //获取关注列表
    List<UserFollow> selectFollowList(Integer followerid);
	
    //获取粉丝数
    int selectFanCount(Integer uploaderid);
    
    //获取粉丝列表
    List<UserFollow> selectFanList(Integer uploaderid);
    
    //判断订阅,多参数需要加@Param
    List<UserFollow> subscribe(@Param("followerid") Integer followerid,@Param("uploaderid") Integer uploaderid);
    //导入关注
    int subinsert(@Param("followerid") Integer followerid,@Param("uploaderid") Integer uploaderid);
    
    int subdelete(@Param("followerid") Integer followerid,@Param("uploaderid") Integer uploaderid);
 
}