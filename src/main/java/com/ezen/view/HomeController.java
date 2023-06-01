package com.ezen.view;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	//HomeController.java
	@RequestMapping(value = "/index")
	public String home(Model model) {
		
		return "index";
	}
	
	//MemberController.java
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {
		
		return "member/login";
	}
	
	//MemberController.java
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup(Model model) {
		
		return "member/signup";
	}
	
	//ConcertController.java
	@RequestMapping(value = "/concert_main", method = RequestMethod.GET)
	public String concert(Model model) {
		
		return "concert/concert_main";
	}
	@RequestMapping(value = "/index3", method = RequestMethod.GET)
	public String home3(Model model) {
		
		return "index3";
	}
	@RequestMapping(value = "/index4", method = RequestMethod.GET)
	public String home4(Model model) {
		
		return "index4";
	}
}
