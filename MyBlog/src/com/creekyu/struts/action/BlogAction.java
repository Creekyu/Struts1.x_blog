package com.creekyu.struts.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.creekyu.struts.dao.BlogContentDao;
import com.creekyu.struts.form.BlogContentActionForm;
import com.creekyu.struts.form.BlogContentForm;

public class BlogAction extends DispatchAction {

	protected ActionForward unspecified(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		return mapping.findForward("about");
	}

	public ActionForward searchBlog(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		List blogList = new ArrayList();
		BlogContentDao blogDao = new BlogContentDao();
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		blogList = blogDao.searchBlog(user_id);
		request.setAttribute("blogList", blogList);

		return mapping.findForward("read_passage");
	}

	public ActionForward showList(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		List blogList = new ArrayList();
		BlogContentDao blogDao = new BlogContentDao();
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		blogList = blogDao.searchBlog(user_id);
		request.setAttribute("blogList", blogList);
		return mapping.findForward("show_list");
	}

	public ActionForward editBlog(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		List blogList = new ArrayList();
		BlogContentDao blogDao = new BlogContentDao();
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		blogList = blogDao.searchBlog(user_id);
		request.setAttribute("blogList", blogList);
		return mapping.findForward("edit_blog");
	}

	// 添加
	public ActionForward addBlogs(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		BlogContentActionForm baf = (BlogContentActionForm) form;// 获得user表单
		BlogContentForm blog = new BlogContentForm();
		BlogContentDao blogDao = new BlogContentDao();
		BeanUtils.copyProperties(blog, baf);
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		blog.setUser_id(user_id);
		blogDao.addBlog(blog);

		return mapping.findForward("add_success");
	}

	// 编辑
	public ActionForward updateBlogs(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		BlogContentActionForm baf = (BlogContentActionForm) form;// 获得user表单
		int blogid = Integer.parseInt(request.getParameter("blog_id"));
		BlogContentForm blog = new BlogContentForm();
		BlogContentDao blogDao = new BlogContentDao();
		BeanUtils.copyProperties(blog, baf);
		blogDao.updateBlog(blog,blogid);
		//再次查询数据库
		List blogList = new ArrayList();
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		blogList = blogDao.searchBlog(user_id);
		request.setAttribute("blogList", blogList);
		return mapping.findForward("update_success");
	}

	// 删除
	public ActionForward delBlogs(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		int blogid = Integer.parseInt(request.getParameter("blog_id"));
		BlogContentDao blogDao = new BlogContentDao();
		blogDao.delBlog(blogid);
		//再次查询数据库
		List blogList = new ArrayList();
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		blogList = blogDao.searchBlog(user_id);
		request.setAttribute("blogList", blogList);
		return mapping.findForward("delete_success");
	}

	// 查看内容
	public ActionForward showContents(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		int blogid = Integer.parseInt(request.getParameter("blog_id"));
		BlogContentForm blog = new BlogContentForm();
		BlogContentDao blogDao = new BlogContentDao();
		blog = blogDao.showContent(blogid);
		request.setAttribute("blog", blog);

		return mapping.findForward("show_content_success");
	}
	
	public ActionForward sort(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		BlogContentDao dao1 = new BlogContentDao();
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		request.setAttribute("blog_java", dao1.searchCategory("Java",user_id));
		request.setAttribute("blog_html", dao1.searchCategory("HTML",user_id));
		request.setAttribute("blog_css", dao1.searchCategory("CSS",user_id));
		request.setAttribute("blog_javascript", dao1.searchCategory("JavaScript",user_id));
		request.setAttribute("blog_jQuery", dao1.searchCategory("JQuery",user_id));
		request.setAttribute("blog_bootstrap", dao1.searchCategory("Bootstrap",user_id));
		return mapping.findForward("sort");
	}

}
