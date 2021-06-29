package com.creekyu.struts.exception;

@SuppressWarnings("serial")
public class UserRepeatException extends Exception {
	public UserRepeatException(String msg) {
		super(msg);
	}
}
