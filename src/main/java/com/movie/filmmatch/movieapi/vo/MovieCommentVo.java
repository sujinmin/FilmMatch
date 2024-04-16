package com.movie.filmmatch.movieapi.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("mcomment") 
public class MovieCommentVo {

	int cmt_idx;
	String cmt_content;
	String cmt_ip;
	String cmt_regdate;
   String movie_id;
	int mem_idx;
	String mem_id;
	String mem_name;
   int star_point;
   
	
	
	int no;

   public MovieCommentVo() {
   }

   public MovieCommentVo(int cmt_idx, String cmt_content, String cmt_ip, String cmt_regdate, String movie_id,
         int mem_idx, String mem_id, String mem_name) {
      this.cmt_idx = cmt_idx;
      this.cmt_content = cmt_content;
      this.cmt_ip = cmt_ip;
      this.cmt_regdate = cmt_regdate;
      this.movie_id = movie_id;
      this.mem_idx = mem_idx;
      this.mem_id = mem_id;
      this.mem_name = mem_name;
   }

   public MovieCommentVo(int cmt_idx, int star_point) {
      this.cmt_idx = cmt_idx;
      this.star_point = star_point;
   }

   
   
   
   
}
