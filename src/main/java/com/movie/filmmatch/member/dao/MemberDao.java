package com.movie.filmmatch.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.movie.filmmatch.member.vo.MemberVo;
@Mapper
public interface MemberDao {
	
	// 목록조회
	public List<MemberVo> selectList();

	public MemberVo selectOneFromIdx(int mem_idx);
	
	public MemberVo selectOneFromId(String mem_id);

	public MemberVo selectkakaoId(String kakaoid);

	public int insert(MemberVo vo);

	public int delete(int mem_idx);

	public int update(MemberVo vo);
	
}
