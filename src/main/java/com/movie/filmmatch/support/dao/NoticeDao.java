package com.movie.filmmatch.support.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.movie.filmmatch.support.vo.NoticeVo;

@Mapper
public interface NoticeDao {

    public List<NoticeVo> selectList(int count); // 공지사항 목록 띄우기

    public List<NoticeVo> selectConditionList(Map<String, Object> map);// 공지사항 검색 조회

    public int selectConditionRowTotal(Map<String, Object> map); // Page메뉴생성

    public NoticeVo selectOne(int n_idx); // 공지사항 1건 조회

    public int insert(NoticeVo vo); // 공지사항 글올리기

    public int delete(int b_idx); // 공지사항 삭제하기

    public int update(NoticeVo vo); // 공지사항 수정하기

    public int update_readhit(int b_idx); // 공지사항 조회수 증가

    public int selectRowTotal(Map<String, Object> map); // page Menu생성:검색된 레코드수 조회

}
