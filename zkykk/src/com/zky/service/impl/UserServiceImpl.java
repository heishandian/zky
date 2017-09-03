package com.zky.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zky.dao.UserMapper;
import com.zky.service.IUserService;
import com.zky.vo.User;

@Service("userService")
public class UserServiceImpl implements IUserService {
	@Resource
	private UserMapper userMapper;

	@Override
	public User getUserByName(String name) {
		return userMapper.getUserByName(name);
	}

}
