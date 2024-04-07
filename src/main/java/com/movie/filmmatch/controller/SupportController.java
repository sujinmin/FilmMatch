package com.movie.filmmatch.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.movie.filmmatch.dao.MemberDao;
import com.movie.filmmatch.dao.SupportDao;
import com.movie.filmmatch.vo.MemberVo;
import com.movie.filmmatch.vo.SupportVo;

import jakarta.servlet.http.HttpServletRequest;

@Controller // 스프링부트가 실행 될 때, 이 자바 클래스가 컨트롤러임을 인식시킴
@RequestMapping("/support/")
public class SupportController {

	@Autowired
	SupportDao support_dao;

	@Autowired
	HttpServletRequest request;

	@Autowired
	MemberDao member_dao;

	@RequestMapping("home.do") // ~9090:support/home.do 고객센터 메인
	public String home(Model model) {

		return "support/support_home";

	}

	@RequestMapping("notice.do") // ~9090:support/home.do 고객센터 공지사항
	public String notice(Model model) {

		return "support/support_notice";

	}

	@RequestMapping("faq.do") // ~9090:support/home.do 고객센터 자주찾는질문
	public String faq(Model model) {

		return "support/support_faq";

	}

	@RequestMapping("qna.do") // ~9090:support/qna.do 1:1문의 게시판
	public String qna_list(Model model) {

		List<SupportVo> list = support_dao.selectList();
		System.out.println(list.size());
		model.addAttribute("list", list);

		return "support/support_qna";
	}

	/**
	 * 문의하기 폼 띄우기
	 * 
	 * @return
	 */
	@RequestMapping("qna_form.do")
	public String qna_form(String mem_id, Model model) {

		// idx해당되는 게시물 1건 얻어오기
		// System.out.println(mem_id);

		MemberVo member = (MemberVo) request.getSession().getAttribute("user");

		// 로그아웃 상태
		if (member == null) {
			return "redirect:../member/login_form.do?reason=session_timeout";
			// session_timeout: 세션만료(로그아웃상태)

		}

		// MemberVo vo = member_dao.selectOneFromId(mem_id);
		// // System.out.println(vo.getMem_name());
		// model.addAttribute("vo", vo);

		return "support/support_qna_form";
	}

	@RequestMapping("insert.do")
	public String insert(SupportVo vo) {

		String b_content = vo.getB_content().replaceAll("\n", "<br>");
		vo.setB_content(b_content);

		String b_ip = request.getRemoteAddr();
		vo.setB_ip(b_ip);

		int res = support_dao.insert(vo);

		return "redirect:qna.do";

	}

	@RequestMapping("reviewer.do") // ~9090:support/home.do 고객센터 평론가
	public String reviewer_list(Model model) {

		List<SupportVo> list = support_dao.selectList();
		System.out.println(list.size());
		model.addAttribute("list", list);

		return "support/support_reviewer";

	}

	@RequestMapping("/delete.do")
	public String delete(int b_idx) {

		support_dao.delete(b_idx);

		return "redirect:qna.do";

	}

	@RequestMapping("/view.do")
	public String view(int b_idx, Model model) {

		// idx해당되는 게시물 1건 얻어오기
		SupportVo vo = support_dao.selectOne(b_idx);

		// content => <br> -> \n
		String content = vo.getB_content().replaceAll("<br>", "\n");
		vo.setB_content(content);

		// request binding
		model.addAttribute("vo", vo);

		return "support/support_qna_view";
	}

}
