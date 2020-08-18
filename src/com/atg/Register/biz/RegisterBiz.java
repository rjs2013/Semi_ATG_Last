package com.atg.Register.biz;

import java.util.List;
import java.util.Map;

import com.atg.Register.dto.RegisterDto;

public interface RegisterBiz {
	
	//로그인 기능 
	public RegisterDto login(Map<String, String> map);
	
	//아이디 중복체크 
	public int idCheck(String mb_id);
	//이메일 중복체크		
	public int  emailCheck(String mb_emali);
	

	
	//아아디 찾기 -------------------------------------
	public RegisterDto IDfind(Map<String, String> map);
		
		
	//비밀번호 찾기 ----------------------------------
	public RegisterDto PWfind(Map<String, String> map);
			
		
	
	
	
	
	
	//관리자 고객전체출력 
	public List<RegisterDto> selectList();
	//선택한 해당번호값 가져오기 
	public RegisterDto selectOne(int mb_no);
	
	
	//회원가입
	public int insert(RegisterDto dto);
	
	//업데이트 
	public int update (RegisterDto dto);
	//삭제 
	public int delete(int mb_no);
	
	//유저조회
	public RegisterDto userInfo(RegisterDto dto);

}
