package com.ezen.view;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {

	// MemberController.java
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {
		
		return "member/login";
	}

	// MemberController.java
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup(Model model) {

		return "member/signup";
	}
}
