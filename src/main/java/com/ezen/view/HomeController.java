package com.ezen.view;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	// HomeController.java
	@RequestMapping(value = "/index")
	public String home(Model model) {

		return "index";
	}

}
