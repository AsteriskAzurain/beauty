package com.ishang.beauty.dao;

import com.ishang.beauty.entity.UserRole;
import java.util.List;

public interface UserRoleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserRole record);

    UserRole selectByPrimaryKey(Integer id);

    List<UserRole> selectAll();

    int updateByPrimaryKey(UserRole record);

	List<UserRole> selectres();
}