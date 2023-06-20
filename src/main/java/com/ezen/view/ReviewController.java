package com.ezen.view;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ezen.biz.dto.MemberVO;
import com.ezen.biz.dto.ReviewVO;
import com.ezen.biz.service.MemberService;
import com.ezen.biz.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/reviews")
public class ReviewController {
	
	/**
	 * Slf4j Logger
	 */
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);

	
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private MemberService memberService;
	
	
	// 리뷰 리스트
	@GetMapping("/list")
	public Map<String, Object> reciewList(ReviewVO vo) {
		
		Map<String, Object> reviewInfo = new HashMap<>();
				
		List<ReviewVO> reviewList = reviewService.reviewList(vo.getTseq());
		
		reviewInfo.put("total", reviewList.size());
		reviewInfo.put("commentList", reviewList);
		
		// 두개의 값을 넣은 commentInfo를 리턴해준다
		return reviewInfo;
	}
	
	// 리뷰 등록
	@PostMapping("/save")
	public String saveComment(ReviewVO vo, HttpSession session) {
		// 로그인이 되어 있는지 확인
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		//sysout 같은거임
		logger.info(vo.toString());
		
		// 로그인이 안되어 있는 경우 로그인 페이지로 이동
		if (loginUser == null) {
			return "login_form";
			
		} else {
			vo.setId(loginUser.getId());
			reviewService.saveReview(vo);
			
			return "success";
		}
	}
}
