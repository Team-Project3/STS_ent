package com.ezen.view;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.biz.service.ThboardService;

@Controller
public class TheaterController {
	
	@Autowired
	private ThboardService thboardService; 
	
	@RequestMapping(value = "/thmain", method = RequestMethod.GET)
	public String theater(Model model) {

		return "theater/thmain";
	}

	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String thboard(Model model) {

		return "theater/board";
	}
}
