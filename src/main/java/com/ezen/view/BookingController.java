package com.ezen.view;

import java.text.ParseException;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.biz.dto.BookingVO;
import com.ezen.biz.dto.MemberVO;
import com.ezen.biz.dto.OrderVO;
import com.ezen.biz.dto.Total_entVO;
import com.ezen.biz.service.BookingService;
import com.ezen.biz.service.OrderService;
import com.ezen.biz.service.Total_entService;

@Controller
public class BookingController {
	/**
	 * Slf4j Logger
	 */
	private static final Logger logger = LoggerFactory.getLogger(BookingController.class);
	
	@Autowired
	private OrderService orderService;
	@Autowired
	private BookingService bookingService;
	@Autowired
	private Total_entService total_entService;

	@RequestMapping("/BookingMain")
	public String bookingprocessing(OrderVO orderVO, Model model, HttpSession session) throws ParseException {

		orderService.insertOrder(orderVO);

		MemberVO memberVO = (MemberVO) session.getAttribute("loginUser");

		OrderVO orderVO2 = orderService.getOrder(orderVO.getOseq());

		Total_entVO total_entVO = new Total_entVO();
		total_entVO.setTseq(orderVO.getTseq());

		Total_entVO totalVO = total_entService.total_entDetail(total_entVO);

		int totalprice = totalVO.getPrice() * orderVO2.getHead();

		model.addAttribute("orderVO", orderVO2);

		model.addAttribute("totalVO", totalVO);

		model.addAttribute("memberVO", memberVO);

		model.addAttribute("totalprice", totalprice);

		return "booking/BookingMain";
	}

	@ResponseBody
	@PostMapping(value = "/order_delete", produces = "application/text; charset=utf8")
	public String order_delete(OrderVO vo, HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {

			return "fail";

		} else {
			orderService.deleteOrder(vo.getOseq());

			return "success";
		}
	}

	@RequestMapping("/BookingSuccess")
	public String bookingSuccess(@RequestParam("oseq") int oseq, Model model, OrderVO orderVO, BookingVO bookingVO,HttpSession session) {

		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		orderVO = orderService.getOrder(oseq);
		
		bookingVO.setTseq(orderVO.getTseq());
		bookingVO.setSeat(orderVO.getSeat());
		bookingVO.setId(orderVO.getId());
		bookingVO.setHead(orderVO.getHead());
		bookingVO.setDday(orderVO.getDday());

		bookingService.insertBooking(bookingVO);
		BookingVO bookingVO2 = bookingService.bookingdetail(bookingVO);
		
		Total_entVO vo = new Total_entVO();
		vo.setTseq(bookingVO2.getTseq());
		Total_entVO total_entVO = total_entService.total_entDetail(vo);

		logger.info(bookingVO.getSeat());
		
		String img = "";
		
		if(total_entVO.getCategory().equals("1")) {
			img = "img/concert/"+total_entVO.getPimg()+".jpg";
		}
		else if (total_entVO.getCategory().equals("2")) {
			img = "img/theater/"+total_entVO.getPimg()+".jpg";
		}
		else {
			img = "img/museum/"+total_entVO.getPimg()+".jpg";
		}
		
		model.addAttribute("total_entVO",total_entVO);
		model.addAttribute("bookingVO",bookingVO2);
		model.addAttribute("id",loginUser.getId());
		model.addAttribute("img",img);
		orderService.deleteOrder(oseq);
		return "booking/BookingSuccess";
	}
}