package com.ezen.view;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.ezen.biz.dto.MemberVO;
import com.ezen.biz.service.MemberService;

@Controller
@SessionAttributes("loginUser")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	//로그인 화면
	@GetMapping("/login_form")
	public String loginView() {
		return "member/login";
	}
	
	//로그인 처리
	@PostMapping("/login")
	public String loginAction(MemberVO vo, Model model) {
		int result = memberService.loginID(vo);
		
		if(result == 1) {
			model.addAttribute("loginUser", memberService.getMember(vo.getId()));
			return "redirect:index"; // 로그인 성공시
		} else if(result == 0) {
			model.addAttribute("errorMessage", "비밀번호가 일치하지 않습니다.");
			return "member/login_fail";
		} else {
			model.addAttribute("errorMessage", "계정이 존재하지 않습니다.");
			return "member/login_fail"; // 로그인 실패시
		}
	}

	//회원가입 화면
	@RequestMapping("/signup_form")
	public String signupView() {
		return "member/signup";
	}
	
	//회원가입 처리
	@RequestMapping("/signup")
	public String signupAction(MemberVO vo) {

	    memberService.insertMember(vo);
	    
	    return "member/login";

	}
	
	//id 중복체크
	@RequestMapping(value="/id_check_form")
	public String idCheckView(MemberVO vo, Model model) {
		int result = memberService.confirmID(vo.getId());
		
		model.addAttribute("messege", result);
		model.addAttribute("id", vo.getId());
		
		return "member/idcheck";
	}
	
	@PostMapping("/id_check_form")
	public String idCheckAString(MemberVO vo, Model model) {
		
		// id 중복확인 조회  , DAO로 가서 id값을 확인
		int result = memberService.confirmID(vo.getId());
		
		model.addAttribute("message", result);
		model.addAttribute("id", vo.getId());
		
		return "member/idcheck";
			
	}
	
	//로그아웃 처리
	@GetMapping("/logout")
	public String logout(SessionStatus status ) {
		
		status.setComplete();
		return "index";
	}
	
	@GetMapping("/mypage")
	public String mypage() {
		
		return "member/mypage";
	}
}
