package com.atg.Member.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.atg.Member.dto.MemberDto;
import com.atg.paging.dto.PagingDto;

public class MemberDaoImpl extends MemberSqlMapConfig implements MemberDao {

	private String namespace = "member.";
	
	public List<MemberDto> selectList(PagingDto pagingDto) {
		SqlSession session = null;
		List<MemberDto> list = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
		
			list = session.selectList(namespace+"selectList", pagingDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	public MemberDto selectOne(int mb_no) {
		SqlSession session = null;
		MemberDto dto = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
		
			dto = session.selectOne(namespace+"selectOne", mb_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return dto;
	}
	
	public int update(MemberDto dto) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
		
			res = session.update(namespace+"update", dto);
			if(res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	public List<MemberDto> search(String search_op, String search) {
		SqlSession session = null;
		List<MemberDto> list = null;
		
		Map<String, String> map = new HashMap<>();
		map.put("search_op", search_op);
		map.put("search", search);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			
			list = session.selectList(namespace+"search", map);
		} catch (Exception e) {
			e.printStackTrace();
		}	finally {
			session.close();
		}
		return list;
	}
	
	public MemberDto privarcy(int mb_no, String mb_pw) {
		SqlSession session = null;
		MemberDto dto = null;
		
		String mb_no1 = mb_no+"";
		
		Map<String, String> map = new HashMap<>();
		map.put("mb_no", mb_no1);
		map.put("mb_pw", mb_pw);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace+"privarcy", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public int updateUser(MemberDto dto) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
		
			res = session.update(namespace+"updateUser", dto);
			if(res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	public int delete(int mb_no) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
		
			res = session.update(namespace+"delete", mb_no);
			if(res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int update_photo(MemberDto dto) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
		
			res = session.update(namespace+"update_photo", dto);
			if(res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}


	@Override
	public int countPage() {
		SqlSession session = null;
		int count = 0;
		
		try {
			session = getSqlSessionFactory().openSession();
			count = session.selectOne(namespace+"selectCount");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		return count;
	}
	
}







