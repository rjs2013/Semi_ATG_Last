package com.atg.Basket.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.atg.Basket.db.BasketSqlMapConfig;
import com.atg.Basket.dto.BasketDto;
import com.atg.Register.dto.RegisterDto;

public class BasketDaoImpl extends BasketSqlMapConfig implements BasketDao {

	private String namespace="Basket.";
	
	@Override
	public List<BasketDto> isMember(int mb_no) {
		SqlSession session = null;
		List<BasketDto> list = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			// autocommit 할거냐 말거냐 기본값이 true
			list = session.selectList(namespace+"isMember");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return list;
	}

	//장바구니에서 보여질 리스트 : (item)사진, (item)상품이름, (basket)수량, (item)가격
	@Override
	public List<BasketDto> selectList(int mb_no) {
		SqlSession session = null;
		List<BasketDto> list = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			// autocommit 할거냐 말거냐 기본값이 true
			list = session.selectList(namespace+"selectList",mb_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public int insert(BasketDto dto) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+"insertBas", dto);
			if(res > 0) {
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
	
	//여러개 삭제
		public int multiDelete(String[] seq) {  
			int count = 0;
			Map<String,String[]> map = new HashMap<>(); //String[] 에 seq가 들어가있음
			map.put("seqs",seq); //seq는 "seqs"라는 이름으로 넣을겨
			SqlSession session = null;
			for(int i=0; i <seq.length ; i++) {
				System.out.println(seq[i]);
			}
			
			try {
				session = getSqlSessionFactory().openSession(false);
				count = session.delete(namespace+"muldel", map);
				if(count == seq.length) {
					session.commit();
				}
			} catch (Exception e) {
				System.out.println("[error] MultiDelete");
				e.printStackTrace();
			}finally {
				session.close();
			}
			
			return count;
		}

		//결제하기
		@Override
		public BasketDto selectPay(int mb_no, int bas_no) {
			SqlSession session = null;
			BasketDto dto = null;
			
			Map<String,Integer> map = new HashMap<>();
			map.put("mb_no",mb_no);
			map.put("bas_no",bas_no);
			
			try {
				session = getSqlSessionFactory().openSession(false);
				dto = session.selectOne(namespace+"gopay",map);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				session.close();
			}
			return dto;
		}

		//결제 완료시, 결제 여부 수정
		@Override
		public int update(BasketDto dto) {
			SqlSession session = null;
			int res = 0;
			
			try {
				session = getSqlSessionFactory().openSession(false);
				res = session.update(namespace+"update", dto);
				if(res > 0) {
					session.commit();
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				session.close();
			}
			return res;
		}
}
