package com.ezen.view;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.biz.dto.ConcertVO;
import com.ezen.biz.dto.MemberVO;
import com.ezen.biz.dto.MuseumVO;
import com.ezen.biz.dto.TheaterVO;
import com.ezen.biz.service.MuseumService;

@Controller
public class MuseumController {
	
	@Autowired
	private MuseumService museumService;
	
	//����ȸ ������ - ����ȸ ����Ʈ
	@RequestMapping("/museum_main")
	public String museumList(MuseumVO vo, Model model) {
		
		List<MuseumVO> list = museumService.museumList();
		
		model.addAttribute("museumList", list);
		
		return "museum/museum_main";
	}
	
	//����ȸ ������ ȭ��
	@RequestMapping("/museum_detail")
	public String museumdetail(MuseumVO vo, Model model, HttpSession session) {
		
		MemberVO membervo = (MemberVO) session.getAttribute("loginUser");
		
		MuseumVO museum = museumService.museumDetail(vo);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		String formattedSDate = sdf.format(museum.getSdate());
		String formattedEDate = sdf.format(museum.getEdate());

		
		model.addAttribute("membervo", membervo);
		model.addAttribute("formattedSDate",formattedSDate);
		model.addAttribute("formattedEDate",formattedEDate);
		
		model.addAttribute("museum", museum);

		return "museum/museum_detail";
	}

	//����ȸ ����
	@RequestMapping("/museum_booking")
	public String museumbooking(MuseumVO vo, Model model, HttpSession session,
								@RequestParam("dday") String dday,
								@RequestParam("time") String time) {
		MemberVO membervo = (MemberVO) session.getAttribute("loginUser");
		
		MuseumVO museum = museumService.museumDetail(vo);
			
		model.addAttribute("membervo", membervo);
		model.addAttribute("museum", museum);
		model.addAttribute("dday", dday);
		model.addAttribute("time", time);
		
		return "museum/museum_booking";
	}
	
	//����ȸ ���� ����Ȯ��
	@RequestMapping("/mbooking_detail")
	public String mbooking_detail(MuseumVO vo, Model model, HttpSession session,
								@RequestParam("dday") String dday,
								@RequestParam("time") String time,
								@RequestParam("head") String head,
								@RequestParam("totalPrice") String totalPrice) {
		MemberVO membervo = (MemberVO) session.getAttribute("loginUser");
		
		MuseumVO museum = museumService.museumDetail(vo);
		
		model.addAttribute("membervo", membervo);
		model.addAttribute("museum", museum);
		model.addAttribute("dday", dday);
		model.addAttribute("time", time);
		model.addAttribute("head", head);
		model.addAttribute("totalPrice", totalPrice);
		
		return "museum/mbooking_detail";
	}
	
	
}
