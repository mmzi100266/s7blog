package cn.sunjiachao.s7blog.modules.blog.dao.imp;

import cn.sunjiachao.s7blog.modules.blog.dao.IBlogDao;
import cn.sunjiachao.s7common.model.Blog;
import cn.sunjiachao.s7common.model.dto.BlogBodyDto;
import cn.sunjiachao.s7common.model.dto.BlogShortBodyDto;
import cn.sunjiachao.s7common.model.rowmapper.BlogBodyDtoRowMapper;
import cn.sunjiachao.s7common.model.rowmapper.BlogShortBodyDtoRowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
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
    public List<BlogShortBodyDto> getAllBlogList() {
        String sql = "select b.blogId,b.title,b.shortBody,b.createTime,u.loginName from s7_blog as b inner join s7_user as u where b.createUser = 1;";
        List<BlogShortBodyDto> blogs = jdbcTemplate.query(sql, new HashMap<String, Object>(), new BlogShortBodyDtoRowMapper());
        return blogs;
    }

    @Override
    public BlogBodyDto getBlog(int id) {
//        String sql = "select b.blogId,b.title,b.body,u.createTime,u.loginName from s7_user as u join " +
//                "(select blogId,title,body,createTime,createUser from s7_blog where blogId=2) as b where b.createUser=u.uid";
        String sql = "select u.loginName,u.createTime,b.title,b.body,b.blogId from s7_user as u," +
                "(select blogId,title,body,createTime,createUser from s7_blog where blogId=:blogId) as b " +
                "where b.createUser = u.uid;";
        SqlParameterSource p = new MapSqlParameterSource("blogId", id);
        return jdbcTemplate.queryForObject(sql, p, new BlogBodyDtoRowMapper());
    }
}
