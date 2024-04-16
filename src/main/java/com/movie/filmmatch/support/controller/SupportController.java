package com.movie.filmmatch.support.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.filmmatch.member.dao.MemberDao;
import com.movie.filmmatch.member.vo.MemberVo;
import com.movie.filmmatch.support.dao.CommentsDao;
import com.movie.filmmatch.support.dao.ReviewerDao;
import com.movie.filmmatch.support.dao.SupportDao;
import com.movie.filmmatch.support.vo.CommentsVo;
import com.movie.filmmatch.support.vo.ReviewerVo;
import com.movie.filmmatch.support.vo.SupportVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller // 스프링부트가 실행 될 때, 이 자바 클래스가 컨트롤러임을 인식시킴
@RequiredArgsConstructor
@RequestMapping("/support/")
public class SupportController {

	@Autowired
	SupportDao support_dao;

	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session;

	@Autowired
	MemberDao member_dao;

	@Autowired
	ReviewerDao reviewer_dao;

	@Autowired
	CommentsDao comments_dao;

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
	 * ~9090:support/reviewer.do 고객센터 평론가
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("reviewer.do") // ~9090:support/home.do 고객센터 평론가
	public String reviewer_list(Model model) {

		// 로그인폼에서 로그인을하면 서버에서 Session이라는곳에 "user"라고 저장을 해놓음
		MemberVo member = (MemberVo) request.getSession().getAttribute("user");

		// 로그아웃 상태
		if (member == null) {
			return "redirect:../member/login_form.do?reason=session_timeout";
			// session_timeout: 세션만료(로그아웃상태)
		}

		List<ReviewerVo> list = reviewer_dao.selectList();
		System.out.println(list.size());
		model.addAttribute("list", list);
		model.addAttribute("member", member);
		// model.addAttribute("mem_grade", );
		return "support/support_reviewer";

	}

	/**
	 * 1:1 문의하기 폼 띄우기
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

	/**
	 * 1:1문의 게시판 문의하기(글쓰기)
	 * 
	 * @param vo
	 * @return
	 */
	@RequestMapping("qna_insert.do")
	public String insert(SupportVo vo) {

		String b_content = vo.getB_content().replaceAll("\n", "<br>");
		vo.setB_content(b_content);

		String b_ip = request.getRemoteAddr();

		vo.setB_ip(b_ip);

		// 추가
		support_dao.insert(vo);

		// 현재 추가된 b_idx구하기
		int b_idx = support_dao.selectMaxB_idx();

		// 현재 b_idx -> b_ref에 넣는다
		vo.setB_idx(b_idx);
		vo.setB_ref(b_idx);
		support_dao.update_b_ref(vo);

		return "redirect:qna.do";

	}

	/**
	 * 평론가 글남기기 폼
	 * 
	 * @param mem_id
	 * @param model
	 * @return
	 */
	@RequestMapping("reviewer_form.do")
	public String reviewer_form(String mem_id, Model model) {

		MemberVo member = (MemberVo) request.getSession().getAttribute("user");

		// 로그아웃 상태
		if (member == null) {
			return "redirect:../member/login_form.do?reason=session_timeout";
			// session_timeout: 세션만료(로그아웃상태)

		}
		System.err.println("이곳");
		return "support/support_reviewer_form";

	}// end:reviewer_form

	/**
	 * 평론가 글남기기
	 * 
	 * @param vo
	 * @return
	 */
	@RequestMapping("reviewer_insert.do")
	public String reviewer_insert(ReviewerVo vo) {
		// System.err.println("111");
		String r_content = vo.getR_content().replaceAll("\n", "<br>");
		vo.setR_content(r_content);

		String r_ip = request.getRemoteAddr();
		vo.setR_ip(r_ip);

		reviewer_dao.insert(vo);

		return "redirect:reviewer.do";

	}

	/**
	 * 평론가 삭제
	 * 
	 * @param b_idx
	 * @return
	 */
	@RequestMapping("reviewer_delete.do")
	public String reviewer_delete(int b_idx) {

		reviewer_dao.delete(b_idx);

		return "redirect:reviewer.do";

	}

	/**
	 * 1:1문의 삭제
	 * 
	 * @param b_idx
	 * @return
	 */
	@RequestMapping("qna_delete.do")
	public String qna_delete(int b_idx) {

		support_dao.delete(b_idx);

		return "redirect:qna.do";

	}

	/**
	 * 1:1문의 게시글 뷰
	 * 
	 * @param b_idx
	 * @param model
	 * @return
	 */
	@RequestMapping("qna_view.do")
	public String view(int b_idx, Model model) {

		// idx해당되는 게시물 1건 얻어오기
		SupportVo vo = support_dao.selectOne(b_idx);

		// content => <br> -> \n
		String b_content = vo.getB_content().replaceAll("<br>", "\n");
		vo.setB_content(b_content);

		// request binding
		model.addAttribute("vo", vo);

		return "support/support_qna_view";
	}

	@RequestMapping("reviewer_view.do")
	public String reviewer_view(int r_idx, Model model) {

		// idx해당되는 게시물 1건 얻어오기
		ReviewerVo vo = reviewer_dao.selectOne(r_idx);

		// content => <br> -> \n
		String r_content = vo.getR_content().replaceAll("<br>", "\n");
		vo.setR_content(r_content);

		// request binding
		model.addAttribute("vo", vo);

		return "support/support_reviewer_view";
	}

