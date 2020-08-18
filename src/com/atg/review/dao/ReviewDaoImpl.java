package com.atg.review.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.atg.paging.dto.PagingDto;
import com.atg.review.dao.ReviewDao;
import com.atg.review.dao.ReviewSqlMapConfig;
import com.atg.review.dto.ReviewDto;

public class ReviewDaoImpl extends ReviewSqlMapConfig implements ReviewDao {
	
	private String namespace = "review.";
	
	public List<ReviewDto> selectList(PagingDto pagingDto) {
		SqlSession session = null;
		List<ReviewDto> list = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"reviewList", pagingDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public ReviewDto selectOne(int rv_no) {
		SqlSession session = null;
		ReviewDto dto = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace+"selectOne", rv_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return dto;
	}

	@Override
	public int insert(ReviewDto dto) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+"insert", dto);
			
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return res;
	}

	@Override
	public int update(ReviewDto dto) {
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

	@Override
	public int delete(int rv_no, String mb_id) {
		SqlSession session = null;
		int res = 0;
		String rv_no1 = rv_no+"";
		Map<String, String> map = new HashMap<>();
		map.put("rv_no1", rv_no1);
		map.put("mb_id", mb_id);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.delete(namespace+"delete", map);
			
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
	
	public List<ReviewDto> selectlist() {
		SqlSession session = null;
		List<ReviewDto> list = null;
		
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

















