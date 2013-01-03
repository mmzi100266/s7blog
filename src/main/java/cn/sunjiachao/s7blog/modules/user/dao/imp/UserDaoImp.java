package cn.sunjiachao.s7blog.modules.user.dao.imp;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import cn.sunjiachao.s7blog.modules.user.dao.IUserDao;
import cn.sunjiachao.s7common.model.User;

@Repository(value = "userDao")
public class UserDaoImp implements IUserDao {

	private NamedParameterJdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
	}

	@Override
	public int getUserByNameAndPassword(User user) {
		String sql = "select u.uid from (select uid,loginName,password from s7_user where loginName=:loginName and password=:password) as u";
		SqlParameterSource p = new BeanPropertySqlParameterSource(user);
		int result;
		try {
			result = jdbcTemplate.queryForInt(sql, p);
		} catch (EmptyResultDataAccessException e) {
			return 0;
		}
		return result;
	}

}
