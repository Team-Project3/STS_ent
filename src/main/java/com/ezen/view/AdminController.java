package com.ezen.view;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.biz.dto.AdminVO;
import com.ezen.biz.dto.BookingVO;
import com.ezen.biz.dto.Total_entVO;
import com.ezen.biz.dto.MemberVO;
import com.ezen.biz.dto.NoticeVO;
import com.ezen.biz.dto.ReviewVO;
import com.ezen.biz.dto.Booking_Total_entVO;
import com.ezen.biz.dto.Review_Total_entVO;
import com.ezen.biz.service.AdminService;
import com.ezen.biz.service.BookingService;
import com.ezen.biz.service.MemberService;
import com.ezen.biz.service.NoticeService;
import com.ezen.biz.service.ReviewService;
import com.ezen.biz.service.Total_entService;

@Controller
@SessionAttributes("admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	@Autowired
	private Total_entService total_entService;
	@Autowired
	private BookingService bookingService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private ReviewService reviewService;

	// 관리자 로그인 화면
	@GetMapping("/adminlogin_form")
	public String adminloginView() {
		return "admin/admin_login";
	}

	// 관리자 로그인 구현
	@PostMapping("/adminlogin")
	public String adminlogin(AdminVO vo, Model model, HttpSession session) {

		int result = adminService.adminCheck(vo);

		if (result == 1) {
			model.addAttribute("admin", adminService.getAdmin(vo.getA_id()));

			return "redirect: admin_main";

		} else if (result == 0) {
			model.addAttribute("errorMessage", "비밀번호가 일치하지 않습니다.");
			return "member/login_fail";

		} else {
			model.addAttribute("errorMessage", "계정이 존재하지 않습니다.");
			return "member/login_fail";

		}

	}

	// 관리자 메인 화면
	@RequestMapping("/admin_main")
	public String adminmain(HttpSession session) {

		AdminVO adminvo = (AdminVO) session.getAttribute("admin");

		if (adminvo == null) {
			return "admin/a_session_fail";
		} else {
			return "admin/admin_main";
		}
	}

	// 로그아웃 처리
	@GetMapping("/adminlogout")
	public String adminlogout(SessionStatus status) {

		status.setComplete();

		return "redirect:adminlogin_form";

	}
	
	//관리자 - 메인 페이지
	@GetMapping("/a_performance_main")
	public String a_performance_main(Total_entVO vo, Model model) {

		List<Booking_Total_entVO> booklist = bookingService.bookingList();

		model.addAttribute("booklist", booklist);

		return "admin/performance/a_performance_main";
	}
	
	//관리자 - 메인 페이지 차트
	@ResponseBody
	@PostMapping(value = "/chart_area_demo", produces = "application/text; charset=utf8")
	public String chart_area_demo(HttpSession session) {
		
		AdminVO adminvo = (AdminVO) session.getAttribute("admin");
		
		if (adminvo == null) {
			return "admin/a_session_fail";
		}
		
		LocalDate currentDate = LocalDate.now();
		int currentMonth = currentDate.getMonthValue();
		int currentYear = currentDate.getYear();

		List<Integer> prices = new ArrayList<>();

		for (int i = 0; i < 13; i++) {
			int month = currentMonth + i;
			int year = currentYear;

			if (month > 12) {
				month = month % 12;
				year++;
			}

			int price = bookingService.sumprice(month, year);
			prices.add(price);
		}

		String pricesString = prices.stream().map(String::valueOf).collect(Collectors.joining(","));

		return pricesString;
	}

	
	//관리자 - 메인 페이지 차트
	@ResponseBody
	@PostMapping(value = "/chart_bar_demo",produces = "application/text; charset=utf8")
	public String chart_bar_demo(HttpSession session) {
		
		AdminVO adminvo = (AdminVO) session.getAttribute("admin");
		
		if (adminvo == null) {
			return "admin/a_session_fail";
		}
		
		LocalDate currentDate = LocalDate.now();
		int currentMonth = currentDate.getMonthValue();
		int currentYear = currentDate.getYear();

		List<Integer> prices = new ArrayList<>();

		for (int i = 0; i < 13; i++) {
			int month = currentMonth + i;
			int year = currentYear;

			if (month > 12) {
				month = month % 12;
				year++;
			}

			int price = bookingService.sumprice(month, year);
			prices.add(price);
		}

		String pricesString = prices.stream().map(String::valueOf).collect(Collectors.joining(","));

		return pricesString;
	}

	
	//관리자 - 공연 메인 페이지 
	@GetMapping("/a_performance_ent_t")
	public String a_performance_ent_t(Total_entVO vo, Model model, HttpSession session) {
		
		AdminVO adminvo = (AdminVO) session.getAttribute("admin");
		
		if (adminvo == null) {
			return "admin/a_session_fail";
		}

		List<Total_entVO> list = total_entService.totalList();

		model.addAttribute("tlist", list);

		return "admin/performance/a_performance_ent_t";
	}

	//
	@GetMapping("/a_performance_ent_f")
	public String a_performance_ent_f(Model model, Total_entVO vo, HttpSession session) {

		AdminVO adminvo = (AdminVO) session.getAttribute("admin");
		
		if (adminvo == null) {
			return "admin/a_session_fail";
		}
		
		List<Total_entVO> list = total_entService.total_entList(vo);

		model.addAttribute("tlist", list);
		model.addAttribute("category", vo.getCategory());

		return "admin/performance/a_performance_ent_f";
	}

	//
	@GetMapping("/a_performance_ent_detail")
	public String a_performance_ent_detail(Total_entVO vo, Model model, HttpSession session) {

		AdminVO adminvo = (AdminVO) session.getAttribute("admin");
		
		if (adminvo == null) {
			return "admin/a_session_fail";
		}

		Total_entVO total_entVO = total_entService.total_entDetail(vo);

		model.addAttribute("total", total_entVO);

		return "admin/performance/a_performance_ent_detail";
	}

	//
	@GetMapping("/a_performance_edit")
	public String a_performance_editF(Total_entVO vo, Model model, HttpSession session) {
		AdminVO adminvo = (AdminVO) session.getAttribute("admin");
		
		if (adminvo == null) {
			return "admin/a_session_fail";
		}

		Total_entVO total_entVO = total_entService.total_entDetail(vo);

		model.addAttribute("total", total_entVO);

		return "admin/performance/a_performance_ent_editF";
	}

	//
	@PostMapping("/a_performance_edit")
	public String a_performance_editAction(Total_entVO vo, Model model, HttpSession session) {
		AdminVO adminvo = (AdminVO) session.getAttribute("admin");
		
		if (adminvo == null) {
			return "admin/a_session_fail";
		}

		total_entService.updatetotalent(vo);

		return "redirect:a_performance_ent_detail?tseq=" + vo.getTseq();
	}

	//
	@ResponseBody
	@PostMapping(value = "/a_performance_deleteAction", produces = "application/text; charset=utf8")
	public String a_performance_deleteAction(AdminVO vo, Total_entVO concertVO, HttpSession session) {

		try {

			AdminVO loginadmin = (AdminVO) session.getAttribute("admin");
			
			if (loginadmin == null) {
				return "admin/a_session_fail";
			}

			
			String message = "";
			if (loginadmin.getA_password().equals(vo.getA_password())) {
				total_entService.deletetotalent(concertVO);

				message = "<script>alert('삭제되었습니다.');location.href='a_performance_ent_t';</script>";

				return message;
			} else {

				return "fail";
			}

		} catch (NullPointerException e) {
			return "<script>alert('로그인 후 이용해주세요.');location.href='adminlogin_form';</script>";
		}
	}

	//
	@GetMapping("/a_performance_ent_insert")
	public String a_performance_ent_insertform(HttpSession session) {
		AdminVO adminvo = (AdminVO) session.getAttribute("admin");
		
		if (adminvo == null) {
			return "admin/a_session_fail";
		}
		
		return "admin/performance/a_performance_ent_insert";
	}

	@PostMapping("/a_performance_ent_insert")
	public String a_performance_ent_insert_action(Total_entVO vo,
			@RequestParam(value = "pimgfile") MultipartFile pimgfile,
			@RequestParam(value = "cimgfile") MultipartFile cimgfile, HttpSession session) {
		
		AdminVO adminvo = (AdminVO) session.getAttribute("admin");
		
		if (adminvo == null) {
			return "admin/a_session_fail";
		}

		if (!pimgfile.isEmpty()) {

			String pimgfilename = pimgfile.getOriginalFilename();
			int pimgindex = pimgfilename.lastIndexOf(".");
			String pimgsubstring = pimgfilename.substring(0, pimgindex);

			String cimgfilename = cimgfile.getOriginalFilename();
			int cimgindex = cimgfilename.lastIndexOf(".");
			String cimgsubstring = cimgfilename.substring(0, cimgindex);

			vo.setPimg(pimgsubstring);
			vo.setCimg(cimgsubstring);

			String image_path = "";

			if (vo.getCategory().equals("1")) {

				image_path = session.getServletContext().getRealPath("WEB-INF/resources/img/concert/");

			} else if (vo.getCategory().equals("2")) {

				image_path = session.getServletContext().getRealPath("WEB-INF/resources/img/theater/");

			} else if (vo.getCategory().equals("3")) {

				image_path = session.getServletContext().getRealPath("WEB-INF/resources/img/museum/");

			}

			try {
				pimgfile.transferTo(new File(image_path + pimgfilename));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				cimgfile.transferTo(new File(image_path + cimgfilename));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		total_entService.inserttotalent(vo);

		return "redirect:a_performance_ent_t";
	}

	//
	@RequestMapping("/a_performance_booking_t")
	public String a_performance_booking_t(Model model, HttpSession session) {
		AdminVO adminvo = (AdminVO) session.getAttribute("admin");
		
		if (adminvo == null) {
			return "admin/a_session_fail";
		}

		List<Booking_Total_entVO> booklist = bookingService.bookingList();

		model.addAttribute("booklist", booklist);

		return "admin/performance/a_performance_booking_t";
	}

	//
	@RequestMapping("/a_performance_booking_f")
	public String a_performance_booking_f(Model model, Total_entVO vo, HttpSession session, 
										@RequestParam("category") String category) {
		AdminVO adminvo = (AdminVO) session.getAttribute("admin");
		
		if (adminvo == null) {
			return "admin/a_session_fail";
		}

		List<Booking_Total_entVO> booklist = bookingService.bookingListcategory(category);

		model.addAttribute("booklist", booklist);
		model.addAttribute("category", category);

		return "admin/performance/a_performance_booking_f";
	}

	//
	@GetMapping("/a_performance_booking_detail")
	public String a_performance_booking_detail(BookingVO vo, Model model, Total_entVO concertVO, HttpSession session) {
		AdminVO adminvo = (AdminVO) session.getAttribute("admin");
		
		if (adminvo == null) {
			return "admin/a_session_fail";
		}

		BookingVO bookingVO = bookingService.bookingdetail(vo);

		concertVO.setTseq(bookingVO.getTseq());

		Total_entVO totalent = total_entService.total_entDetail(concertVO);

		model.addAttribute("bookingVO", bookingVO);
		model.addAttribute("totalent", totalent);

		return "admin/performance/a_performance_booking_detail";
	}

	//
	@PostMapping("/a_performance_booking_edit")
	public String a_performance_booking_edit(BookingVO vo, HttpSession session) {
		AdminVO adminvo = (AdminVO) session.getAttribute("admin");
		
		if (adminvo == null) {
			return "admin/a_session_fail";
		}
		
		bookingService.updatebooking(vo);

		return "redirect:a_performance_booking_t";

	}

	//
	@ResponseBody
	@PostMapping(value = "/a_performance_booking_delete", produces = "application/text; charset=utf8")
	public String a_performance_booking_delete(HttpSession session, BookingVO bookingVO, 
									HttpServletResponse response, AdminVO vo) {
		AdminVO adminvo = (AdminVO) session.getAttribute("admin");
		
		if (adminvo == null) {
			return "admin/a_session_fail";
		}
		
		try {

			AdminVO loginadmin = (AdminVO) session.getAttribute("admin");
			String message = "";
			response.setContentType("text/html; charset=UTF-8");
			if (loginadmin.getA_password().equals(vo.getA_password())) {

				bookingService.adeletebooking(bookingVO);
				message = "<script>alert('삭제되었습니다.');location.href='a_performance_booking_t';</script>";

				return message;
			} else {

				return "fail";
			}

		} catch (NullPointerException e) {
			return "<script>alert('로그인 후 이용해주세요.');location.href='adminlogin_form';</script>";
		}
	}

	// 관리자 - 회원 전체 리스트
	@GetMapping("/a_member_main")
	public String a_member_main(Model model, HttpSession session) {
		AdminVO adminvo = (AdminVO) session.getAttribute("admin");
		
		if (adminvo == null) {
			return "admin/a_session_fail";
		}
		
		List<MemberVO> memberlist = memberService.memberlist();

		model.addAttribute("memberlist", memberlist);

		return "admin/member/a_member_main";
	}

	// 관리자 - 회원 상세 정보
	@GetMapping("/a_member_detail")
	public String a_member_detail(Model model, MemberVO membervo, HttpSession session) {
		AdminVO adminvo = (AdminVO) session.getAttribute("admin");
		
		if (adminvo == null) {
			return "admin/a_session_fail";
		}
		
		MemberVO member = memberService.getMember(membervo.getId());

		model.addAttribute("membervo", member);

		return "admin/member/a_member_detail";
	}

	// 관리자 - 회원 상세 정보 수정
	@GetMapping(value = "/a_member_updateF")
	public String updateMemberF(Model model, MemberVO membervo, HttpSession session) {
		AdminVO adminvo = (AdminVO) session.getAttribute("admin");
		
		if (adminvo == null) {
			return "admin/a_session_fail";
		}
		
		MemberVO member = memberService.getMember(membervo.getId());

		model.addAttribute("membervo", member);

		return "admin/member/a_member_updateF";
	}

	// 관리자 - 회원 상세 정보 수정 처리
	@PostMapping("/a_member_editt")
	public String updateMember(MemberVO membervo, Model model, HttpSession session) {
		AdminVO adminvo = (AdminVO) session.getAttribute("admin");
		
		if (adminvo == null) {
			return "admin/a_session_fail";
		}
		
		memberService.updateMember(membervo);

		return "redirect:a_member_detail?id=" + membervo.getId();
	}

	// 관리자- 회원 삭제
	@ResponseBody
	@PostMapping(value = "/a_member_delete", produces = "application/text; charset=utf-8")
	public String a_member_delete(HttpSession session, MemberVO memberVO, AdminVO vo) throws Exception {
		AdminVO adminvo = (AdminVO) session.getAttribute("admin");
		
		if (adminvo == null) {
			return "admin/a_session_fail";
		}
		
		try {

			AdminVO loginadmin = (AdminVO) session.getAttribute("admin");
			String message = "";
			if (loginadmin.getA_password().equals(vo.getA_password())) {

				memberService.deleteMember(memberVO.getId());
				bookingService.deleteBookingfromid(memberVO.getId());
				message = "<script>alert('삭제되었습니다.');location.href='a_member_main';</script>";
				return message;
			} else {
				return "fail";
			}
		} catch (NullPointerException e) {
			return "<script>alert('로그인 후 이용해주세요.');location.href='adminlogin_form';</script>";
		}
	}

	// 관리자 - 공지사항 리스트
	@GetMapping("/a_notice_main")
	public String a_notice_main(NoticeVO noticevo, Model model, HttpSession session) {
		AdminVO adminvo = (AdminVO) session.getAttribute("admin");
		
		if (adminvo == null) {
			return "admin/a_session_fail";
		}
		
		List<NoticeVO> noticeList = noticeService.noticeList();

		model.addAttribute("noticeList", noticeList);

		return "admin/notice/a_notice_main";
	}

	// 공지사항 상세
	@RequestMapping("/a_notice_detail")
	public String noticeDetail(NoticeVO noticevo, Model model, HttpSession session) {
		AdminVO adminvo = (AdminVO) session.getAttribute("admin");
		
		if (adminvo == null) {
			return "admin/a_session_fail";
		}
		
		NoticeVO notice = noticeService.noticeDetail(noticevo.getNseq());

		model.addAttribute("noticevo", notice);

		return "admin/notice/a_notice_detail";
	}

	// 공지사항 작성 form
	@GetMapping("/a_notice_insertF")
	public String noticeInsertF(Model model, HttpSession session) {

		AdminVO admin = (AdminVO) session.getAttribute("admin");
		
		if (admin == null) {
			return "admin/a_session_fail";
		}

		model.addAttribute("a_id", admin.getA_id());

		return "admin/notice/a_notice_insertF";
	}


	//공지사항 작성 처리
	@PostMapping(value="/a_notice_insert")
	public String noticeInsert(NoticeVO noticevo, HttpSession session) {
		AdminVO adminvo = (AdminVO) session.getAttribute("admin");
		
		if (adminvo == null) {
			return "admin/a_session_fail";
		}
		
		noticeService.noticeInsert(noticevo);

		return "redirect:a_notice_main";
	}

	// 공지사항 수정 form
	@RequestMapping("/a_notice_updateF")
	public String noticeUpdateF(Model model, NoticeVO noticevo, HttpSession session) {
		AdminVO adminvo = (AdminVO) session.getAttribute("admin");
		
		if (adminvo == null) {
			return "admin/a_session_fail";
		}
		
		NoticeVO notice = noticeService.noticeDetail(noticevo.getNseq());

		model.addAttribute("noticevo", notice);

		return "admin/notice/a_notice_updateF";
	}

	// 공지사항 수정 처리
	@RequestMapping("/a_notice_update")
	public String noticeUpdate(Model model, NoticeVO noticevo, HttpSession session) {
		AdminVO adminvo = (AdminVO) session.getAttribute("admin");
		
		if (adminvo == null) {
			return "admin/a_session_fail";
		}
		
		noticeService.noticeUpdate(noticevo);

		return "redirect:a_notice_detail?nseq=" + noticevo.getNseq();
	}

	// 공지사항 삭제 페이지
	@RequestMapping("/a_notice_deleteF")
	public String noticeDeleteF(Model model, HttpSession session) {

		AdminVO adminvo = (AdminVO) session.getAttribute("admin");

		if (adminvo == null) {
			return "admin/a_session_fail";
		}
		
		model.addAttribute("adminvo", adminvo);

		return "admin/notice/a_notice_deleteF";
	}

	// 공지사항 삭제 페이지
	@RequestMapping("/a_notice_delete")
	public String noticeDelete(Model model, NoticeVO noticevo, HttpSession session) {
		AdminVO adminvo = (AdminVO) session.getAttribute("admin");

		if (adminvo == null) {
			return "admin/a_session_fail";
		}
		
		noticeService.noticeDelete(noticevo.getNseq());

		return "redirect:a_notice_main";
	}

	// 관리자 - 리뷰 리스트
	@GetMapping("/a_review_main")
	public String a_review_main(Model model, HttpSession session) {
		AdminVO adminvo = (AdminVO) session.getAttribute("admin");

		if (adminvo == null) {
			return "admin/a_session_fail";
		}
		
		List<Review_Total_entVO> reviewlist = reviewService.reviewMemberlist();

		model.addAttribute("reviewlist", reviewlist);

		return "admin/review/a_review_main";
	}

	// 관리자 - 리뷰 디테일
	@GetMapping("/a_review_detail")
	public String a_review_detail(Model model, Review_Total_entVO totalentvo, HttpSession session) {
		AdminVO adminvo = (AdminVO) session.getAttribute("admin");

		if (adminvo == null) {
			return "admin/a_session_fail";
		}
		
		Review_Total_entVO total = reviewService.reviewDetail(totalentvo.getRseq());

		model.addAttribute("reviewvo", total);

		return "admin/review/a_review_detail";
	}

	// 관리자- 리뷰 삭제
	@GetMapping("/a_review_delete")
	public String a_review_delete(ReviewVO reviewvo, HttpSession session) {
		AdminVO adminvo = (AdminVO) session.getAttribute("admin");

		if (adminvo == null) {
			return "admin/a_session_fail";
		}
		
		reviewService.deleteReview(reviewvo.getRseq());

		return "redirect:a_review_main";
	}

}
