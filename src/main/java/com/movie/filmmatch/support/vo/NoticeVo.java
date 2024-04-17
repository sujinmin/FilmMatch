package com.movie.filmmatch.support.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("notice")
public class NoticeVo {

    int n_idx; // 공지사항 식별을 위한 고유번호
    String n_subject; // "" 제목
    String n_content; // "" 내용
    String n_ip; // "" 사용자 아이피
    String n_regdate; // "" 작성일자
    int n_readhit; // "" 조회수
    int mem_idx; // "" 회원번호
    String mem_name; // "" 회원명
    String n_use; // "" 사용유무
    int n_no;

    int n_community_page; // "" 페이지

    public NoticeVo() {
    }

    /**
     * 공지사항 글올리기
     * 
     * @param n_idx
     * @param n_subject
     * @param n_content
     * @param n_ip
     * @param mem_idx
     * @param mem_name
     * @param n_community_page
     */
    public NoticeVo(int n_idx, String n_subject, String n_content, String n_ip, int mem_idx, String mem_name,
            int n_community_page) {
        this.n_idx = n_idx;
        this.n_subject = n_subject;
        this.n_content = n_content;
        this.n_ip = n_ip;
        this.mem_idx = mem_idx;
        this.mem_name = mem_name;
        this.n_community_page = n_community_page;
    }

    /**
     * 공지사항 수정하기
     * 
     * @param n_idx
     * @param n_subject
     * @param n_content
     * @param n_ip
     */
    public NoticeVo(int n_idx, String n_subject, String n_content, String n_ip) {
        this.n_idx = n_idx;
        this.n_subject = n_subject;
        this.n_content = n_content;
        this.n_ip = n_ip;
    }

}
