package com.creekyu.struts.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;


public class MustLoginAction extends DispatchAction {
	
	protected ActionForward unspecified(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		if(request.getSession().getAttribute("user_name") == null){
			response.sendRedirect(request.getContextPath() + "/index.jsp");
			return null;
		}
		return mapping.findForward("blog_main");
	}
	
	public ActionForward writeBlog(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		if(request.getSession().getAttribute("user_name") == null){
			response.sendRedirect(request.getContextPath() + "/index.jsp");
			return null;
		}
		return mapping.findForward("blog_write");
		
	}
}
