package com.atg.Register.biz;

import java.util.List;
import java.util.Map;

import com.atg.Register.dao.RegisterDao;
import com.atg.Register.dao.RegisterDaoImpl;
import com.atg.Register.dao.RegisterSqlMapConfig;
import com.atg.Register.dto.RegisterDto;
import com.atg.review.dao.ReviewSqlMapConfig;

public class RegisterBizImpl extends ReviewSqlMapConfig  implements RegisterBiz {

		RegisterDao dao = new RegisterDaoImpl();
	
		
	//로그인	
	@Override
	public RegisterDto login(Map<String, String> map) {
		
		return dao.login(map);
	}

	
	//아이디 중복체크
	@Override
	public int idCheck(String mb_id) {
		
		
		System.out.println(dao.idCheck(mb_id)+"---------BizImpl--------");
		
		return dao.idCheck(mb_id);
	}
	
	
	
	//이메일 중복체크
	@Override
	 public int emailCheck(String mb_email) {
		
		return dao.emailCheck(mb_email);
	}
	
	//아아디 찾기 -------------------------------------
	@Override
	public RegisterDto IDfind(Map<String, String> map) {
		
		return dao.IDfind(map);
	}
	
	
	//비밀번호 찾기 ----------------------------------
	@Override
	public RegisterDto PWfind(Map<String, String> map) {
		
		
		return dao.PWfind(map);
	}
	
	
	
	
	
	
	
	@Override
	public List<RegisterDto> selectList() {
		// TODO Auto-generated method stub
		return dao.selectList();
	}

	@Override
	public RegisterDto selectOne(int mb_no) {
		// TODO Auto-generated method stub
		return dao.selectOne(mb_no);
	}

	@Override
	public int insert(RegisterDto dto) {
		// TODO Auto-generated method stub
		return dao.insert(dto);
	}

	@Override
	public int update(RegisterDto dto) {
		// TODO Auto-generated method stub
		return dao.update(dto);
	}

	@Override
	public int delete(int mb_no) {
		// TODO Auto-generated method stub
		return dao.delete(mb_no);
	}

	@Override
	public RegisterDto userInfo(RegisterDto dto) {
		// TODO Auto-generated method stub
		return  dao.userInfo(dto);
	}

}
