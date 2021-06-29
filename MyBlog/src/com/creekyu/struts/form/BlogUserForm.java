package com.creekyu.struts.form;

public class BlogUserForm {
	private int user_id;
	private String user_name;// 用户（主键）
	private String user_nickname;// 用户昵称
	private String user_pwd;// 密码
	private String user_brief;

	public String getUser_brief() {
		return user_brief;
	}

	public void setUser_brief(String user_brief) {
		this.user_brief = user_brief;
	}

	public int getUser_id() {
		return user_id;
	}

	public String getUser_name() { // 获取用户名
		return user_name;
	}

	public String getUser_nickname() { // 获取用户昵称
		return user_nickname;
	}

	public String getUser_pwd() { // 获取用户密码
		return user_pwd;
	}

	public void setUser_id(int user_id) { // set方法
		this.user_id = user_id;
	}

	public void setUser_name(String user_name) { // set方法
		this.user_name = user_name;
	}

	public void setUser_nickname(String user_nickname) { // set方法
		this.user_nickname = user_nickname;
	}

	public void setUser_pwd(String user_pwd) { // set方法
		this.user_pwd = user_pwd;
	}
}
