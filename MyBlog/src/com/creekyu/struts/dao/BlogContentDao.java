package com.creekyu.struts.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.creekyu.struts.form.BlogContentForm;
import com.creekyu.struts.form.BlogUserForm;
import com.creekyu.utils.DBUtil;

public class BlogContentDao {

	// 展示博客列表
	public List searchBlog(int user_id) {
		String sql = "select * from blog_content where user_id= ?";
		Connection conn = null;
		PreparedStatement prestmt = null;
		ResultSet rs = null;
		List blogList = new ArrayList();

		try {
			conn = DBUtil.getConn();
			prestmt = conn.prepareStatement(sql);
			prestmt.setInt(1, user_id);
			rs = prestmt.executeQuery();
			while (rs.next()) {
				BlogContentForm blog = new BlogContentForm();
				blog.setBlog_id(rs.getInt("blog_id"));// id
				blog.setBlog_date(rs.getDate("blog_date"));// 日期
				blog.setBlog_brief(rs.getString("blog_brief"));// 概述
				blog.setBlog_text(rs.getString("blog_text"));// 内容
				blog.setBlog_title(rs.getString("blog_title"));// 标题
				blog.setBlog_category(rs.getString("blog_category"));// 分类
				blogList.add(blog);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(conn);
			DBUtil.closeStmt(prestmt);
			DBUtil.closeRs(rs);
		}
		return blogList;
	}

	// 创作博客
	public BlogContentForm addBlog(BlogContentForm blog) {

		String sql = "insert into blog_content (blog_brief,blog_text,blog_title,blog_category,user_id) values(?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement prestmt = null;
		List userlist = new ArrayList();

		try {
			conn = DBUtil.getConn();
			prestmt = conn.prepareStatement(sql);
			prestmt.setString(1, blog.getBlog_brief());
			prestmt.setString(2, blog.getBlog_text());
			prestmt.setString(3, blog.getBlog_title());
			prestmt.setString(4, blog.getBlog_category());
			prestmt.setInt(5, blog.getUser_id());
			prestmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeStmt(prestmt);
			DBUtil.closeConn(conn);
		}
		return blog;
	}

	// 编辑博客
	public void updateBlog(BlogContentForm blog, int blogid) {

		String sql = "update blog_content set blog_brief=?,blog_text=?,blog_title=?,blog_category=? where blog_id=?";// 修改语句
		Connection conn = null;
		PreparedStatement prestmt = null;

		try {
			conn = DBUtil.getConn();
			prestmt = conn.prepareStatement(sql);
			prestmt.setString(1, blog.getBlog_brief());
			prestmt.setString(2, blog.getBlog_text());
			prestmt.setString(3, blog.getBlog_title());
			prestmt.setString(4, blog.getBlog_category());
			prestmt.setInt(5, blogid);

			prestmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(conn);
			DBUtil.closeStmt(prestmt);
		}
	}

	// 删除博客
	public void delBlog(int blogid) {

		String sql = "delete from blog_content where blog_id = ?";
		Connection conn = null;
		PreparedStatement prestmt = null;

		try {
			conn = DBUtil.getConn();
			prestmt = conn.prepareStatement(sql);
			prestmt.setInt(1, blogid);
			prestmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(conn);
			DBUtil.closeStmt(prestmt);
		}
	}

	// 查看全文
	public BlogContentForm showContent(int blogid) {

		String sql = "select * from blog_content where blog_id=?";
		Connection conn = null;
		PreparedStatement prestmt = null;
		ResultSet rs = null;
		BlogContentForm blog = new BlogContentForm();

		try {
			conn = DBUtil.getConn();
			prestmt = conn.prepareStatement(sql);
			prestmt.setInt(1, blogid);
			rs = prestmt.executeQuery();

			while (rs.next()) {
				blog.setBlog_date(rs.getDate("blog_date"));// 日期
				blog.setBlog_brief(rs.getString("blog_brief"));// 概述
				blog.setBlog_text(rs.getString("blog_text"));// 内容
				blog.setBlog_title(rs.getString("blog_title"));// 标题
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(conn);
			DBUtil.closeStmt(prestmt);
			DBUtil.closeRs(rs);
		}
		return blog;
	}
	
	
	public List searchCategory(String blogCategory,int user_id) {
		String sql = "select * from blog_content where blog_category = ? and user_id = ? ";
		Connection conn = null;
		PreparedStatement prestmt = null;
		ResultSet rs = null;
		List blogList = new ArrayList();
		try {
			conn = DBUtil.getConn();
			prestmt = conn.prepareStatement(sql);
			prestmt.setString(1, blogCategory);
			prestmt.setInt(2, user_id);
			rs = prestmt.executeQuery();

			while (rs.next()) {
				BlogContentForm blog = new BlogContentForm();
				blog.setBlog_id(rs.getInt("blog_id"));// ID
				blog.setBlog_date(rs.getDate("blog_date"));// 日期
				blog.setBlog_brief(rs.getString("blog_brief"));// 概述
				blog.setBlog_text(rs.getString("blog_text"));// 内容
				blog.setBlog_title(rs.getString("blog_title"));// 标题
				blogList.add(blog);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(conn);
			DBUtil.closeStmt(prestmt);
			DBUtil.closeRs(rs);
		}
		return blogList;
	}
	
	
}

