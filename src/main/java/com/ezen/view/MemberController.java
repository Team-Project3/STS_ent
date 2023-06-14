package com.ezen.view;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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

import com.ezen.biz.dto.BookingVO;
import com.ezen.biz.dto.MemberVO;
import com.ezen.biz.dto.ReviewVO;
import com.ezen.biz.dto.totalbookVO;
import com.ezen.biz.dto.totalentVO;
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

	//ȸ������ ȭ��
	@RequestMapping("/signup_form")
	public String signupView() {
		return "member/signup";
	}
	
	//ȸ������ ó��
	@RequestMapping("/signup")
	public String signupAction(MemberVO vo) {

	    memberService.insertMember(vo);
	    
	    return "member/login";

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
		
		reviewvo.setId(membervo.getId());
		bookingvo.setId(membervo.getId());
		
		//���� ����Ʈ
		List<totalentVO> list = reviewService.reviewMember(reviewvo);
		
		//���� ����Ʈ
		List<totalbookVO> bookinglist = bookingService.bookingMember(bookingvo);
			List<totalbookVO> concertList = new ArrayList<>();
			List<totalbookVO> theaterList = new ArrayList<>();
			List<totalbookVO> exhibitionList = new ArrayList<>();
		
		for (totalbookVO booking : bookinglist) {
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
		
		//���� ����
		

		
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
		
		System.out.println(vo);
		model.addAttribute("loginUser", memberService.getMember(vo.getId()));
		model.addAttribute("membervo",vo);
		return "redirect:mypage";
	}
	
	//my page ����
	@RequestMapping(value="/mypage_deleteF")
	public String deleteMemberF(Model model, HttpSession session) {
		
		MemberVO membervo = (MemberVO) session.getAttribute("loginUser");
		
		model.addAttribute("membervo", membervo);
		return "member/mypage_deleteF";
	}
	
	@RequestMapping(value = "/mypage_delete", method = RequestMethod.GET)
	public String deleteMember(SessionStatus status,HttpSession session) throws Exception {
	    
		MemberVO membervo = (MemberVO) session.getAttribute("loginUser");
		
			 memberService.deleteMember(membervo.getId());
			 
			 status.setComplete();
			 
			 return "redirect:index";
	}	
}
