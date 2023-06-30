package com.ezen.view;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.biz.dto.BookingVO;
import com.ezen.biz.dto.Total_entVO;
import com.ezen.biz.dto.MemberVO;
import com.ezen.biz.service.BookingService;
import com.ezen.biz.service.Total_entService;

@Controller
public class Total_entController {

	@Autowired
	private Total_entService total_entService;
	@Autowired
	private BookingService bookingService;

	// 공연 메인 화면
	@GetMapping("/total_ent_main")
	public String concert(Total_entVO vo, Model model) {

		List<Total_entVO> total_entList = total_entService.total_entList(vo);

		model.addAttribute("total_entList", total_entList);

		return "total_ent/total_ent_main";
	}

	// 콘서트 디테일 화면
	@GetMapping("/total_ent_detail")
	public String concertdetail(Model model, Total_entVO vo, HttpSession session) {

		MemberVO membervo = (MemberVO) session.getAttribute("loginUser");

		Total_entVO total_entVO = total_entService.total_entDetail(vo);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		String formattedSDate = sdf.format(total_entVO.getSdate());
		String formattedEDate = sdf.format(total_entVO.getEdate());

		Pattern pattern = Pattern.compile("\\d+");
		Matcher matcher = pattern.matcher(total_entVO.getSeat());

		String seat = "";

		if (vo.getCategory().equals("1")) {

			int r = 0, a = 0, b = 0;

			if (matcher.find()) {
				r = Integer.parseInt(matcher.group());
			}

			if (matcher.find()) {
				a = Integer.parseInt(matcher.group());
			}

			if (matcher.find()) {
				b = Integer.parseInt(matcher.group());
			}

			seat = "R석 : " + r + "석, A석 : " + a + "석, B석 : " + b + "석 ";
		}

		else if (vo.getCategory().equals("2")) {

			int width = 0;
			int height = 0;

			if (matcher.find()) {
				width = Integer.parseInt(matcher.group());
			}

			if (matcher.find()) {
				height = Integer.parseInt(matcher.group());
			}

			seat = String.valueOf(width * height) + " 석";
		}

		else {

			int am = 0;
			int pm = 0;

			if (matcher.find()) {
				am = Integer.parseInt(matcher.group());
			}

			if (matcher.find()) {
				pm = Integer.parseInt(matcher.group());
			}

			seat = "오전 : " + am + "명 , 오후 : " + pm + "명";
		}

		model.addAttribute("membervo", membervo);
		model.addAttribute("total_ent", total_entVO);
		model.addAttribute("formattedSDate", formattedSDate);
		model.addAttribute("formattedEDate", formattedEDate);
		model.addAttribute("seat", seat);

		return "total_ent/total_ent_detail";
	}

