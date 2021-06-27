package com.creekyu.struts.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.creekyu.struts.dao.UserDao;
import com.creekyu.struts.form.BlogUserActionForm;
import com.creekyu.struts.form.BlogUserForm;

public class UserAction extends DispatchAction {

	// 添加用户
	public ActionForward addUser(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		BlogUserActionForm uaf = (BlogUserActionForm) form;
		BlogUserForm user = new BlogUserForm();
		UserDao userDao = new UserDao();
		BeanUtils.copyProperties(user, uaf);
		userDao.addUsers(user);
		return mapping.findForward("register_success");
	}

	// 修改用户信息
	public ActionForward updateUser(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		BlogUserActionForm uaf = (BlogUserActionForm) form;
		BlogUserForm user = new BlogUserForm();
		UserDao userDao = new UserDao();
		BeanUtils.copyProperties(user, uaf);
		int blog_id = Integer.parseInt(request.getParameter("user_id"));
		user.setUser_id(blog_id);
		userDao.updateUsers(user);
		
		//如果修改了用户昵称和个性签名则更新信息
		if(!user.getUser_nickname().equals("")){
			request.getSession().setAttribute("user_nickname", user.getUser_nickname());
		}
		if(!user.getUser_brief().equals("")){
			request.getSession().setAttribute("user_brief", user.getUser_brief());
		}
		
		return mapping.findForward("update_success");
	}
	
	//注销
	public ActionForward logOut(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("user_id");
		session.removeAttribute("user_name");
		session.removeAttribute("user_nickname");
		session.removeAttribute("user_brief");
		return mapping.findForward("logout");
		
	}
	

}