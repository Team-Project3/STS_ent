package com.ezen.view;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.biz.dto.BookingVO;
import com.ezen.biz.dto.MemberVO;
import com.ezen.biz.dto.TheaterVO;
import com.ezen.biz.service.BookingService;
import com.ezen.biz.service.TheaterService;

@Controller
public class TheaterController {

	@Autowired
	private TheaterService theaterService;
	@Autowired
	private BookingService bookingService;

	@RequestMapping(value = "/theater", method = RequestMethod.GET)
	public String theater(Model model, TheaterVO vo) {

		List<TheaterVO> theaterList = theaterService.theaterList();

		model.addAttribute("theaterList", theaterList);

		return "theater/theater_main";
	}

	@RequestMapping(value = "/thdetail", method = RequestMethod.GET)
	public String thdetail(Model model, TheaterVO vo,HttpSession session) {
		
		MemberVO membervo = (MemberVO) session.getAttribute("loginUser");

		
			TheaterVO theater = theaterService.theaterDetail(vo);

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			String formattedSDate = sdf.format(theater.getSdate());
			String formattedEDate = sdf.format(theater.getEdate());
			
			// Define the regular expression pattern
	        Pattern pattern = Pattern.compile("\\d+");
	        Matcher matcher = pattern.matcher(theater.getSeat());

	        int width = 0;
	        int height = 0;

	        // Find the first number and assign it to x
	        if (matcher.find()) {
	        	width = Integer.parseInt(matcher.group());
	        }

	        // Find the second number and assign it to y
	        if (matcher.find()) {
	        	height = Integer.parseInt(matcher.group());
	        }
			
	        int seat = width*height;
	        
			model.addAttribute("membervo", membervo);
			model.addAttribute("formattedSDate", formattedSDate);
			model.addAttribute("formattedEDate", formattedEDate);
			model.addAttribute("theater", theater);
			model.addAttribute("seat", seat);
			model.addAttribute("total_ent", theater);

			
			return "theater/theater_detail";
		
	}

	@RequestMapping(value = "/thboard", method = RequestMethod.GET)
	public String thboard(Model model, TheaterVO theaterVO, HttpSession session,
							@RequestParam("dday") String dday,BookingVO bookingVO) throws ParseException {
		
			TheaterVO theater = theaterService.theaterDetail(theaterVO);
			
			bookingVO.setTseq(theaterVO.getTseq());
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date ddayformat = dateFormat.parse(dday);
			
			bookingVO.setDday(ddayformat);
			
			List<String> seatList = bookingService.selectTheater(bookingVO);
			
			List<String> seatlist1 = new ArrayList<String>();
			
			for(String data : seatList) {
				
				StringTokenizer tokenizer = new StringTokenizer(data,",");
				
				
				
				while (tokenizer.hasMoreTokens()) {
					String token = tokenizer.nextToken();
					
					seatlist1.add(token);
				}
				
			}
			
			// Define the regular expression pattern
	        Pattern pattern = Pattern.compile("\\d+");
	        Matcher matcher = pattern.matcher(theater.getSeat());

	        int width = 0;
	        int height = 0;

	        // Find the first number and assign it to x
	        if (matcher.find()) {
	        	width = Integer.parseInt(matcher.group());
	        }

	        // Find the second number and assign it to y
	        if (matcher.find()) {
	        	height = Integer.parseInt(matcher.group());
	        }
		
			model.addAttribute("seatlist1",seatlist1);
			model.addAttribute("theater", theater);
			model.addAttribute("dday",dday);
			model.addAttribute("width",width);
			model.addAttribute("height",height);
			
			return "theater/theater_booking";


	}

	@RequestMapping(value = "/thboarddetail")
	public String thboarddetail(@RequestParam("selectedSeatsCount") int selectedSeatsCount,
								@RequestParam("selectedSeats") String selectedSeats, 
								@RequestParam("tseq") int tseq, 
								@RequestParam("dday") String dday,
								Model model,
			HttpSession session) {

		MemberVO membervo = new MemberVO();

		TheaterVO vo = new TheaterVO();

		vo.setTseq(tseq);

		membervo = (MemberVO) session.getAttribute("loginUser");

		TheaterVO theaterVO = theaterService.theaterDetail(vo);

		int totalprice = theaterVO.getPrice() * selectedSeatsCount;
		
		String modifiedString = selectedSeats.replaceAll("[\\[\\]\"]", "");

		model.addAttribute("selectedSeatsCount", selectedSeatsCount);
		model.addAttribute("selectedSeats", modifiedString);
		model.addAttribute("totalprice", totalprice);
		model.addAttribute("theaterVO", theaterVO);
		model.addAttribute("membervo", membervo);
		model.addAttribute("dday", dday);
		return "theater/thbooking_detail";
	}
}
