package com.movie.filmmatch.support.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.movie.filmmatch.support.vo.CommentsVo;

@Mapper
public interface CommentsDao {

    // @Select("select * support")
    public List<CommentsVo> selectList(int b_idx);// 댓글 전체 조회

    public CommentsVo selectOne(int b_idx); // 댓글 1건 조회

    public int insert(CommentsVo vo); // 댓글 달기(입력하기)

    public int delete(int cmt_idx); // 댓글 삭제하기

    public int update(CommentsVo vo); // 댓글 수정하기

    public int selectRowTotal(int b_idx); // 댓글 페이징 처리하기

    public int delete_b_idx(int b_idx); // b_idx글 삭제시 여기 달린 댓글

}
