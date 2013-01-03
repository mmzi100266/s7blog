package cn.sunjiachao.s7blog.modules.user.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.sunjiachao.s7blog.modules.user.dao.IUserDao;
import cn.sunjiachao.s7blog.modules.user.service.IUserService;
import cn.sunjiachao.s7common.exception.LoginFailedException;
import cn.sunjiachao.s7common.model.User;

@Service(value = "userService")
public class UserServiceImp implements IUserService {

	@Autowired
	private IUserDao userDao;

	@Override
	public int loginByNameAndPassword(User user) throws LoginFailedException {
		int result = userDao.getUserByNameAndPassword(user);
		if (result == 0) {
			throw new LoginFailedException("用户名或密码验证错误");
		}
		return result;
	}

}
