package com.mobiNxtGen.adminUi.web.controller;

import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mobiNxtGen.login.service.LoginService;
import com.mobiNxtGen.login.service.model.LoggedInUser;

@Controller
@RequestMapping(value = "/login")
public class LoginController extends BaseController {

	private static final Logger logger = Logger
			.getLogger(LoginController.class);

	@Resource
	LoginService loginService;

	@RequestMapping(value = "/", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> authenitcateUser(
			@RequestParam String userName, @RequestParam String password) {

		logger.debug("authenitcateUser : for user : " + userName);
		System.out.println("authenitcateUser : for user : " + userName);
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		LoggedInUser user = loginService.getUserAuthenticated(userName,
				password);
		if (user == null) {
			logger.debug("User is not authenticated.");
		} else {
			logger.debug("User is authenticated.");
		}
		return null;

	}

	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView signUpUser() {
		return null;
	}

}
