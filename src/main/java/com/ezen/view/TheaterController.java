package com.ezen.view;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.biz.dto.TheaterVO;
import com.ezen.biz.service.TheaterService;

@Controller
public class TheaterController {

	@Autowired
	private TheaterService theaterService;

	@RequestMapping(value = "/theater", method = RequestMethod.GET)
	public String theater(Model model, TheaterVO vo) {

		List<TheaterVO> theaterList = theaterService.theaterList();
		
		int theaterListlength = theaterList.size();
		
		System.out.println(theaterListlength);

		model.addAttribute("theaterList", theaterList);

		return "theater/theater";
	}

	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String thboard(Model model, TheaterVO vo) {
		
		TheaterVO theater=theaterService.theaterDetail(vo);
		
		model.addAttribute("theater",theater);
		
		return "theater/board";
	}

	@RequestMapping(value = "/thdetail", method = RequestMethod.GET)
	public String thdetail(Model model, TheaterVO vo) {
		
		TheaterVO theater=theaterService.theaterDetail(vo);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		String formattedDate = sdf.format(theater.getBdate());
		
		model.addAttribute("theater",theater);
		model.addAttribute("formattedDate",formattedDate);
		
		return "theater/thdetail";
	}
}
