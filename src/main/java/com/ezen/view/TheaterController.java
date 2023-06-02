package com.ezen.view;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.biz.dto.ThboardVO;
import com.ezen.biz.dto.TheaterVO;
import com.ezen.biz.service.ThboardService;
import com.ezen.biz.service.TheaterService;

@Controller
public class TheaterController {

	@Autowired
	private ThboardService thboardService;
	@Autowired
	private TheaterService theaterService;

	@RequestMapping(value = "/thmain", method = RequestMethod.GET)
	public String theater(Model model, TheaterVO vo) {

		List<TheaterVO> theaterList = theaterService.theaterList();

		model.addAttribute("theaterList", theaterList);

		return "theater/thmain";
	}

	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String thboard(Model model, ThboardVO vo) {

		return "theater/board";
	}

	@RequestMapping(value = "/thdetail", method = RequestMethod.GET)
	public String thdetail(Model model, ThboardVO vo) {
		
		List<ThboardVO> thboardList=thboardService.seatList(vo.getThnum_seq());
		
		System.out.println(vo.getThnum_seq());
		
		model.addAttribute("thboardList",thboardList);
		
		return "theater/thdetail";
	}

}
