package com.ishang.beauty.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ishang.beauty.entity.BlogType;
import com.ishang.beauty.entity.UserRole;

@Service
public interface UserRoleService {

	List<UserRole>  findall();
	
	int addone(UserRole record);
	
	int deleteone(UserRole record);
	
	int updateone(UserRole record);

	UserRole findbyid(int roleid);

	List<UserRole> findres();
	
	int undodelone(UserRole record);
}
