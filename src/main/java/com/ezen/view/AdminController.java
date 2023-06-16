package com.ezen.view;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.ezen.biz.dto.AdminVO;
import com.ezen.biz.dto.ConcertVO;
import com.ezen.biz.dto.MemberVO;
import com.ezen.biz.dto.NoticeVO;
import com.ezen.biz.dto.totalbookVO;
import com.ezen.biz.dto.totalentVO;
import com.ezen.biz.service.AdminService;
import com.ezen.biz.service.BookingService;
import com.ezen.biz.service.ConcertService;
import com.ezen.biz.service.MemberService;
import com.ezen.biz.service.NoticeService;
import com.ezen.biz.service.ReviewService;

@Controller
@SessionAttributes("admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	@Autowired
	private ConcertService concertService;
	@Autowired
	private BookingService bookingService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private ReviewService reviewService;
	
	//관리자 로그인 화면
	@GetMapping("/adminlogin_form")
	public String adminloginView() {
		return "admin/admin_login";
	}
	
	//관리자 로그인 구현
	@PostMapping("/adminlogin")
	public String adminlogin(AdminVO vo, Model model) {
		int result = adminService.adminCheck(vo);
		
		if (result == 1) {
			model.addAttribute("admin", adminService.getAdmin(vo.getA_id()));
			return "admin/admin_main";
		
		} else if (result == 0) {
			model.addAttribute("errorMessage", "비밀번호가 일치하지 않습니다.");
			return "member/login_fail";
			
		} else {
			model.addAttribute("errorMessage", "계정이 존재하지 않습니다.");
			return "member/login_fail";
			
		}
	}
	
	//관리자 메인 화면
	@RequestMapping("/admin_main")
	public String adminmain(HttpSession session) {
		
		return "admin/admin_main";
	}
	
	//로그아웃 처리
	@GetMapping("/adminlogout")
	public String adminlogout(SessionStatus status ) {
				
		status.setComplete();
		return "redirect:adminlogin_form";

	}

	@GetMapping("/a_performance_main")
	public String a_performance_main(ConcertVO vo,Model model) {
		
		List<totalbookVO> booklist = bookingService.bookingList();
		
		model.addAttribute("booklist",booklist);
		
		return "admin/performance/a_performance_main";
	}
	
	//
	@GetMapping("/a_performance_ent_t")
	public String a_performance_ent_t(ConcertVO vo,Model model) {
		
		List<ConcertVO> list = concertService.AllList();
		
		model.addAttribute("tlist",list);
		
		return "admin/performance/a_performance_ent_t";
	}
	
	//
	@GetMapping("/a_performance_ent_f")
	public String a_performance_ent_f(Model model,@RequestParam("category")String category) {
		
		List<ConcertVO> list = concertService.categoryList(category);
		
		model.addAttribute("tlist",list);
		model.addAttribute("category",category);
		
		return "admin/performance/a_performance_ent_f";
	}
	
	//
	@RequestMapping("/a_performance_booking_t")
	public String a_performance_booking_t(Model model) {
		
		List<totalbookVO> booklist = bookingService.bookingList();
		
		model.addAttribute("booklist",booklist);
		
		return "admin/performance/a_performance_booking_t";
	}
	
	//
	@RequestMapping("/a_performance_booking_f")
	public String a_performance_booking_f(Model model,ConcertVO vo,@RequestParam("category")String category) {
		
		List<totalbookVO> booklist = bookingService.bookingListcategory(category);
		
		model.addAttribute("booklist",booklist);
		model.addAttribute("category",category);
		
		return "admin/performance/a_performance_booking_f";
	}
	
	//관리자 - 회원 전체 리스트
	@GetMapping("/a_member_main")
	public String a_member_main(Model model) {
		
		List<MemberVO> memberlist = memberService.memberlist();
		
		model.addAttribute("memberlist",memberlist);
		
		return "admin/member/a_member_main";
	}
	
	//관리자 - 회원 상세 정보
	@GetMapping("/a_member_detail")
	public String a_member_detail(Model model, MemberVO membervo) {
		System.out.println("/a_member_detail api 호출");
		
		MemberVO member = memberService.getMember(membervo.getId());
		
		model.addAttribute("membervo", member);

		return "admin/member/a_member_detail";
	}
	
	//관리자 - 회원 상세 정보 수정
	@RequestMapping(value="/a_member_editF")
	public String updateMemberF(Model model, MemberVO membervo) {
		
		MemberVO member = memberService.getMember(membervo.getId());

		model.addAttribute("membervo", member);

		return "admin/member/a_member_editF";
	}
	
	//관리자 - 회원 상세 정보 수정 처리
	@PostMapping("/a_member_editt")
	public String updateMember(MemberVO membervo, Model model) {
		System.out.println("/a_member_edit api 호출");
			
		System.out.println(membervo);
		
		memberService.updateMember(membervo);
		System.out.println("업데이트 완료");
		
		return "redirect:a_member_detail?id="+membervo.getId();
	}
	
	//관리자 - 공지사항 리스트
	@GetMapping("/a_notice_main")
	public String a_notice_main(NoticeVO vo, Model model) {
		
		List<NoticeVO> noticeList = noticeService.noticeList();
		
		model.addAttribute("noticeList", noticeList);
		
		return "admin/notice/a_notice_main";
	}
	
	//공지사항 상세
	@RequestMapping("/a_notice_detail")
	public String noticeDetail(NoticeVO vo, Model model) {
		
		NoticeVO notice = noticeService.noticeDetail(vo);
		
		model.addAttribute("notice", notice);
		System.out.println(notice);
		
		return "admin/notice/a_notice_detail";
	}
	
	//공지사항 작성 form
	@GetMapping("/a_notice_insertF")
	public String noticeInsertF(Model model, HttpSession session) {
		
		
		AdminVO admin = (AdminVO)session.getAttribute("admin");
		
		model.addAttribute("a_id", admin.getA_id());
		
		return "admin/notice/a_notice_insertF";
	}
	
	//공지사항 작성 form
	@RequestMapping("/a_notice_insert")
	public String noticeInsert(Model model, NoticeVO noticevo) {
		
		noticeService.noticeInsert(noticevo);
		
		return "redirect:a_notice_main";
	}
	
	//관리자 - 리뷰 리스트
	@GetMapping("/a_review_main")
	public String a_review_main(Model model) {
		
		List<totalentVO> reviewlist = reviewService.reviewMemberlist();
		
		model.addAttribute("reviewlist", reviewlist);
		
		return "admin/review/a_review_main";
	}
}
