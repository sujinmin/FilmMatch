package com.movie.filmmatch.movieapi.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.movie.filmmatch.movieapi.vo.MovieCommentVo;


@Mapper
public interface MovieCommentDao {
	
	// 목록조회
	public List<MovieCommentVo> selectList(Map<String, Object> map);

	public List<MovieCommentVo> selectComList(Map<String, Object> map);

	public int sumpoint(String id);
	
	public int insert(MovieCommentVo vo);

	public int delete(int cmt_idx);

	public int selectRowTotal(String movie_id);

	public int delete_movie_id(String movie_id);

	public int point_update(MovieCommentVo vo);

}
