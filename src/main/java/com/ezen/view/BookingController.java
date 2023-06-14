package com.ezen.view;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.biz.dto.BookingVO;
import com.ezen.biz.dto.MemberVO;
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
									OrderVO orderVO,Model model,TheaterVO theaterVO,
									HttpSession session) throws ParseException {
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date ddayformat = dateFormat.parse(dday);
		
		orderVO.setTseq(tseq);
		orderVO.setSeat(seat);
		orderVO.setId(id);
		orderVO.setHead(head);
		orderVO.setDday(ddayformat);
		
		orderService.insertOrder(orderVO);
		
		MemberVO memberVO = (MemberVO) session.getAttribute("loginUser");
		
		OrderVO orderVO2 = orderService.getOrder(orderVO.getOseq());
		
		System.out.println(orderVO.getOseq());
		
		theaterVO.setTseq(tseq);
		
		TheaterVO totalVO = theaterService.theaterDetail(theaterVO);
		
		int totalprice = totalVO.getPrice() * orderVO2.getHead(); 
		
		model.addAttribute("orderVO",orderVO2);
		
		model.addAttribute("totalVO",totalVO);
		
		model.addAttribute("memberVO",memberVO);
		
		model.addAttribute("totalprice",totalprice);
		
		return "booking/BookingMain";
	}
	
	@RequestMapping("/BookingSuccess")
	public String bookingSuccess(@RequestParam("oseq")int oseq,
									Model model,OrderVO orderVO,BookingVO bookingVO) {
		
		orderVO = orderService.getOrder(oseq);
		
		bookingVO.setTseq(orderVO.getTseq());
		bookingVO.setSeat(orderVO.getSeat());
		bookingVO.setId(orderVO.getId());
		bookingVO.setHead(orderVO.getHead());
		bookingVO.setDday(orderVO.getDday());	
		
		bookingService.insertBooking(bookingVO);
		
		model.addAttribute("id", orderVO.getId());
		
		return "booking/BookingSuccess";
	}
	
	
}
