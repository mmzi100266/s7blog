package cn.sunjiachao.s7blog.modules.blog.dao.imp;

import cn.sunjiachao.s7blog.modules.blog.dao.IBlogDao;
import cn.sunjiachao.s7common.exception.DataBaseException;
import cn.sunjiachao.s7common.model.Blog;
import cn.sunjiachao.s7common.model.dto.BlogDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
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
        List<BlogDto> blogs = jdbcTemplate.query(sql, new HashMap<String, Object>(), new RowMapper<BlogDto>() {
            @Override
            public BlogDto mapRow(ResultSet resultSet, int i) throws SQLException {
                BlogDto bd = new BlogDto();
                bd.setBlogId(resultSet.getInt("blogId"));
                bd.setTitle(resultSet.getString("title"));
                bd.setShortBody(resultSet.getString("shortBody"));
                bd.setCreateTime(resultSet.getDate("createTime"));
                bd.setLoginName(resultSet.getString("loginName"));
                return bd;
            }
        });
        return blogs;
    }
}
