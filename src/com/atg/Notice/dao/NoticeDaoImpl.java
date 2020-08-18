package com.atg.Notice.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.atg.Notice.dao.NoticeDao;
import com.atg.Notice.dao.NoticeSqlMapConfig;
import com.atg.Notice.dto.NoticeDto;
import com.atg.paging.dto.PagingDto;

public class NoticeDaoImpl extends NoticeSqlMapConfig implements NoticeDao {

	private String namespace = "notice.";
	
	public List<NoticeDto> selectList(PagingDto pagingDto) {
		SqlSession session = null;
		List<NoticeDto> list = null;
		
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
	
	public NoticeDto selectOne(int nt_no) {
		SqlSession session = null;
		NoticeDto dto = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace+"selectOne", nt_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return dto;
	}
	
	public int insert(NoticeDto dto) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
		
			res = session.insert(namespace+"insert", dto);
			if(res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return res;	
	}
	public int update(NoticeDto dto) {
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
		} finally {
			session.close();
		}
		
		return res;
	}
	
	public int delete(int nt_no) {
		SqlSession session = null;
		
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			
			res = session.delete(namespace+"delete", nt_no);
			if(res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return res;
	}
	
	public List<NoticeDto> search(String search_op, String search) {
		SqlSession session = null;
		List<NoticeDto> list = null;
		
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
	
	public List<NoticeDto> selectlist() {
		SqlSession session = null;
		List<NoticeDto> list = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"selectlist");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}
	
}






