package com.ezen.view;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.ezen.biz.dto.AdminVO;
import com.ezen.biz.dto.BookingVO;
import com.ezen.biz.dto.MemberVO;
import com.ezen.biz.dto.ReviewVO;
import com.ezen.biz.dto.Booking_Total_entVO;
import com.ezen.biz.dto.Review_Total_entVO;
import com.ezen.biz.dto.Total_entVO;
import com.ezen.biz.service.BookingService;
import com.ezen.biz.service.MemberService;
import com.ezen.biz.service.ReviewService;

@Controller
@SessionAttributes("loginUser")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private BookingService bookingService;
	
	//�α��� ȭ��
	@GetMapping("/login_form")
	public String loginView() {
		return "member/login";
	}
	
	//�α��� ó��
	@PostMapping("/login")
	public String loginAction(MemberVO vo, Model model) {
		int result = memberService.loginID(vo);
		
		if(result == 1) {
			model.addAttribute("loginUser", memberService.getMember(vo.getId()));
			return "redirect:index"; // �α��� ������
		} else if(result == 0) {
			model.addAttribute("errorMessage", "��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			return "member/login_fail";
		} else {
			model.addAttribute("errorMessage", "������ �������� �ʽ��ϴ�.");
			return "member/login_fail"; // �α��� ���н�
		}
	}
	
	@RequestMapping("/naverlogin")
	public String naverlogin() {
		
		return "member/naverlogin";
	}

	//ȸ������ ȭ��
	@RequestMapping("/signup_form")
	public String signupView() {
		return "member/signup";
	}
	
	//ȸ������ ó��
	@RequestMapping("/signup")
	public String signupAction(MemberVO vo) {

	    memberService.insertMember(vo);
	    
	    return "redirect:login_form";

	}
	
	//id �ߺ�üũ
	@RequestMapping(value="/id_check_form")
	public String idCheckView(MemberVO vo, Model model) {
		int result = memberService.confirmID(vo.getId());
		
		model.addAttribute("messege", result);
		model.addAttribute("id", vo.getId());
		
		return "member/idcheck";
	}
	
	@PostMapping("/id_check_form")
	public String idCheckAString(MemberVO vo, Model model) {
		
		// id �ߺ�Ȯ�� ��ȸ  , DAO�� ���� id���� Ȯ��
		int result = memberService.confirmID(vo.getId());
		
		model.addAttribute("message", result);
		model.addAttribute("id", vo.getId());
		
		return "member/idcheck";
			
	}
	
	//�α׾ƿ� ó��
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		
		status.setComplete();
		return "index";
	}
	
	
	//���̵� ã�� â ����
	@RequestMapping("/find_id_form")
	public String findIdFormView() {
		return "member/findIdAndPassword";
	}
		
	//���̵� ã��
	@RequestMapping("/find_id")
	public String findIdAction(MemberVO vo, Model model) {
		String id = memberService.selectIdByNameEmail(vo);
				
		if(id != null) { //���̵� ����
			model.addAttribute("id", id);
			model.addAttribute("message", 1);
		} else {
			model.addAttribute("message", -1);
		}
		return "member/findResult";
	}
	
	//��й�ȣ ã��
	@RequestMapping("/find_pwd")
	public String findPwdAction(MemberVO vo, Model model) {
				
		String pwd = memberService.selectPwdByIdNameEmail(vo);
				
		if(pwd != null) { //�����ϴ� ID ���
			model.addAttribute("id", vo.getId());
			model.addAttribute("message", 1);
		} else {
			model.addAttribute("message", -1);
		}
		return "member/findPwdResult";
	}
			
	//��� ã�� �� �� ��й�ȣ ����
	@PostMapping("/change_pwd")
	public String changePwdAction(MemberVO vo) {
				
		memberService.changePwd(vo);
				
		return "member/changePwdOk";
	}
	
	
	//my page
	@RequestMapping("/mypage")
	public String mypage(MemberVO vo, Model model, HttpSession session, ReviewVO reviewvo, BookingVO bookingvo) {
		
		MemberVO membervo = (MemberVO)session.getAttribute("loginUser");
		
		if(membervo == null) {
			return "member/session_fail"; 
		} 
		
		reviewvo.setId(membervo.getId());
		bookingvo.setId(membervo.getId());
		
		//���� ����Ʈ
		List<Review_Total_entVO> list = reviewService.reviewMember(reviewvo);
		
		//���� ����Ʈ
		List<Booking_Total_entVO> bookinglist = bookingService.bookingMember(bookingvo);
			List<Booking_Total_entVO> concertList = new ArrayList<>();
			List<Booking_Total_entVO> theaterList = new ArrayList<>();
			List<Booking_Total_entVO> exhibitionList = new ArrayList<>();
		
		for (Booking_Total_entVO booking : bookinglist) {
		    if (booking.getCategory() == 1) {
		        concertList.add(booking);
		    } else if (booking.getCategory() == 2) {
		        theaterList.add(booking);
		    } else if (booking.getCategory() == 3) {
		        exhibitionList.add(booking);
		    } else if (booking.getCategory() == 0) {
		    	concertList = new ArrayList<>();
		    	theaterList = new ArrayList<>();
		    	exhibitionList = new ArrayList<>();
		    }
		}
		if (list.isEmpty()) {
	        model.addAttribute("noReviewMessage", "�ۼ��� ���䰡 �����ϴ�.");
	    }
				
		model.addAttribute("reviewmemberlist", list);
		model.addAttribute("concertList", concertList);
		model.addAttribute("theaterList", theaterList);
		model.addAttribute("exhibitionList", exhibitionList);
		model.addAttribute("membervo", membervo);
		
		return "member/mypage";
	}
	
	//my page ����
	@RequestMapping(value="/mypage_updateF")
	public String updateMemberF(Model model, HttpSession session) {
		MemberVO membervo = (MemberVO)session.getAttribute("loginUser");
		
		model.addAttribute("membervo", membervo);
		
		return "member/mypage_updateF";
	}
	
	//my page ���� ó��
	@RequestMapping("/mypage_update")
	public String updateMember(MemberVO vo, HttpSession session, Model model) {
	
		memberService.updateMember(vo);
		
		model.addAttribute("loginUser", memberService.getMember(vo.getId()));
		model.addAttribute("membervo",vo);
		return "redirect:mypage";
	}
	
	//my page - ȸ�� Ż�� ó��
	@ResponseBody
	@PostMapping(value = "/member_delete", produces = "application/text; charset=utf8")
	public String member_delete(MemberVO vo, HttpSession session,SessionStatus status) throws Exception {

		try {

			MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
			String message = "";
			if (loginUser.getPassword().equals(vo.getPassword())) {
				
				memberService.deleteMember(loginUser.getId());
				bookingService.deleteBookingfromid(loginUser.getId());
				status.setComplete();
				message = "<script>alert('�����Ǿ����ϴ�. ���� ���񽺸� �̿����ּż� �����߽��ϴ�.');location.href='index';</script>";

				return message;
			} else {

				return "fail";
			}

		} catch (NullPointerException e) {
			return "<script>alert('�α��� �� �̿����ּ���.');location.href='login_form';</script>";
		}
	}
	
	//���� ����
	@RequestMapping(value="/reviewDelete",method = RequestMethod.GET)
	public String reviewDelete(HttpSession session,
								@RequestParam("rseq")int rseq,ReviewVO reviewVO) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		
		reviewVO.setId(loginUser.getId());
		reviewVO.setRseq(rseq);
		
		reviewService.deleteReview(reviewVO.getRseq());
		
		return "redirect:mypage";
	}
	
	//���� ����
	@RequestMapping(value="/reservationDelete",method = RequestMethod.GET)
	public String reservationDelete(HttpSession session, BookingVO bookingvo,
										@RequestParam("bseq") int bseq)	{
				
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		bookingvo.setBseq(bseq);
		bookingvo.setId(loginUser.getId());
		
		bookingService.deleteBooking(bookingvo);
		
		return "redirect:mypage";
	}
}