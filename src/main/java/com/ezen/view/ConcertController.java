package com.ezen.view;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.biz.dto.BookingVO;
import com.ezen.biz.dto.Total_entVO;
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

		List<Total_entVO> concertList = concertService.concertList();

		model.addAttribute("concertList", concertList);

		return "concert/concert_main";
	}

	// 콘서트 디테일 화면
	@RequestMapping("/concert_detail")
	public String concertdetail(Model model, Total_entVO vo,  HttpSession session) {
		
		MemberVO membervo = (MemberVO) session.getAttribute("loginUser");

		Total_entVO concert = concertService.concertDetail(vo);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		String formattedSDate = sdf.format(concert.getSdate());
		String formattedEDate = sdf.format(concert.getEdate());
		
		Pattern pattern = Pattern.compile("\\d+");
	    Matcher matcher = pattern.matcher(concert.getSeat());
		
	    int r = 0,a = 0,b = 0;
	    
	    if (matcher.find()) {
	    	r = Integer.parseInt(matcher.group());
	    }

	    if (matcher.find()) {
	    	a = Integer.parseInt(matcher.group());
	    }
	    
	    if (matcher.find()) {
	    	b = Integer.parseInt(matcher.group());
	    }
	    
	    model.addAttribute("r",r);
	    model.addAttribute("a",a);
	    model.addAttribute("b",b);
		model.addAttribute("membervo", membervo);
		model.addAttribute("concert", concert);
		model.addAttribute("total_ent", concert);
		model.addAttribute("formattedSDate", formattedSDate);
		model.addAttribute("formattedEDate", formattedEDate);
		
		return "concert/concert_detail";
	}
	
	//콘서트 booking 화면
	@RequestMapping("/concert_booking")
	public String concertbooking(Total_entVO vo, Model model, HttpSession session, BookingVO bookingvo,
													@RequestParam("dday") @DateTimeFormat(pattern="yyyy-MM-dd") String dday) throws ParseException {
		MemberVO membervo = (MemberVO)session.getAttribute("loginUser");
	
		Total_entVO concert = concertService.concertDetail(vo);
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date ddayformat = sdf.parse(dday);
		
		//S
		bookingvo.setDday(ddayformat);
		bookingvo.setSeat("R");
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
		
		int head1 = bookingService.checkHead(bookingvo);
		int head2 = bookingService.checkHead(bookingvo2);
		int head3 = bookingService.checkHead(bookingvo3);
		
		Pattern pattern = Pattern.compile("\\d+");
	    Matcher matcher = pattern.matcher(concert.getSeat());
		
	    int r = 0,a = 0,b = 0;
	    
	    if (matcher.find()) {
	    	r = Integer.parseInt(matcher.group());
	    }

	    if (matcher.find()) {
	    	a = Integer.parseInt(matcher.group());
	    }
	    
	    if (matcher.find()) {
	    	b = Integer.parseInt(matcher.group());
	    }
	    
	    model.addAttribute("r",r);
	    model.addAttribute("a",a);
	    model.addAttribute("b",b);
		model.addAttribute("membervo", membervo);
		model.addAttribute("concert", concert);
		model.addAttribute("dday", dday);
		model.addAttribute("head1",head1);
		model.addAttribute("head2",head2);
		model.addAttribute("head3",head3);
		
		
		return "concert/concert_booking";
	}	
	
	//콘서트 예매 정보확인
	@RequestMapping("/cbooking_detail")
	public String mbooking_detail(Total_entVO vo, Model model, HttpSession session, BookingVO bookingVo,
								@RequestParam("dday") @DateTimeFormat(pattern="yyyy-MM-dd") String dday,
								@RequestParam("seat") String seat,
								@RequestParam("head") int head,
								@RequestParam("totalPrice") int totalPrice) {
		MemberVO membervo = (MemberVO) session.getAttribute("loginUser");
		
		Total_entVO concert = concertService.concertDetail(vo);
		
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
								@RequestParam("seat") String seat,
								@RequestParam("head") int head,
								@RequestParam("dday") @DateTimeFormat(pattern = "yyyy-MM-dd")String dday,
								BookingVO bookingVo) throws ParseException {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date ddayformat = dateFormat.parse(dday);
		
		MemberVO membervo = (MemberVO) session.getAttribute("loginUser");
		
		bookingVo.setTseq(tseq);
		bookingVo.setSeat(seat);
		bookingVo.setId(membervo.getId());
		bookingVo.setHead(head);
		bookingVo.setDday(ddayformat);
		
		bookingService.insertBooking(bookingVo);
		
		return "concert/cbooking_success";
	}
}