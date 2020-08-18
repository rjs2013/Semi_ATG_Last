package com.atg.Register.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.atg.Register.dao.RegisterSqlMapConfig;
import com.atg.Register.dto.RegisterDto;

public class RegisterDaoImpl extends RegisterSqlMapConfig implements RegisterDao {
	
	
	private final String namespace="mapper.";
	
	@Override
	public List<RegisterDto> selectList() {
		SqlSession session = null;
		List<RegisterDto> list = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			// autocommit 할거냐 말거냐 기본값이 true
			list = session.selectList(namespace+"selectList");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
			
		}
		
		return list;
	}
	@Override
	public RegisterDto login(Map<String, String> map) {
		SqlSession session = null;
		RegisterDto dto = null;
		
		try {
			
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace+"login",map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		
		return dto;
	}
	
	
	
	// ---------------중복체크 --------------------------------------------
	//아이디 중복체크 
	@Override
	public int idCheck(String mb_id) {
		SqlSession session = null;
		int idCount = 0;
		session = getSqlSessionFactory().openSession(true);
		idCount = session.selectOne(namespace+"idCheck",mb_id);
		return idCount;
	}
	
	
	//이메일 중복체크 
	public int emailCheck(String mb_email) {
		SqlSession session = null;
		
		int emailCount=0;
		session = getSqlSessionFactory().openSession(true);
		emailCount = session.selectOne(namespace+"emailCheck",mb_email);
		
		
		return emailCount; 
	}
	
	
	
	


	@Override
	public RegisterDto selectOne(int mb_no) {
		SqlSession session = null;
		RegisterDto dto = null;
		try {
			session =getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace+"selectOne",mb_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return dto;
	}
	
	//회원가입
	@Override
	public int insert(RegisterDto dto) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session=getSqlSessionFactory().openSession(true);
			res=session.insert(namespace+"insert", dto);
			System.out.println(res+"res-----------daoimpl부분");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
	}
	
	
	
	//아이디 찾기 -------------------------------------
	@Override
	public RegisterDto IDfind(Map<String, String> map) {
		SqlSession session= null;
		RegisterDto dto =null;
		
		try {
			session=getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace+"IDfind",map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		
		return dto;
	}
	
	
	//비밀번호 찾기 ----------------------------------
	@Override
	public RegisterDto PWfind(Map<String, String> map) {
		SqlSession session = null;
		RegisterDto dto = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace+"PWfind",map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		
		return dto;
	}
	
	@Override
	public int update(RegisterDto dto) {
		SqlSession session = null;
		int res = 0;
		
	 try {
		session = getSqlSessionFactory().openSession(false);
		 res = session.update(namespace+"update",dto);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		session.close();
	}
		
		return res;
	}
	
	
	
	
	
	
	
	
	
	
	

	@Override
	public int delete(int mb_no) {
		return 0;
	}

	@Override
	public RegisterDto userInfo(RegisterDto dto) {
		return null;
	}

}
