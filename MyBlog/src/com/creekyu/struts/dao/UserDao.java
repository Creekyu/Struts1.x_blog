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

public class UserDao {

	// 显示所有用户（可能不用该功能）
	public List searchUsers() {
		String sql = "select * from user_content";
		Connection conn = null;
		PreparedStatement prestmt = null;
		ResultSet rs = null;
		List userlist = new ArrayList();

		try {
			conn = DBUtil.getConn();
			prestmt = conn.prepareStatement(sql);// sql语句的预编译
			rs = prestmt.executeQuery();// 查询返回的结果集
			while (rs.next()) {
				BlogUserForm user = new BlogUserForm();
				user.setUser_id(rs.getInt("user_id"));
				user.setUser_name(rs.getString("user_name"));
				user.setUser_nickname(rs.getString("user_nickname"));
				user.setUser_pwd(rs.getString("user_pwd"));
				userlist.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeStmt(prestmt);
			DBUtil.closeConn(conn);
			DBUtil.closeRs(rs);
		}
		return userlist;
	}

	// 添加用户
	public BlogUserForm addUsers(BlogUserForm user) {

		String sql = "insert into user_content (user_name,user_nickname,user_pwd) values (?,?,?)";// 插入语句
		Connection conn = null;
		PreparedStatement prestmt = null;

		try {
			conn = DBUtil.getConn();
			prestmt = conn.prepareStatement(sql);
			prestmt.setString(1, user.getUser_name());// 在第一个问号处插入后面的值
			prestmt.setString(2, user.getUser_nickname());
			prestmt.setString(3, user.getUser_pwd());
			prestmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeStmt(prestmt);
			DBUtil.closeConn(conn);
		}
		return user;
	}

	// 编辑用户
	public void updateUsers(BlogUserForm user) {
		String sql1 = "select * from user_content where user_id = ?"; 
		String sql2 = "update user_content set user_nickname=?,user_pwd=? ,user_brief=? where user_id=?";// 修改语句
		
		Connection conn = null;
		PreparedStatement prestmt1 = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		try {
			conn = DBUtil.getConn();
			prestmt1 = conn.prepareStatement(sql1); // 先查询指定用户信息，未变化的赋值为原值
			prestmt1.setInt(1,user.getUser_id());
			rs = prestmt1.executeQuery();
			BlogUserForm initUser = new BlogUserForm();
			while(rs.next()){
				initUser.setUser_nickname(rs.getString("user_nickname"));
				initUser.setUser_pwd(rs.getString("user_pwd"));
				initUser.setUser_brief(rs.getString("user_brief"));
			}
			
			prestmt = conn.prepareStatement(sql2);// 绑定mysql语句
			
			//""表示未填写，即不修改，使用原值
			if(user.getUser_nickname().equals("")){
				prestmt.setString(1, initUser.getUser_nickname());
			}else{
				prestmt.setString(1, user.getUser_nickname());
			}
			if(user.getUser_pwd().equals("")){
				prestmt.setString(2, initUser.getUser_pwd());
			}else{
				prestmt.setString(2, user.getUser_pwd());
			}
			if(user.getUser_brief().equals("")){
				prestmt.setString(3, initUser.getUser_brief());
			}else{
				prestmt.setString(3, user.getUser_brief());
			}
			prestmt.setInt(4, user.getUser_id());
			prestmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeStmt(prestmt);
			DBUtil.closeConn(conn);
		}
	}

	
	//登录检查
	public List checkLogin(String user_name) {
		String sql = "select * from user_content";
		Connection conn = null;
		PreparedStatement prestmt = null;
		ResultSet rs = null;
		List userList = new ArrayList();

		try {
			conn = DBUtil.getConn();
			prestmt = conn.prepareStatement(sql);
			rs = prestmt.executeQuery();
			String userName;
			while (rs.next()) {
				userName = rs.getString("user_name");
				if (userName.equals(user_name)) {
					BlogUserForm user = new BlogUserForm();
					user.setUser_id(rs.getInt("user_id"));
					user.setUser_name(userName);
					user.setUser_nickname(rs.getString("user_nickname"));
					user.setUser_pwd(rs.getString("user_pwd"));
					user.setUser_brief(rs.getString("user_brief"));
					userList.add(user);
					return userList;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConn(conn);
			DBUtil.closeStmt(prestmt);
			DBUtil.closeRs(rs);
		}
		return null;
	}
	
}
