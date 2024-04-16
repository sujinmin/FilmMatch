package com.movie.filmmatch.movieapi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.filmmatch.movieapi.dao.MovieCommentDao;
import com.movie.filmmatch.movieapi.vo.MovieCommentVo;
import com.movie.filmmatch.util.MyConstant;
import com.movie.filmmatch.util.Paging;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class MovieCommentController {

	@Autowired
	MovieCommentDao mcomment_dao;

	@Autowired
	MovieCommentDao mcomment;

	@Autowired
	HttpServletRequest request;

	@Autowired
    HttpServletResponse response;
		
	@RequestMapping("/comment_list.do")
	public String list() {
		
		// board/comment_list.do?b_idx=5
		//1.parameter 받기
		
		int nowPage = 1;
		String movie_id = request.getParameter("movie_id");
		String strPage = request.getParameter("page");
		
		if(strPage != null && !strPage.isEmpty())
			nowPage = Integer.parseInt(strPage);
		
		int start = (nowPage-1) * MyConstant.Comment.BLOCK_LIST+1;
		int end  = start + MyConstant.Comment.BLOCK_LIST-1;
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("movie_id", movie_id);
		map.put("start", start);
		map.put("end", end);
		
		List<MovieCommentVo> cmt_list = mcomment.selectComList(map);
	
		int rowTotal = mcomment.selectRowTotal(movie_id);
	
		String pageMenu = Paging.getCommentPaging(
		
				nowPage,  //현재페이지
				rowTotal,  // 전체게시물수
				MyConstant.Comment.BLOCK_LIST,		 //1화면에 보여질 게시물수	 
				MyConstant.Comment.BLOCK_PAGE);   // 1화면에 보여질 메뉴수
			
		request.setAttribute("cmt_list", cmt_list);
		request.setAttribute("pageMenu", pageMenu);
		
		return "main/comment_list";
		
	}//end:comment_list.do


	@RequestMapping(value="/comment_insert.do")
	@ResponseBody
	public Map<String,Boolean> insert(MovieCommentVo vo) {

		// /board/comment_insert.do?b_idx=5&cmt_content=댓글내용&mem_idx=18&mem_id=one&mem_name=일길동
		// 1.parameter 받기 
		
		String cmt_content = vo.getCmt_content().replaceAll("\n", "<br>");
		vo.setCmt_content(cmt_content);
		
		String cmt_ip		=	request.getRemoteAddr();
		vo.setCmt_ip(cmt_ip);
		
		int res = mcomment.insert(vo);
		
		
		Map<String,Boolean>map = new HashMap<>();

		map.put("result", res==1);

		return map;
	}
	
	@RequestMapping(value="/comment_delete.do")
	@ResponseBody
	public String delete(int cmt_idx) {

		
		int res = mcomment.delete(cmt_idx);
		
		JSONObject json = new JSONObject();
		if(res==1) 
			json.put("result",true);
		else
			json.put("result",false);
		
		return json.toString();
	}
	
	
	@RequestMapping(value="/star_point.do")
	@ResponseBody
	public String point_update(int star_point, int cmt_idx, MovieCommentVo vo, String movie_id) {
		
		
		vo.setCmt_idx(cmt_idx);
		
		vo.setStar_point(star_point);

		int sumpoint;
		try {
			sumpoint = mcomment_dao.sumpoint(movie_id);
		} catch (Exception e) {
			sumpoint = 0;
		}
		
		int res = mcomment.point_update(vo);
		
		JSONObject json = new JSONObject();
		if(res==1) 
			json.put("result",true);

		else 
			json.put("result",false);
		
		return json.toString();
	}
	
	

}




