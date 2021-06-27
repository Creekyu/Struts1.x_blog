package com.creekyu.struts.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.creekyu.struts.dao.UserDao;
import com.creekyu.struts.form.BlogUserActionForm;
import com.creekyu.struts.form.BlogUserForm;

public class LoginAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		BlogUserActionForm userForm = (BlogUserActionForm) form; // 用户输入的user_name
		List loginUser = new ArrayList();
		UserDao userDao = new UserDao();
		loginUser = userDao.checkLogin(userForm.getUser_name()); // 数据库导入user数据
		if (loginUser == null) {
			request.setAttribute("error", "找不到该用户！");
			return mapping.findForward("login_failed");
		}
		BlogUserForm user = (BlogUserForm) loginUser.get(0);
		if (userForm.getUser_pwd().equals(user.getUser_pwd())) {
			HttpSession session = request.getSession();
			session.setAttribute("user_id", user.getUser_id());
			session.setAttribute("user_name", user.getUser_name());
			session.setAttribute("user_nickname",user.getUser_nickname()); //注意这里是user对象，是从数据库提取的用户，否则传值也会出现问题（检查了半天原来是这）
			session.setAttribute("user_brief", user.getUser_brief());
			return mapping.findForward("login_sucess");
		} else {
			request.setAttribute("error", "密码错误！"); // Attribute重定向就没了，注意下
			return mapping.findForward("login_failed");
		}
	}
}
