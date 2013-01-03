package cn.sunjiachao.s7blog.modules.user.dao;

import cn.sunjiachao.s7common.model.User;

public interface IUserDao {

	public int getUserByNameAndPassword(User user);

}
