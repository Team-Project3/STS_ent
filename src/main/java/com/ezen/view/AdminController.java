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
import com.ezen.biz.dto.ReviewVO;
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
	
	//������ �α��� ȭ��
	@GetMapping("/adminlogin_form")
	public String adminloginView() {
		return "admin/admin_login";
	}
	
	//������ �α��� ����
	@PostMapping("/adminlogin")
	public String adminlogin(AdminVO vo, Model model, HttpSession session) {
		
		int result = adminService.adminCheck(vo);
		
		if (result == 1) {
			model.addAttribute("admin", adminService.getAdmin(vo.getA_id()));
			return "redirect: admin_main";
		
		} else if (result == 0) {
			model.addAttribute("errorMessage", "��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			return "member/login_fail";
			
		} else {
			model.addAttribute("errorMessage", "������ �������� �ʽ��ϴ�.");
			return "member/login_fail";
		}
		
	}
	
	//������ ���� ȭ��
	@RequestMapping("/admin_main")
	public String adminmain(HttpSession session) {
		
		AdminVO adminvo = (AdminVO)session.getAttribute("admin");
		
		if(adminvo == null) {
			return "admin/a_session_fail";
		} else {
			return "admin/admin_main";
		}
	}
	
	//�α׾ƿ� ó��
	@GetMapping("/adminlogout")
	public String adminlogout(SessionStatus status) {
				
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
	
	//������ - ȸ�� ��ü ����Ʈ
	@GetMapping("/a_member_main")
	public String a_member_main(Model model) {
		
		List<MemberVO> memberlist = memberService.memberlist();
		
		model.addAttribute("memberlist",memberlist);
		
		return "admin/member/a_member_main";
	}
	
	//������ - ȸ�� �� ����
	@GetMapping("/a_member_detail")
	public String a_member_detail(Model model, MemberVO membervo) {
		System.out.println("/a_member_detail api ȣ��");
		
		MemberVO member = memberService.getMember(membervo.getId());
		
		model.addAttribute("membervo", member);

		return "admin/member/a_member_detail";
	}
	
	//������ - ȸ�� �� ���� ����
	@RequestMapping(value="/a_member_editF")
	public String updateMemberF(Model model, MemberVO membervo) {
		
		MemberVO member = memberService.getMember(membervo.getId());

		model.addAttribute("membervo", member);

		return "admin/member/a_member_editF";
	}
	
	//������ - ȸ�� �� ���� ���� ó��
	@PostMapping("/a_member_editt")
	public String updateMember(MemberVO membervo, Model model) {
		System.out.println("/a_member_edit api ȣ��");
			
		System.out.println(membervo);
		
		memberService.updateMember(membervo);
		System.out.println("������Ʈ �Ϸ�");
		
		return "redirect:a_member_detail?id="+membervo.getId();
	}
	
	//������ - �������� ����Ʈ
	@GetMapping("/a_notice_main")
	public String a_notice_main(NoticeVO noticevo, Model model) {
		
		List<NoticeVO> noticeList = noticeService.noticeList();
		
		model.addAttribute("noticeList", noticeList);
		
		return "admin/notice/a_notice_main";
	}
	
	//�������� ��
	@RequestMapping("/a_notice_detail")
	public String noticeDetail(NoticeVO noticevo, Model model) {
		
		NoticeVO notice = noticeService.noticeDetail(noticevo.getNseq());
		
		model.addAttribute("noticevo", notice);
		System.out.println(notice);
		
		return "admin/notice/a_notice_detail";
	}
	
	//�������� �ۼ� form
	@GetMapping("/a_notice_insertF")
	public String noticeInsertF(Model model, HttpSession session) {
		
		AdminVO admin = (AdminVO)session.getAttribute("admin");
		
		model.addAttribute("a_id", admin.getA_id());
		
		return "admin/notice/a_notice_insertF";
	}
	
	//�������� �ۼ� ó��
	@RequestMapping("/a_notice_insert")
	public String noticeInsert(NoticeVO noticevo) {
		
		noticeService.noticeInsert(noticevo);
		
		return "redirect:a_notice_main";
	}
	
	//�������� ���� form
	@RequestMapping("/a_notice_updateF")
	public String noticeUpdateF(Model model, NoticeVO noticevo) {
		
		NoticeVO notice = noticeService.noticeDetail(noticevo.getNseq());
		
		System.out.println(noticevo);
		
		model.addAttribute("noticevo", notice);
		
		return "admin/notice/a_notice_updateF";
	}
	
	//�������� ���� ó��
	@RequestMapping("/a_notice_update")
	public String noticeUpdate(Model model, NoticeVO noticevo) {
		
		System.out.println(noticevo);
		
		noticeService.noticeUpdate(noticevo);
		
		return "redirect:a_notice_detail?nseq=" + noticevo.getNseq();
	}
	
	//�������� ���� ������
	@RequestMapping("/a_notice_deleteF")
	public String noticeDeleteF(Model model, HttpSession session) {
		
		AdminVO adminvo = (AdminVO)session.getAttribute("admin");
		
		model.addAttribute("adminvo", adminvo);
		
		return "admin/notice/a_notice_deleteF";
	}
	
	//�������� ���� ������
	@RequestMapping("/a_notice_delete")
	public String noticeDelete(Model model, NoticeVO noticevo) {
		
		noticeService.noticeDelete(noticevo.getNseq());
		
		return "redirect:a_notice_main";
	}
	
	
	//������ - ���� ����Ʈ
	@GetMapping("/a_review_main")
	public String a_review_main(Model model) {
		
		List<totalentVO> reviewlist = reviewService.reviewMemberlist();
		
		model.addAttribute("reviewlist", reviewlist);
		
		return "admin/review/a_review_main";
	}
	
	//������ - ���� ������
	@GetMapping("/a_review_detail")
	public String a_review_detail(Model model, totalentVO totalentvo) {
		
		totalentVO total = reviewService.reviewDetail(totalentvo.getRseq());
		
		model.addAttribute("reviewvo", total);
		System.out.println(total);
		
		return "admin/review/a_review_detail";
	}
	
	
}
