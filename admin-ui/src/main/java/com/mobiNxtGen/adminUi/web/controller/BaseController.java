package com.mobiNxtGen.adminUi.web.controller;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;

public class BaseController {


	protected ModelAndView getModelAndView(String viewName,  ModelMap modelMap) {

		ModelAndView mav = new ModelAndView(viewName);
		mav.addAllObjects(modelMap);
		return mav;
	}

}
