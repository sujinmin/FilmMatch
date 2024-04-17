package com.movie.filmmatch.support.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("faq")
public class FaqVo {

    int f_idx; // 자주찾는질문 식별을 위한 고유번호
    String f_subject; // "" 제목
    String f_content; // "" 내용
    String f_ip; // "" 사용자 아이피
    String f_regdate; // "" 작성일자
    int f_readhit; // "" 조회수
    int mem_idx; // "" 회원번호
    String mem_name; // "" 회원명
    String f_use; // "" 사용유무
    int f_no;

    int f_community_page; // "" 페이지

    public FaqVo() {
    }

    /**
     * 자주찾는질문 글올리기
     * 
     * @param f_idx
     * @param f_subject
     * @param f_content
     * @param f_ip
     * @param mem_idx
     * @param mem_name
     * @param f_community_page
     */
    public FaqVo(int f_idx, String f_subject, String f_content, String f_ip, int mem_idx, String mem_name,
            int f_community_page) {
        this.f_idx = f_idx;
        this.f_subject = f_subject;
        this.f_content = f_content;
        this.f_ip = f_ip;
        this.mem_idx = mem_idx;
        this.mem_name = mem_name;
        this.f_community_page = f_community_page;
    }

    /**
     * 자주찾는질문 수정하기
     * 
     * @param f_idx
     * @param f_subject
     * @param f_content
     * @param f_ip
     */
    public FaqVo(int f_idx, String f_subject, String f_content, String f_ip) {
        this.f_idx = f_idx;
        this.f_subject = f_subject;
        this.f_content = f_content;
        this.f_ip = f_ip;
    }

}
