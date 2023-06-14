package com.ezen.view;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.ezen.biz.dto.AdminVO;
import com.ezen.biz.service.AdminService;

@Controller
@SessionAttributes("admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
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
		
		} else {
			if (result == 0 || result == -1) {
				model.addAttribute("message", "아이디, 비밀번호를 확인해 주세요.");
			} 

			return "admin/admin_login";
		}
	}
	
	//로그아웃 처리
	@GetMapping("/adminlogout")
	public String adminlogout(SessionStatus status ) {
			
		status.setComplete();
		return "admin/admin_login";
	}
	
	@GetMapping("/a_performance_main")
	public String a_performance_main() {
		
		return "admin/performance/a_performance_main";
	}
	
	@GetMapping("/a_member_main")
	public String a_member_main() {
		
		return "admin/member/a_member_main";
	}
	
	@GetMapping("/a_notice_main")
	public String a_notice_main() {
		
		return "admin/notice/a_notice_main";
	}
	
	@GetMapping("/a_review_main")
	public String a_review_main() {
		
		return "admin/review/a_review_main";
	}
}
