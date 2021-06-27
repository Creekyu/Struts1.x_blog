package com.creekyu.struts.form;

import java.util.Date;

public class BlogContentForm {
	private int blog_id;// （主键）
	private Date blog_date;
	private String blog_brief;
	private String blog_text;
	private String blog_title;
	private String blog_category;
	private int user_id;
	
	
	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getBlog_category() {
		return blog_category;
	}

	public void setBlog_category(String blog_category) {
		this.blog_category = blog_category;
	}

	public String getBlog_title() {
		return blog_title;
	}

	public void setBlog_title(String blog_title) {
		this.blog_title = blog_title;
	}

	public int getBlog_id() {
		return blog_id;
	}

	public void setBlog_id(int blog_id) {
		this.blog_id = blog_id;
	}

	public Date getBlog_date() {
		return blog_date;
	}

	public void setBlog_date(Date blog_date) {
		this.blog_date = blog_date;
	}

	public String getBlog_brief() {
		return blog_brief;
	}

	public void setBlog_brief(String blog_brief) {
		this.blog_brief = blog_brief;
	}

	public String getBlog_text() {
		return blog_text;
	}

	public void setBlog_text(String blog_text) {
		this.blog_text = blog_text;
	}

}
