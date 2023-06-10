package com.ezen.view;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.biz.dto.BookingVO;
import com.ezen.biz.dto.ConcertVO;
import com.ezen.biz.dto.MemberVO;
import com.ezen.biz.dto.MuseumVO;
import com.ezen.biz.service.BookingService;
import com.ezen.biz.service.ConcertService;

@Controller
public class ConcertController {

	@Autowired
	private ConcertService concertService;
	@Autowired
	private BookingService bookingService;

	// 콘서트 메인 화면
	@RequestMapping(value = "/concert_main", method = RequestMethod.GET)
	public String concert(Model model) {

		List<ConcertVO> concertList = concertService.concertList();

		model.addAttribute("concertList", concertList);

		return "concert/concert_main";
	}

	// 콘서트 디테일 화면
	@RequestMapping("/concert_detail")
	public String concertdetail(Model model, ConcertVO vo,  HttpSession session) {
		
		MemberVO membervo = (MemberVO) session.getAttribute("loginUser");

		ConcertVO concert = concertService.concertDetail(vo);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		String formattedSDate = sdf.format(concert.getSdate());
		String formattedEDate = sdf.format(concert.getEdate());
		
		model.addAttribute("membervo", membervo);
		model.addAttribute("concert", concert);
		model.addAttribute("formattedSDate", formattedSDate);
		model.addAttribute("formattedEDate", formattedEDate);
		
		return "concert/concert_detail";
	}
	
	//콘서트 booking 화면
	@RequestMapping("/concert_booking")
	public String concertbooking(ConcertVO vo, Model model, HttpSession session, BookingVO bookingvo,
													@RequestParam("dday") @DateTimeFormat(pattern="yyyy-MM-dd") String dday) throws ParseException {
		MemberVO membervo = (MemberVO)session.getAttribute("loginUser");
	
		ConcertVO concert = concertService.concertDetail(vo);
		model.addAttribute("membervo", membervo);
		model.addAttribute("concert", concert);
		model.addAttribute("dday", dday);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date ddayformat = sdf.parse(dday);
		
		//S
		bookingvo.setDday(ddayformat);
		bookingvo.setSeat("S");
		bookingvo.setTseq(vo.getTseq());
		
		//A
		BookingVO bookingvo2 = new BookingVO();
		bookingvo2.setDday(ddayformat);
		bookingvo2.setSeat("A");
		bookingvo2.setTseq(vo.getTseq());
		
		//B
		BookingVO bookingvo3 = new BookingVO();
		bookingvo3.setDday(ddayformat);
		bookingvo3.setSeat("B");
		bookingvo3.setTseq(vo.getTseq());
		
		int head = bookingService.checkHead(bookingvo);
		int head2 = bookingService.checkHead(bookingvo2);
		int head3 = bookingService.checkHead(bookingvo3);
		
		model.addAttribute("head",head);
		model.addAttribute("head2",head2);
		model.addAttribute("head3",head3);
		
		
		return "concert/concert_booking";
	}	
	
	//콘서트 예매 정보확인
	@RequestMapping("/cbooking_detail")
	public String mbooking_detail(ConcertVO vo, Model model, HttpSession session, BookingVO bookingVo,
								@RequestParam("dday") @DateTimeFormat(pattern="yyyy-MM-dd") String dday,
								@RequestParam("seat") String seat,
								@RequestParam("head") int head,
								@RequestParam("totalPrice") int totalPrice) {
		MemberVO membervo = (MemberVO) session.getAttribute("loginUser");
		
		ConcertVO concert = concertService.concertDetail(vo);
		
		model.addAttribute("membervo", membervo);
		model.addAttribute("concert", concert);
		model.addAttribute("dday", dday);
		model.addAttribute("seat", seat);
		model.addAttribute("head", head);
		model.addAttribute("totalPrice", totalPrice);
		
		return "concert/cbooking_detail";
	}
	
	//결제ㅐㅐ - booking 테이블 데이터 집어넣기
	@RequestMapping("/cbooking_success")
	public String mbooking_sucess(MuseumVO vo, Model model, HttpSession session,
								@RequestParam("tseq") int tseq,
								@RequestParam("id") String id,
								@RequestParam("seat") String seat,
								@RequestParam("head") int head,
								@RequestParam("dday") @DateTimeFormat(pattern = "yyyy-MM-dd")String dday,
								BookingVO bookingVo) throws ParseException {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date ddayformat = dateFormat.parse(dday);
		
		bookingVo.setTseq(tseq);
		bookingVo.setSeat(seat);
		bookingVo.setId(id);
		bookingVo.setSeat(seat);
		bookingVo.setHead(head);
		bookingVo.setSeat(seat);
		bookingVo.setDday(ddayformat);
		
		bookingService.insertBooking(bookingVo);
		
		return "concert/cbooking_success";
	}
	
	
	
	
	
	
	
	
}
