package com.movie.filmmatch.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.filmmatch.service.GoodsService;
import com.movie.filmmatch.util.MyKakaoUtils;
import com.movie.filmmatch.vo.GoodsVo;
import com.movie.filmmatch.vo.NewsVo;
import com.movie.filmmatch.vo.PlayingVo;
import com.movie.filmmatch.vo.PosterVo;
import com.movie.filmmatch.vo.TheaterVo;
import com.movie.filmmatch.vo.VedioVo;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class HomeController{

 	@Autowired
    GoodsService goods_service;

    @Autowired
    ServletContext application;

	 @Autowired
    HttpServletRequest request;
	
	
	public HomeController() {
		System.out.println("--HomeController()--");
	}
	

	@RequestMapping("/test.do")
	@ResponseBody
	public String test(Model model){

		return "test";
	}

	/**
	 * 메인 화면
	 * @return
	 */
	@RequestMapping("/index.do")
	public String index(Model model){
		
		List<NewsVo> list = null;

	
		try {
			list =NewsAPIController.search_news();
		

		} catch (Exception e) {
			
			e.printStackTrace();
		}

	

		List<PosterVo> posterlist = null;
		try {
			posterlist =PosterAPIController.search_poster();
			

		} catch (Exception e) {
			
			e.printStackTrace();
		}

	
		List<PosterVo> votelist = null;
		try {
			votelist = PosterAPIController.search_vote();
			

		} catch (Exception e) {
			
			e.printStackTrace();
		}

	
		List<VedioVo> vediolist = null;
		try {
			vediolist =  VedioAPIController.search_vedio();
			

		} catch (Exception e) {
			
			e.printStackTrace();
		}


		Map<String, List<GoodsVo>> map = null;
		try {
			map = goods_service.select_list();
		

		} catch (Exception e) {
			
			e.printStackTrace();
		}

        model.addAttribute("map", map);
		model.addAttribute("vediolist", vediolist);
		model.addAttribute("votelist", votelist);
		model.addAttribute("posterlist", posterlist);
		model.addAttribute("newslist", list);
		
		return "main/index";
		
	}


	/**
	 * 마이페이지
	 * @return
	 */
	@RequestMapping("/mypage_form.do")
	public String mypage() {

		return "member/mypage_form";

	}

	/**
	 * 관리자 페이지
	 * @return
	 */
	@RequestMapping("/manager_form.do")
	public String manager() {

		return "admin/manager_form";

	}

		/**
	 * 장르별 페이지
	 * @return
	 */
	@RequestMapping("/genre.do")
	public String genre(Model model) {

		List<PlayingVo> list = null;
		try {
			list = genreAPIController.search_playing();
			System.out.println(list);
	
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		

		model.addAttribute("list", list);

		return "main/genre";

	}

		/**
	 * 배우별 페이지
	 * @return
	 */
	@RequestMapping("/actor.do")
	public String actor() {

		return "main/actor";

	}

		/**
	 * 나라별 페이지
	 * @return
	 */
	@RequestMapping("/nation.do")
	public String nation() {

		return "main/nation";

	}

		/**
	 * 극장 페이지
	 * @return
	 */
	@RequestMapping("/theater.do")
	public String theater() {

		
		// List<TheaterVo> list = null;
		// try {
			
		// 	list = MyKakaoUtils.search_map(latitude, longitude, query);
		// } catch (Exception e) {		
		// 	e.printStackTrace();
		// }
		
		// model.addAttribute("list", list);

		return "main/theater";

	}

	@RequestMapping("/theater_data.do")
	@ResponseBody
	public List<TheaterVo> theater_data(String query,double latitude,double longitude) {

		
		List<TheaterVo> list = null;
		try {
			
			list = MyKakaoUtils.search_map(latitude, longitude, query);
		} catch (Exception e) {		
			e.printStackTrace();
		}
		
		return list;

	}

	@RequestMapping("/movieinfo.do")
	public String movieinfo(Model model) {

		List<NewsVo> list = null;
		try {
			list =NewsAPIController.search_news();
		

		} catch (Exception e) {
			
			e.printStackTrace();
		}

		List<PosterVo> posterlist = null;
		try {
			posterlist =PosterAPIController.search_poster();
			

		} catch (Exception e) {
			
			e.printStackTrace();
		}

		List<PosterVo> votelist = null;
		try {
			votelist = PosterAPIController.search_vote();
			

		} catch (Exception e) {
			
			e.printStackTrace();
		}

		List<VedioVo> vediolist = null;
		try {
			vediolist =  VedioAPIController.search_vedio();
			

		} catch (Exception e) {
			
			e.printStackTrace();
		}


		Map<String, List<GoodsVo>> map = null;
		try {
			map = goods_service.select_list();
		

		} catch (Exception e) {
			
			e.printStackTrace();
		}

        model.addAttribute("map", map);
		model.addAttribute("vediolist", vediolist);
		model.addAttribute("votelist", votelist);
		model.addAttribute("posterlist", posterlist);
		model.addAttribute("newslist", list);

		return "main/movieinfo";

	}


}
