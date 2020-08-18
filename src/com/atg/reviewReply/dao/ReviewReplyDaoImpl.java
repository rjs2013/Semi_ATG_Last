package com.atg.reviewReply.dao;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.session.SqlSession;

import com.atg.reviewReply.dto.ReviewReplyDto;

public class ReviewReplyDaoImpl extends ReviewReplySqlMapConfig implements ReviewReplyDao {
	
	private String namespace = "mapper.";
	
	
	
	
	

	@Override
	public List<ReviewReplyDto> seleList(int rv_no) {
		SqlSession session = null;
		List<ReviewReplyDto> list = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"selectList",rv_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		System.out.println(list+"----ReviewReplyDaoImpl");
		
		return list;
	}

	@Override
	public ReviewReplyDto selectOne(int rv_no) {
		SqlSession session = null;
		ReviewReplyDto dto = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace+"selectOne",rv_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		
		return dto;
	}
	
	@Override
	public int insert(ReviewReplyDto dto) {
		SqlSession session = null;
		int res = 0;
		try {
			session= getSqlSessionFactory().openSession(false);
			res= session.insert(namespace+"insert",dto);
			
			if(res>0) {
				session.commit();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		System.out.println("ReviewReplyDaoimpl==>"+res);
		return res;
	}
	
	

	/*
	 * @Override public int insert(Map<String, String> map) { SqlSession session =
	 * null; int res = 0;
	 * 
	 * try { session = getSqlSessionFactory().openSession(false); res =
	 * session.insert(namespace+"insert",map);
	 * 
	 * System.out.println("ReviewReplyDaoImpl부분"+res);
	 * 
	 * if(res>0) { session.commit(); } } catch (Exception e) { // TODO
	 * Auto-generated catch block e.printStackTrace(); }finally { session.close(); }
	 * 
	 * 
	 * 
	 * return res; }
	 */
	// 
	/*
	 * public ReviewReplyDto selectLastReply(Map<String, String> map) { SqlSession
	 * session = null; System.out.println("daoimpl"); System.out.println(map);
	 * return null; }
	 */
	

	@Override
	public int update(ReviewReplyDto dto) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace+"update",dto);
			if(res>0) {
				session.commit();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;
		
	}

	@Override
	public int delete(int rr_no,String mb_id) {
		SqlSession session =null;
		int res = 0;
		
		String rr_no1= rr_no+"";
		
		
		Map<String, String> map = new HashedMap();
		
		map.put("rr_no",rr_no1 );
		map.put("mb_id",mb_id );
		
		
		try { session =getSqlSessionFactory().openSession(false); 
		res =session.delete(namespace+"delete",map); 
		if(res>0) { session.commit(); } }
				 
		
	
		catch (Exception e) { // TODO Auto-generated catch block e.printStackTrace();
				
				 
				 
		}finally { session.close(); }
		
		return res;
	}
	
	
	public int answerUpdate(int parentrr_no) {
		SqlSession session =null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace+"answerUpdate",parentrr_no);
			if(res>0) {
				session.commit();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		
		
		return res;
	}
	
	public int answerInsert(ReviewReplyDto dto) {
		SqlSession session =null;
		int res = 0;
		
			try {
				session=getSqlSessionFactory().openSession(false);
				res=session.insert(namespace+"answerInsert",dto);
				if(res>0) {
					session.commit();
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				session.close();
			}
		return res;
	}

	@Override
	public ReviewReplyDto selectLastReply(Map<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}

	/*
	 * @Override public com.atg.reviewReply.dao.ReviewReplyDto selectOne(int rv_no)
	 * { // TODO Auto-generated method stub return null; }
	 * 
	 * @Override public com.atg.reviewReply.dao.ReviewReplyDto
	 * selectLastReply(Map<String, String> map) { // TODO Auto-generated method stub
	 * return null; }
	 */

	
}	
	
	
	
	
	
	/*
	 * public int delete(Map<String, String> map) { SqlSession session = null; int
	 * res = 0;
	 * 
	 * try { session =getSqlSessionFactory().openSession(false); res =
	 * session.delete(namespace+"delete",map); if(res>0) { session.commit(); } }
	 * catch (Exception e) { // TODO Auto-generated catch block e.printStackTrace();
	 * }finally { session.close(); }
	 * 
	 * return res; }
	 */

	
	
	
	
	
	
	
	
	
	
	
	
	
	//----답변 달기 -----------------------------------------
	
	/*

	@Override
	public int ReviewReplyUpdate(int parentrr_no) {
		SqlSession session = null;
		int res = 0;
		session = getSqlSessionFactory().openSession(false);
		try {
			res = session.update(namespace+"ReviewReplyUpdate", parentrr_no);			
			if (res > 0) {
				session.commit();
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		
		return res;*/
	/*
	 * @Override public int ReviewReplyInsert(Map<String, String> map) { SqlSession
	 * session = null; int res = 0;
	 * 
	 * session = getSqlSessionFactory().openSession(false);
	 * 
	 * try { res =session.insert(namespace + "ReviewReplyInsert" , map);
	 * 
	 * if (res > 0) { session.commit(); } } catch(Exception e) {
	 * e.printStackTrace(); } finally { session.close(); } return 0; }
	 */
	

