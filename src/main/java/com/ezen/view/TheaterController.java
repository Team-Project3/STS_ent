package com.ezen.view;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.biz.dto.MemberVO;
import com.ezen.biz.dto.TheaterVO;
import com.ezen.biz.service.TheaterService;

@Controller
public class TheaterController {

	@Autowired
	private TheaterService theaterService;

	@RequestMapping(value = "/theater", method = RequestMethod.GET)
	public String theater(Model model, TheaterVO vo) {

		List<TheaterVO> theaterList = theaterService.theaterList();

		model.addAttribute("theaterList", theaterList);

		return "theater/theater";
	}

	@RequestMapping(value = "/thdetail", method = RequestMethod.GET)
	public String thdetail(Model model, TheaterVO vo) {
		
		TheaterVO theater=theaterService.theaterDetail(vo);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		String formattedSDate = sdf.format(theater.getSdate());
		String formattedEDate = sdf.format(theater.getSdate());
		model.addAttribute("theater",theater);
		
		return "theater/thdetail";
	}

	@RequestMapping(value = "/thboard", method = RequestMethod.GET)
	public String thboard(Model model, TheaterVO vo) {
		
		TheaterVO theater=theaterService.theaterDetail(vo);
		
		model.addAttribute("theater",theater);
		
		return "theater/thboard";
	}
	
	@RequestMapping(value = "/thboarddetail")
	public String thboarddetail(@RequestParam("selectedSeatsCount") int selectedSeatsCount,
            					@RequestParam("selectedSeats") String selectedSeats,
            					@RequestParam("ticketPrice") int ticketPrice,
            					@RequestParam("tseq") int tseq,
            					Model model,HttpSession session) {
		
		MemberVO membervo = new MemberVO();
		
		TheaterVO vo = new TheaterVO();
		
		vo.setTseq(tseq);
		
		membervo = (MemberVO) session.getAttribute("loginUser");
		
		TheaterVO theaterVO = theaterService.theaterDetail(vo);
		
		model.addAttribute("selectedSeatsCount",selectedSeatsCount);
		model.addAttribute("selectedSeats",selectedSeats);
		model.addAttribute("ticketPrice",ticketPrice);
		model.addAttribute("theaterVO",theaterVO);
		model.addAttribute("membervo",membervo);
		return "theater/thboarddetail";
	}
}
