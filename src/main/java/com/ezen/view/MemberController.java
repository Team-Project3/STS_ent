package com.ezen.view;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.ParseException;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		} else {
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
	public String signupAction(MemberVO vo, @RequestParam("birth") @DateTimeFormat(pattern = "yyyy/MM/dd") String birth) throws java.text.ParseException {
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
	    try {
	        Date birthDate = dateFormat.parse(birth);
	        vo.setBirth(birthDate);
	    } catch (ParseException e) {
	        // 날짜 변환 실패 처리
	        e.printStackTrace();
	    }
	    
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
	
}
