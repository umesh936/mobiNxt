package com.mobiNxtGen.login.service;

import javax.annotation.Resource;
import javax.inject.Named;

import org.apache.log4j.Logger;

import com.mobiNxtGen.login.service.dao.LoginServiceDao;
import com.mobiNxtGen.login.service.model.LoggedInUser;

@Named
public class LoginService {
	private static final Logger logger = Logger.getLogger(LoginService.class);

	@Resource
	private LoginServiceDao loginServiceDao;

	public LoggedInUser getUserAuthenticated(String userName, String password) {
		logger.debug("Loggin in user for Username : " + userName);
		LoggedInUser user = loginServiceDao.getUser(userName, password);
		logger.debug("returning User Authentication for Name  : " + userName
				+ (user == null ? "true" : "false"));
		return user;
	}
	/*
	 * public static void main(String[] args) {
	 * System.out.println(" Main function start ** ");
	 * 
	 * System.out.println(LoginService.class
	 * .getResource("/dispatcher-servlet.xml")); ApplicationContext context =
	 * new ClassPathXmlApplicationContext( "dispatcher-servlet.xml");
	 * 
	 * System.out.println(" Context :" + context); }
	 */
}
