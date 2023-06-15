package com.ezen.view;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.biz.dto.NoticeVO;
import com.ezen.biz.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/notice")
	public String noticeMain(NoticeVO vo, Model model) {
		
		List<NoticeVO> noticeList = noticeService.noticeList();
		
		model.addAttribute("noticeList", noticeList);
		
		
		return "notice/notice_main";
	}
	
	
}
