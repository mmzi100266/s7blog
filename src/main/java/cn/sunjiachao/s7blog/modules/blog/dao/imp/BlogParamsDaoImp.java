package cn.sunjiachao.s7blog.modules.blog.dao.imp;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import cn.sunjiachao.s7blog.modules.blog.dao.IBlogParamsDao;
import cn.sunjiachao.s7common.model.BlogParams;

@Repository(value = "blogParamsDao")
public class BlogParamsDaoImp implements IBlogParamsDao {

    private NamedParameterJdbcTemplate jdbcTemplate;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
    }


    @Override
    public void saveBlogParams(BlogParams blogParams) {
        String sql = "INSERT INTO s7_blog_params(postIp,commentCount,blogId) VALUES(:postIp,:commentCount,:blogId)";
        SqlParameterSource params = new BeanPropertySqlParameterSource(blogParams);
        jdbcTemplate.update(sql, params);
    }
}
