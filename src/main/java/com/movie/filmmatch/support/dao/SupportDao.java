package com.movie.filmmatch.support.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.movie.filmmatch.support.vo.SupportVo;

@Mapper
public interface SupportDao {

	// @Select("select * support")
	public List<SupportVo> selectList();// 문의글 목록 조회

	public List<SupportVo> selectConditionList(Map<String, Object> map);// 문의글 검색 조회

	public int selectConditionRowTotal(Map<String, Object> map); // Page메뉴생성

	public SupportVo selectOne(int b_idx);// 문의글 1건 조회

	public int selectMaxB_idx(); // 등록시킬 답글의 메인게시물의 일련번호(b_idx) 얻어오기

	public int update_b_ref(SupportVo vo); // 답글 - 문의글의 b_idx를 참조하여 참조글번호 수정

	public int insert(SupportVo vo); // 문의글 입력하기(문의하기)

	public int delete(int b_idx); // 문의글 삭제하기

	public int update(SupportVo vo);// 문의글 수정하기

	public int update_readhit(int b_idx);// 문의글에 대한 조회수증가

	public int update_step(SupportVo vo); // 답글달기

	public int reply(SupportVo vo); // 문의글의 대한 새로운 답글달기(관리지만 가능)

	public int delete_update_b_use(int b_idx); // 해당게시물 관련된 데이터 삭제 및 수정

	public int selectRowTotal(Map<String, Object> map); // page Menu생성:검색된 레코드수 조회

	public CommentsDao getInstance();

}
