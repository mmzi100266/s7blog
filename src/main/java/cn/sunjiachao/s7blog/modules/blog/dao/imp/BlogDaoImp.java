package cn.sunjiachao.s7blog.modules.blog.dao.imp;

import cn.sunjiachao.s7blog.modules.blog.dao.IBlogDao;
import cn.sunjiachao.s7common.model.Blog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;

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
    public int saveBlog(Blog blog) {
//        String sql = "INSERT INTO s7_blog(title,body,createTime,createUser) VALUES(:title,:body,:createTime,:createUser)";
        SqlParameterSource params = new BeanPropertySqlParameterSource(blog);
        Number id = jdbcInsert.executeAndReturnKey(params);
        return id.intValue();
    }
}
