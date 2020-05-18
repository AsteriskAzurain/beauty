package com.ishang.beauty.dao;

import com.ishang.beauty.entity.User;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    int deleteByPrimaryKey(@Param("id") Integer id, @Param("username") String username);

	int insert(User record);

	User selectByPrimaryKey(@Param("id") Integer id, @Param("username") String username);

	List<User> selectAll();

	int updateByPrimaryKey(User record);

	int deleteByPrimaryKey(Integer id);

	int insert(User record);

	User selectByPrimaryKey(Integer id);

	List<User> selectAll();

	int updateByPrimaryKey(User record);

	int deleteByPrimaryKey(@Param("id") Integer id, @Param("username") String username);

	int insert(User record);

	User selectByPrimaryKey(@Param("id") Integer id, @Param("username") String username);

	List<User> selectAll();

	int updateByPrimaryKey(User record);

	int deleteByPrimaryKey(@Param("id") Integer id, @Param("username") String username);

	int insert(User record);

	User selectByPrimaryKey(@Param("id") Integer id, @Param("username") String username);

	List<User> selectAll();

	int updateByPrimaryKey(User record);

	int insert(User record);

    List<User> selectAll();
}