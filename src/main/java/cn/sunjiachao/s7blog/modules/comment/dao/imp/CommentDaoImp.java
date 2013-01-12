package cn.sunjiachao.s7blog.modules.comment.dao.imp;

import javax.sql.DataSource;

import cn.sunjiachao.s7common.model.rowmapper.CommentRowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import cn.sunjiachao.s7blog.modules.comment.dao.ICommentDao;
import cn.sunjiachao.s7common.model.Comment;

import java.util.Collections;
import java.util.List;
import java.util.Map;

@Repository(value = "commentDao")
public class CommentDaoImp implements ICommentDao {

    private NamedParameterJdbcTemplate jdbcTemplate;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
    }

    @Override
    public void saveComment(Comment comment) {
        String sql = "insert into s7_comment(title,body,belongTo) value('',:body,:belongTo)";
        SqlParameterSource param = new BeanPropertySqlParameterSource(comment);
        jdbcTemplate.update(sql, param);
    }

    @Override
    public List<Comment> listCommentsByBlog(int blogId) {
        String sql = "select cid,title,body,createTime,belongTo from s7_comment where belongTo = :belongTo";
        Map param = Collections.singletonMap("belongTo", blogId);
        return jdbcTemplate.query(sql, param, new CommentRowMapper());
    }
}