	// 콘서트 booking 화면
	@GetMapping("/total_ent_booking")
	public String concertbooking(Total_entVO vo, Model model, HttpSession session, BookingVO bookingvo1,
			@RequestParam("dday") String dday) throws ParseException {
		
		MemberVO membervo = (MemberVO) session.getAttribute("loginUser");
		
		if(membervo == null) {
			return "total_ent/total_ent_booking_cancel";
		}
		
		Total_entVO total_entVO = total_entService.total_entDetail(vo);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date ddayformat = sdf.parse(dday);

		if (total_entVO.getCategory().equals("1")) {
			// S
			bookingvo1.setDday(ddayformat);
			bookingvo1.setSeat("R");
			bookingvo1.setTseq(total_entVO.getTseq());

			// A
			BookingVO bookingvo2 = new BookingVO();
			bookingvo2.setDday(ddayformat);
			bookingvo2.setSeat("A");
			bookingvo2.setTseq(total_entVO.getTseq());

			// B
			BookingVO bookingvo3 = new BookingVO();
			bookingvo3.setDday(ddayformat);
			bookingvo3.setSeat("B");
			bookingvo3.setTseq(total_entVO.getTseq());

			int head1 = bookingService.checkHead(bookingvo1);
			int head2 = bookingService.checkHead(bookingvo2);
			int head3 = bookingService.checkHead(bookingvo3);

			Pattern pattern = Pattern.compile("\\d+");
			Matcher matcher = pattern.matcher(total_entVO.getSeat());

			int r = 0, a = 0, b = 0;

			if (matcher.find()) {
				r = Integer.parseInt(matcher.group());
			}

			if (matcher.find()) {
				a = Integer.parseInt(matcher.group());
			}

			if (matcher.find()) {
				b = Integer.parseInt(matcher.group());
			}

			model.addAttribute("r", r);
			model.addAttribute("a", a);
			model.addAttribute("b", b);
			model.addAttribute("membervo", membervo);
			model.addAttribute("concert", total_entVO);
			model.addAttribute("dday", dday);
			model.addAttribute("head1", head1);
			model.addAttribute("head2", head2);
			model.addAttribute("head3", head3);

			return "total_ent/concert_booking";
		}
		
		else if (total_entVO.getCategory().equals("2")) {
			
			bookingvo1.setTseq(total_entVO.getTseq());
			bookingvo1.setDday(ddayformat);
			
			List<String> seatList = bookingService.selectTheater(bookingvo1);
			
			List<String> seatlist1 = new ArrayList<String>();
			
			for(String data : seatList) {
				
				StringTokenizer tokenizer = new StringTokenizer(data,",");

				while (tokenizer.hasMoreTokens()) {
					String token = tokenizer.nextToken();
					seatlist1.add(token);
				}
			}	

	        Pattern pattern = Pattern.compile("\\d+");
	        Matcher matcher = pattern.matcher(total_entVO.getSeat());

	        int width = 0;
	        int height = 0;

	        if (matcher.find()) {
	        	width = Integer.parseInt(matcher.group());
	        }

	        if (matcher.find()) {
	        	height = Integer.parseInt(matcher.group());
	        }
		
			model.addAttribute("seatlist1",seatlist1);
			model.addAttribute("theater", total_entVO);
			model.addAttribute("dday",dday);
			model.addAttribute("width",width);
			model.addAttribute("height",height);
			model.addAttribute("membervo", membervo);
			return "total_ent/theater_booking";
		}
		else {
			bookingvo1.setTseq(total_entVO.getTseq());
			bookingvo1.setDday(ddayformat);
			bookingvo1.setSeat("오전");
			
			BookingVO bookingVo2 = new BookingVO();
			bookingVo2.setSeat("오후");
			bookingVo2.setTseq(total_entVO.getTseq());
			bookingVo2.setDday(ddayformat);
			
			int head =bookingService.checkHead(bookingvo1);
			int head2 =bookingService.checkHead(bookingVo2);
			
			Pattern pattern = Pattern.compile("\\d+");
		    Matcher matcher = pattern.matcher(total_entVO.getSeat());

		    int am = 0;
		    int pm = 0;

		    // Find the first number and assign it to x
		    if (matcher.find()) {
		    	am = Integer.parseInt(matcher.group());
		    }

		        // Find the second number and assign it to y
		    if (matcher.find()) {
		    	pm = Integer.parseInt(matcher.group());
		    }
			
		    
			model.addAttribute("membervo", membervo);
			model.addAttribute("museum", total_entVO);
			model.addAttribute("dday", dday);
		    model.addAttribute("am",am);
			model.addAttribute("pm",pm);
			model.addAttribute("head",head);
			model.addAttribute("head2",head2);
			
			return "total_ent/museum_booking";
		}
	}

	// 콘서트 예매 정보확인
	@PostMapping("/total_ent_booking_detail")
	public String mbooking_detail(Total_entVO vo, Model model, HttpSession session, BookingVO bookingVO) {
		
		MemberVO membervo = (MemberVO) session.getAttribute("loginUser");
		
		if(membervo == null) {
			return "total_ent/total_ent_booking_cancel";
		}
		else {
			Total_entVO total_entVO = total_entService.total_entDetail(vo);
			
			String seat = bookingVO.getSeat().replaceAll("[\\[\\]\"]", "");

			model.addAttribute("total_entVO", total_entVO);
			model.addAttribute("membervo", membervo);
			model.addAttribute("seat", seat);
			model.addAttribute("bookingVO",bookingVO);
			
			return "total_ent/total_ent_booking_detail";
		}
	}
}