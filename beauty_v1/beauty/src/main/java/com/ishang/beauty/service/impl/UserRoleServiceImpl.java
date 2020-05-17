package com.ishang.beauty.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ishang.beauty.dao.UserRoleMapper;
import com.ishang.beauty.entity.BlogType;
import com.ishang.beauty.entity.UserRole;
import com.ishang.beauty.service.UserRoleService;

@Service
public class UserRoleServiceImpl implements UserRoleService {

	@Autowired
	private UserRoleMapper dao;
	
	@Override
	public List<UserRole> findall() {
		return dao.selectAll();
	}

	@Override
	public int addone(UserRole record) {
		return dao.insert(record);
	}

	@Override
	public int deleteone(UserRole record) {
		record.setDelFlag(false);
		return updateone(record);
	}

	@Override
	public int updateone(UserRole record) {
		return dao.updateByPrimaryKey(record);
	}

	@Override
	public UserRole findbyid(int roleid) {
		return dao.selectByPrimaryKey(roleid);
	}

	@Override
	public List<UserRole> findres() {
		return dao.selectres();
	}

	@Override
	public int undodelone(UserRole record) {
		record.setDelFlag(true);
		return updateone(record);
	}

}
