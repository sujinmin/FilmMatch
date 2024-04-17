package com.movie.filmmatch.support.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.movie.filmmatch.support.vo.FaqVo;

@Mapper
public interface FaqDao {

    public List<FaqVo> selectList(int count); // 자주찾는질문 목록 띄우기

    public List<FaqVo> selectConditionList(Map<String, Object> map);// 자주찾는질문 검색 조회

    public int selectConditionRowTotal(Map<String, Object> map); // Page메뉴생성

    public FaqVo selectOne(int f_idx); // 자주찾는질문 1건 조회

    public int insert(FaqVo vo); // 자주찾는질문 글올리기

    public int delete(int f_idx); // 자주찾는질문 삭제하기

    public int update(FaqVo vo); // 자주찾는질문 수정하기

    public int update_readhit(int b_idx); // 자주찾는질문 조회수 증가

    public int selectRowTotal(Map<String, Object> map); // page Menu생성:검색된 레코드수 조회

}
