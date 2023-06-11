package com.ezen.view;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.biz.dto.BookingVO;
import com.ezen.biz.dto.OrderVO;
import com.ezen.biz.dto.TheaterVO;
import com.ezen.biz.service.BookingService;
import com.ezen.biz.service.OrderService;
import com.ezen.biz.service.TheaterService;

@Controller
public class BookingController {

	@Autowired
	private OrderService orderService;
	@Autowired
	private BookingService bookingService;
	@Autowired
	private TheaterService theaterService;
	
	@RequestMapping("/BookingMain")
	public String bookingprocessing(@RequestParam("tseq")int tseq,
									@RequestParam("seat")String seat,
									@RequestParam("id")String id,
									@RequestParam("head")int head,
									@RequestParam("dday") @DateTimeFormat(pattern = "yyyy-MM-dd")String dday,
									OrderVO orderVO,Model model,TheaterVO theaterVO) throws ParseException {
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date ddayformat = dateFormat.parse(dday);
		
		orderVO.setTseq(tseq);
		orderVO.setSeat(seat);
		orderVO.setId(id);
		orderVO.setHead(head);
		orderVO.setDday(ddayformat);
		
		orderService.insertOrder(orderVO);
		
		
		
		System.out.println(orderVO.getOseq());
		
		OrderVO orderVO2 = orderService.getOrder(orderVO.getOseq()-1);
		
		model.addAttribute("orderVO",orderVO2);
		
		theaterVO.setTseq(tseq);
		
		TheaterVO totalVO = theaterService.theaterDetail(theaterVO);
		
		model.addAttribute("totalVO",totalVO);
		
		return "booking/BookingMain";
	}
}
