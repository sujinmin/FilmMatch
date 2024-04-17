package com.movie.filmmatch.member.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
@Data
@Alias("member")
public class MemberVo {
	
	int mem_idx;
	String mem_name;
	String mem_id;
	String mem_pwd;
	String mem_birth;
	String mem_gender;
	String mem_email;
	String mem_phone;
	String mem_zipcode;
	String mem_addr;
	String mem_ip;
	String mem_regdate;
	String mem_modifydate;
	String mem_grade;

	String kakaoid;
	
	String mem_mask_pwd;
	String policy_a;
	String policy_b;

	
	
	
	public String getMem_mask_pwd() {
		
		//비밀번호 반만 노출 + 나머지 *** 처리
		/* // 방법1)
		  int half = len / 2;
		  
		  StringBuffer sb = new StringBuffer();
		  for (int i = 0; i <len; i++) {
		   if (i<half) sb.append(mem_pwd.charAt(i)); 
		   	else sb.append("*") ; 
		   }
		  	return sb.append("*");
		  
		 */	
		
		// 방법2)비밀번호 전체길이의 반*
		int len = mem_pwd.length();
		int mask = Math.round(len / 2);

		return mem_pwd.substring(0, mask) + "*".repeat(len - mask);
		
		
		
	}
	
}
