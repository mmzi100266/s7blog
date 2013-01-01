package cn.sunjiachao.s7blog.modules.blog.dao.imp;

import cn.sunjiachao.s7blog.modules.blog.dao.IBlogDao;
import cn.sunjiachao.s7common.exception.DataBaseException;
import cn.sunjiachao.s7common.model.Blog;
import cn.sunjiachao.s7common.model.dto.BlogDto;
import cn.sunjiachao.s7common.model.rowmapper.BlogDtoRowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

@Repository(value = "blogDao")
public class BlogDaoImp implements IBlogDao {

    private NamedParameterJdbcTemplate jdbcTemplate;
    private SimpleJdbcInsert jdbcInsert;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
        this.jdbcInsert = new SimpleJdbcInsert(dataSource).withTableName("s7_blog").usingGeneratedKeyColumns("blogId");
    }

    @Override
    public int saveBlog(Blog blog) throws RuntimeException {
        SqlParameterSource params = new BeanPropertySqlParameterSource(blog);
        Number id = jdbcInsert.executeAndReturnKey(params);
        return id.intValue();
    }

    @Override
    public List<BlogDto> getAllBlogList() {
        String sql = "select b.blogId,b.title,b.shortBody,b.createTime,u.loginName from s7_blog as b inner join s7_user as u where b.createUser = 1;";
        List<BlogDto> blogs = jdbcTemplate.query(sql, new HashMap<String, Object>(), new BlogDtoRowMapper());
        return blogs;
    }

    @Override
    public BlogDto getBlog(int id) {
        String sql = "select b.blogId,b.title,b.body,b.createTime,u.loginName from s7_user as u inner join " +
                "(select title,body,createTime,createUser from s7_blog where blogId=:blogId) as b where b.createUser=u.uid";
        SqlParameterSource p = new MapSqlParameterSource("blogId", id);
        //return jdbcTemplate.queryForObject(sql, p, new BlogDtoRowMapper());
        jdbcTemplate.update(sql,p);
        return null;
    }
}
