package com.movie.filmmatch.support.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("reviewer")
public class ReviewerVo {

    int r_idx;
    String r_subject;
    String r_content;
    String r_ip;
    String r_regdate;
    int r_readhit;
    int mem_idx;
    String mem_name;
    int r_ref;
    int r_step;
    int r_depth;
    String r_use;// "" 게시판 사용유무
    int r_no;
    int r_cmt_count;

    int r_community_page; // "" 게시판 페이지

    public ReviewerVo() {
    }

    public ReviewerVo(int r_idx, String r_subject, String r_content, String r_ip, int mem_idx, String mem_name,
            int r_ref, int r_community_page) {
        this.r_idx = r_idx;
        this.r_subject = r_subject;
        this.r_content = r_content;
        this.r_ip = r_ip;
        this.mem_idx = mem_idx;
        this.mem_name = mem_name;
        this.r_ref = r_ref;
        this.r_community_page = r_community_page;
    }

}
