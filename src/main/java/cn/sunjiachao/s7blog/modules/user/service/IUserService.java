package cn.sunjiachao.s7blog.modules.user.service;

import cn.sunjiachao.s7common.exception.LoginFailedException;
import cn.sunjiachao.s7common.model.User;

public interface IUserService {
	
	public int loginByNameAndPassword(User user) throws LoginFailedException;

}
