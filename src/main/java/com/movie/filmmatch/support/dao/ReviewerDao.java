package com.movie.filmmatch.support.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.movie.filmmatch.support.vo.ReviewerVo;

@Mapper
public interface ReviewerDao {

    public List<ReviewerVo> selectList();// 평론글 목록 조회

    public List<ReviewerVo> selectConditionList(Map<String, Object> map);// 평론글 검색 조회

    public int selectConditionRowTotal(Map<String, Object> map);

    public ReviewerVo selectOne(int r_idx);// 평론글 1건 조회

    public int insert(ReviewerVo vo);// 평론글 입력

    public int delete(int r_idx);// 평론글 삭제

    public int update(ReviewerVo vo);// 평론글 수정

    public int update_readhit(int b_idx); // 평론글 조회수 증가

    public int selectRowTotal(Map<String, Object> map); // page Menu생성:검색된 레코드수 조회

}
