package com.ezen.view;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.biz.dto.ConcertVO;
import com.ezen.biz.service.ConcertService;

@Controller
public class ConcertController {

	@Autowired
	private ConcertService concertService;

	// ConcertController.java
	@RequestMapping(value = "/concert_main", method = RequestMethod.GET)
	public String concert(Model model) {

		List<ConcertVO> concertList = concertService.concertList();

		model.addAttribute("concertList", concertList);

		return "concert/concert_main";
	}

	@RequestMapping("/concertdetail")
	public String concertdetail(Model model,ConcertVO vo) {

		ConcertVO concert = concertService.concertDetail(vo);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		String formattedDate = sdf.format(concert.getBdate());

		model.addAttribute("formattedDate",formattedDate);
		
		model.addAttribute("concert", concert);

		return "concert/concertdetail";
	}
}
