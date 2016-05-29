package com.spzf.common;

/**
 * 自定义异常
 * @Author:
 * @Since:2014年5月29日
 * @Version:1.1.0
 * @Copyright:Copyright (c) 2014 ~ 2015 版权所有
 */
public class PrivilegeException extends RuntimeException {
	private static final long serialVersionUID = 1L;
	private String key;
	private Object[] values;

	public PrivilegeException() {
		super();
	}

	public PrivilegeException(String message, Throwable throwable) {
		super(message, throwable);
	}

	public PrivilegeException(String message) {
		super(message);
	}

	public PrivilegeException(Throwable throwable) {
		super(throwable);
	}

	public PrivilegeException(String key, String message) {
		super(message);
		this.key = key;
	}

	public PrivilegeException(String key, Object value, String message) {
		super(message);
		this.key = key;
		this.values = new Object[] { value };
	}

	public PrivilegeException(String key, Object[] values, String message) {
		super(message);
		this.key = key;
		this.values = values;
	}

	public String getKey() {
		return key;
	}

	public Object[] getValues() {
		return values;
	}

}
