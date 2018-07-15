package org.study.finalproject;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class memberController {
	

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		
		return "/member/login";
	}
	
	@RequestMapping(value = "/member/mem_input", method = RequestMethod.GET)
	public String mem_input(Locale locale, Model model) {
		
		return "/member/mem_input";
	}
	
	@RequestMapping(value = "/member/mem_input2", method = RequestMethod.POST)
	public String mem_input2(Locale locale, Model model) {
		
		return "/member/mem_input2";
	}
}
