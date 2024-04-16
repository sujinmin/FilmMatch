package com.movie.filmmatch.movieapi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.filmmatch.goods.service.GoodsService;
import com.movie.filmmatch.goods.vo.GoodsVo;
import com.movie.filmmatch.member.dao.MemberDao;
import com.movie.filmmatch.movieapi.dao.MovieCommentDao;
import com.movie.filmmatch.movieapi.vo.ActorVo;
import com.movie.filmmatch.movieapi.vo.DetailMovieTVVo;
import com.movie.filmmatch.movieapi.vo.NationVo;
import com.movie.filmmatch.movieapi.vo.NewsVo;
import com.movie.filmmatch.movieapi.vo.PlayingVo;
import com.movie.filmmatch.movieapi.vo.PosterVo;
import com.movie.filmmatch.movieapi.vo.TheaterVo;
import com.movie.filmmatch.movieapi.vo.VedioVo;
import com.movie.filmmatch.util.Actor1APIUtils;
import com.movie.filmmatch.util.Actor2APIUtils;
import com.movie.filmmatch.util.ActorAPIUtils;
import com.movie.filmmatch.util.IdAPIUtils;
import com.movie.filmmatch.util.MyConstant;
import com.movie.filmmatch.util.MyKakaoUtils;
import com.movie.filmmatch.util.NationAPIUtils;
import com.movie.filmmatch.util.NewsAPIUtils;
import com.movie.filmmatch.util.NewsAPIUtils1;
import com.movie.filmmatch.util.Paging;
import com.movie.filmmatch.util.PosterAPIUtils;
import com.movie.filmmatch.util.SearchAPIUtils;
import com.movie.filmmatch.util.VedioAPIUtils;
import com.movie.filmmatch.util.genreAPIUtils;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController{

 	@Autowired
    GoodsService goods_service;
	    
	@Autowired
	MemberDao member_dao;

    @Autowired
    ServletContext application;

	@Autowired
    HttpServletRequest request;

	@Autowired
    HttpServletResponse response;

	@Autowired
	HttpSession session;

	@Autowired
	MovieCommentDao mcomment_dao;
	
	
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
		List<NewsVo> amnewlist = null;
	
		try {
			list =NewsAPIUtils.search_news();
		

		} catch (Exception e) {
			
			e.printStackTrace();
		}

		try {
			amnewlist =NewsAPIUtils1.search_americanews();
		

		} catch (Exception e) {
			
			e.printStackTrace();
		}


		List<PosterVo> posterlist = null;
		try {
			posterlist =PosterAPIUtils.search_poster();
			

		} catch (Exception e) {
			
			e.printStackTrace();
		}

	
		List<PosterVo> votelist = null;
		try {
			votelist = PosterAPIUtils.search_vote();
			

		} catch (Exception e) {
			
			e.printStackTrace();
		}

	
		List<VedioVo> vediolist = null;
		try {
			vediolist =  VedioAPIUtils.search_vedio();
			

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
		model.addAttribute("amnewlist", amnewlist);
		model.addAttribute("vediolist", vediolist);
		model.addAttribute("votelist", votelist);
		model.addAttribute("posterlist", posterlist);
		model.addAttribute("newslist", list);
		
		return "main/index";
		
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
			list = genreAPIUtils.search_playing();
			
	
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
	public String actor(Model model) {

		List<ActorVo> list = null;
		try {
			list = ActorAPIUtils.search_actor();
			
	
		} catch (Exception e) {
			
			e.printStackTrace();
		}

		List<ActorVo> list1 = null;
		try {
			list1 = Actor1APIUtils.search_actorameri();
			
	
		} catch (Exception e) {
			
			e.printStackTrace();
		}

		List<ActorVo> list2 = null;
		try {
			list2 = Actor2APIUtils.search_actorjapan();
		
	
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		model.addAttribute("list2", list2);
		model.addAttribute("list1", list1);
		model.addAttribute("list", list);
	
		return "main/actor";

	}

		/**
	 * 나라별 페이지
	 * @return
	 */
	@RequestMapping("/nation.do")
	public String nation(Model model) {

		List<NationVo> list = null;
		try {
			list = NationAPIUtils.search_nation();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		model.addAttribute("list", list);

		return "main/nation";

	}


			/**
	 * 검색 페이지
	 * @return
	 */
	@RequestMapping("/searchmovie.do")
	public String searmovie(String query,Model model) {

		List<PosterVo> list = null;
		try {
			list = SearchAPIUtils.search_text(query);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		model.addAttribute("list", list);

		return "main/searchmovie";

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

		/**
	 * 영화 상세 페이지
	 * @return
	 */
	@RequestMapping("/movieinfo.do")
	public String movieinfo(String id,String media_type,Model model) {
		
		int sumpoint = 0;
		try {
			sumpoint = mcomment_dao.sumpoint(id);
		} catch (Exception e) {		
			sumpoint = 0;
		}

		List<DetailMovieTVVo> list = null;
		try {
			
			list = IdAPIUtils.search_id(id,media_type);
			
		} catch (Exception e) {		
			e.printStackTrace();
		}
		model.addAttribute("sumpoint", sumpoint);
		model.addAttribute("list", list);
		return "main/movieinfo";

	}



	}