	/**
	 * 1:1문의 수정 폼
	 * 
	 * @param b_idx
	 * @param model
	 * @return
	 */
	@RequestMapping("qna_modifyform.do")
	public String modify_form(int b_idx, Model model) {

		MemberVo member = (MemberVo) request.getSession().getAttribute("user");

		// 로그아웃 상태
		if (member == null) {
			return "redirect:../member/login_form.do?reason=session_timeout";
			// session_timeout: 세션만료(로그아웃상태)

		}

		// idx해당되는 게시물 1건 얻어오기
		SupportVo vo = support_dao.selectOne(b_idx);

		// content => <br> -> \n
		String b_content = vo.getB_content().replaceAll("<br>", "\n");
		vo.setB_content(b_content);

		// request binding
		model.addAttribute("vo", vo);

		return "support/support_qna_modifyform";

	}// end:modify_form

	/**
	 * 1:1문의 수정하기
	 * 
	 * @param vo
	 * @param model
	 * @return
	 */
	@RequestMapping("qna_modify.do")
	public String modify(SupportVo vo, Model model) {

		// \r\n -> <br>변경
		String b_content = vo.getB_content().replaceAll("\n", "<br>");
		vo.setB_content(b_content);

		// 3.IP구하기
		String b_ip = request.getRemoteAddr();
		vo.setB_ip(b_ip);

		// 5.DB update
		support_dao.update(vo);

		model.addAttribute("vo", vo);

		// 반환정보->DS에게 전달
		// -> 접두어 redirect이면 그이후 명령(qna.do)으로
		// sendRedirect("qna.do") 시킨다
		return "redirect:qna.do";

	}// end: modify

	@RequestMapping("comments_list.do") // 댓글 목록
	public String comments_list(int b_idx, Model model) {

		List<CommentsVo> list = comments_dao.selectList(b_idx);
		System.out.println(list.size());
		model.addAttribute("list", list);

		return "support/support_comments_list";
	}

	@RequestMapping("comments_insert.do") // 댓글 입력하기
	@ResponseBody
	public Map<String, Boolean> comments_insert(CommentsVo vo) {

		String cmt_content = vo.getCmt_content().replaceAll("\n", "<br>");
		vo.setCmt_content(cmt_content);

		String cmt_ip = request.getRemoteAddr();
		vo.setCmt_ip(cmt_ip);

		int res = comments_dao.insert(vo);

		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("result", res == 1);

		return map;

	}

	/**
	 * 댓글삭제
	 * 
	 * @param cmt_idx
	 * @return
	 */
	@RequestMapping("comments_delete.do")
	@ResponseBody
	public Map<String, Boolean> comments_delete(int cmt_idx) {

		int res = comments_dao.delete(cmt_idx);

		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("result", (res == 1));

		return map;

	}

	/**
	 * 댓글 수정
	 * 
	 * @param vo
	 * @return
	 */
	@RequestMapping("comments_update.do")
	@ResponseBody
	public Map<String, Boolean> comments_update(CommentsVo vo) {

		String cmt_content = vo.getCmt_content().replaceAll("\n", "<br>");
		vo.setCmt_content(cmt_content);

		// 3.ip구하기
		String cmt_ip = request.getRemoteAddr();
		vo.setCmt_ip(cmt_ip);

		int res = comments_dao.update(vo);

		// 결과 반환 : {"result" : true}
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("result", (res == 1));

		return map;
	}

	/**
	 * 답글쓰기 폼 (관리자만가능)
	 * 
	 * @param b_idx
	 * @param model
	 * @return
	 */
	@RequestMapping("qna_replyform.do")
	public String reply_form(int b_idx, Model model) {

		MemberVo member = (MemberVo) request.getSession().getAttribute("user");

		// 로그아웃 상태
		if (member == null) {
			return "redirect:../member/login_form.do?reason=session_timeout";
			// session_timeout: 세션만료(로그아웃상태)

		}

		// idx해당되는 게시물 1건 얻어오기
		SupportVo vo = support_dao.selectOne(b_idx);

		// content => <br> -> \n
		String b_content = vo.getB_content().replaceAll("<br>", "\n");
		vo.setB_content(b_content);

		// request binding
		model.addAttribute("vo", vo);

		return "support/support_qna_replyform";

	}// end:modify_form

	/**
	 * 답글쓰기 (관리자만가능)
	 * 
	 * @param vo
	 * @return
	 */
	@RequestMapping("qna_reply.do")
	public String reply(SupportVo vo) {

		String b_content = vo.getB_content().replaceAll("\n", "<br>");
		vo.setB_content(b_content);

		String b_ip = request.getRemoteAddr();
		vo.setB_ip(b_ip);

		int b_idx = vo.getB_idx();
		SupportVo baseVo = support_dao.selectOne(b_idx);

		// 기준글 이후의 step을 뒤로 밀기
		support_dao.update_step(baseVo);

		// 댓글정보셋팅(답글에 들어갈 b_ref b_step b_depth 계산)
		vo.setB_ref(baseVo.getB_ref());
		vo.setB_step(baseVo.getB_step() + 1);
		vo.setB_depth(baseVo.getB_depth() + 1);

		support_dao.reply(vo);

		return "redirect:qna.do";

	}

}
