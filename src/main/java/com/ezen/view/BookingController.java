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
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.biz.dto.BookingVO;
import com.ezen.biz.dto.MemberVO;
import com.ezen.biz.dto.OrderVO;
import com.ezen.biz.dto.Total_entVO;
import com.ezen.biz.service.BookingService;
import com.ezen.biz.service.OrderService;
import com.ezen.biz.service.Total_entService;

@Controller
public class BookingController {

	@Autowired
	private OrderService orderService;
	@Autowired
	private BookingService bookingService;
	@Autowired
	private Total_entService total_entService;
	
	@RequestMapping("/BookingMain")
	public String bookingprocessing(OrderVO orderVO,Model model,HttpSession session) throws ParseException {
		
		orderService.insertOrder(orderVO);
		
		MemberVO memberVO = (MemberVO) session.getAttribute("loginUser");
		
		OrderVO orderVO2 = orderService.getOrder(orderVO.getOseq());
		
		Total_entVO total_entVO = new Total_entVO();
		total_entVO.setTseq(orderVO.getTseq());
		
		Total_entVO totalVO = total_entService.total_entDetail(total_entVO);
		
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
