package com.ezen.view;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.biz.dto.ConcertVO;
import com.ezen.biz.dto.MuseumVO;
import com.ezen.biz.service.MuseumService;

@Controller
public class MuseumController {
	
	@Autowired
	private MuseumService museumService;
	
	//전시회 페이지 - 전시회 리스트
	@RequestMapping("/museum_main")
	public String museumList(MuseumVO vo, Model model) {
		
		List<MuseumVO> list = museumService.museumList();
		
		model.addAttribute("museumList", list);
		
		return "museum/museum_main";
	}
	
	//전시회 디테일 화면
	@RequestMapping("/museum_detail")
	public String museumdetail(MuseumVO vo, Model model) {
		
		MuseumVO museum = museumService.museumDetail(vo);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		String formattedDate = sdf.format(museum.getBdate());

		model.addAttribute("formattedDate",formattedDate);
		
		model.addAttribute("museum", museum);

		return "museum/museum_detail";
	}

	//전시회 예매
	@RequestMapping("/museum_booking")
	public String museumbooking(MuseumVO vo, Model model) {
		
		return "museum/museumbooking";
	}
}
