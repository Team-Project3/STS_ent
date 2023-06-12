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
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.biz.dto.BookingVO;
import com.ezen.biz.dto.MemberVO;
import com.ezen.biz.dto.MuseumVO;
import com.ezen.biz.service.BookingService;
import com.ezen.biz.service.MuseumService;

@Controller
public class MuseumController {
	
	@Autowired
	private MuseumService museumService;
	@Autowired
	private BookingService bookingService;
	
	//전시회 메인 페이지 - 전시회 리스트
	@RequestMapping("/museum_main")
	public String museumList(MuseumVO vo, Model model) {
		
		List<MuseumVO> list = museumService.museumList();
		
		model.addAttribute("museumList", list);
		
		return "museum/museum_main";
	}
	
	//전시회 디테일 화면
	@RequestMapping("/museum_detail")
	public String museumdetail(MuseumVO vo, Model model, HttpSession session) {
		
		MemberVO membervo = (MemberVO) session.getAttribute("loginUser");
		
		MuseumVO museum = museumService.museumDetail(vo);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		String formattedSDate = sdf.format(museum.getSdate());
		String formattedEDate = sdf.format(museum.getEdate());

		
		model.addAttribute("membervo", membervo);
		model.addAttribute("total_ent", museum);
		model.addAttribute("formattedSDate",formattedSDate);
		model.addAttribute("formattedEDate",formattedEDate);
		model.addAttribute("museum", museum);

		return "museum/museum_detail";
		
	}

	//전시회 예매
	@RequestMapping("/museum_booking")
	public String museumbooking(MuseumVO vo, Model model, HttpSession session, BookingVO bookingVo, 
													@RequestParam("dday") @DateTimeFormat(pattern="yyyy-MM-dd") String dday) throws ParseException {
		MemberVO membervo = (MemberVO) session.getAttribute("loginUser");
		
		MuseumVO museum = museumService.museumDetail(vo);
		model.addAttribute("membervo", membervo);
		model.addAttribute("museum", museum);
		model.addAttribute("dday", dday);
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date ddayformat = sdf.parse(dday);
		
		System.out.println(dday);
		System.out.println(ddayformat);
		
		bookingVo.setTseq(vo.getTseq());
		bookingVo.setDday(ddayformat);
		bookingVo.setSeat("오전");
		
		BookingVO bookingVo2 = new BookingVO();
		bookingVo2.setSeat("오후");
		bookingVo2.setTseq(vo.getTseq());
		bookingVo2.setDday(ddayformat);
		
		int head =bookingService.checkHead(bookingVo);
		int head2 =bookingService.checkHead(bookingVo2);

		model.addAttribute("head",head);
		model.addAttribute("head2",head2);
		
		return "museum/museum_booking";
	}
	
	
	//전시회 예매 정보확인
	@RequestMapping("/mbooking_detail")
	public String mbooking_detail(MuseumVO vo, Model model, HttpSession session, BookingVO bookingVo,
								@RequestParam("dday") @DateTimeFormat(pattern="yyyy-MM-dd") String dday,
								@RequestParam("seat") String seat,
								@RequestParam("head") int head,
								@RequestParam("totalPrice") int totalPrice) {
		MemberVO membervo = (MemberVO) session.getAttribute("loginUser");
		
		MuseumVO museum = museumService.museumDetail(vo);
		
		model.addAttribute("membervo", membervo);
		model.addAttribute("museum", museum);
		model.addAttribute("dday", dday);
		model.addAttribute("seat", seat);
		model.addAttribute("head", head);
		model.addAttribute("totalPrice", totalPrice);
		
		return "museum/mbooking_detail";
	}
	
	//결제ㅐㅐ - booking 테이블 데이터 집어넣기
	@RequestMapping("/mbooking_success")
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
		
		return "museum/mbooking_success";
	}
	
	
	
}
