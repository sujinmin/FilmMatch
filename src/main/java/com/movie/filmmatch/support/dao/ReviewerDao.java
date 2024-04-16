package com.movie.filmmatch.support.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.movie.filmmatch.support.vo.ReviewerVo;

@Mapper
public interface ReviewerDao {

    public List<ReviewerVo> selectList();// 문의글 목록 조회

    public ReviewerVo selectOne(int r_idx);

    public int insert(ReviewerVo vo);

    public int delete(int r_idx);

    public int update(ReviewerVo vo);

}
