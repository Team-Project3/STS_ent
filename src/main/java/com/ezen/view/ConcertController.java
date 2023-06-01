package com.ezen.view;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ConcertController {

	// ConcertController.java
	@RequestMapping(value = "/concert_main", method = RequestMethod.GET)
	public String concert(Model model) {

		return "concert/concert_main";
	}
}
