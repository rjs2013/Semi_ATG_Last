package com.atg.reviewReply.biz;

import java.util.List;
import java.util.Map;

import com.atg.reviewReply.dao.ReviewReplyDao;
import com.atg.reviewReply.dao.ReviewReplyDaoImpl;
import com.atg.reviewReply.dao.ReviewReplySqlMapConfig;
import com.atg.reviewReply.dto.ReviewReplyDto;

public class ReviewReplyBizImpl extends ReviewReplySqlMapConfig implements ReviewReplyBiz {
		//
	
	
	
		ReviewReplyDao dao = new ReviewReplyDaoImpl();
		
		
	//리스트 전체 	
	@Override
	public List<ReviewReplyDto> seleList(int rv_no) {
		
		
		return dao.seleList(rv_no);
	}

	@Override
	public ReviewReplyDto selectOne(int rv_no) {
		// TODO Auto-generated method stub
		return dao.selectOne(rv_no);
	}

	@Override
	public int insert(ReviewReplyDto dto) {
		
		return dao.insert(dto);
	}
	
	
	
	/* ajax insert 부분 
	 * @Override public ReviewReplyDto insert(Map<String, String> map) {
	 * 
	 * System.out.println("리뷰비즈임플 "+map);
	 * 
	 * int result = dao.insert(map);
	 * 
	 * System.out.println("리뷰비즈임플==>"+result); ReviewReplyDto resultDto = null; if
	 * (result == 1) { resultDto = dao.selectLastReply(map); if (resultDto ==null) {
	 * return null; }else { return resultDto; } } else { return null; }
	 * 
	 * }
	 */
	@Override
	public int update(ReviewReplyDto dto) {
		// TODO Auto-generated method stub
		return dao.update(dto);
	}

	
	
	
	
	@Override
	public int delete(int rr_no,String mb_id) {
		
		return dao.delete(rr_no,mb_id);
	}
	
	
	@Override
	public int answerProc(ReviewReplyDto dto) {
		int update = dao.answerUpdate(dto.getRr_no());
		int insert = dao.answerInsert(dto);
		
		return update + insert;
	}

	/*
	 * @Override public ReviewReplyDto selectLastReply(Map<String, String> map) { //
	 * TODO Auto-generated method stub return null; }
	 */

	@Override
	public int answerProc(Map<String, String> param) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ReviewReplyDto selectLastReply(Map<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
	/*
	 * public ReviewReplyDto delete(Map<String, String> map ) {
	 * 
	 * int result = dao.delete(map);
	 * 
	 * System.out.println("리뷰비즈임플==>"+result); ReviewReplyDto resultDto = null; if
	 * (result != 0) {
	 * 
	 * resultDto = dao.selectLastReply(map);
	 * System.out.println(resultDto+"비즈임플에 selectreturn단"); if (resultDto ==null) {
	 * return null; }else { return resultDto; } } else { return null; }
	 * 
	 * 
	 * }
	 */

	/*
	 * @Override public ReviewReplyDto selectLastReply(Map<String, String> map) { //
	 * TODO Auto-generated method stub return null; }
	 * 
	 * 
	 * 
	 * @Override public int answerProc(Map<String, String> map) { int parentRR_no =
	 * Integer.parseInt((String)map.get("parentRR_no")); int update =
	 * dao.ReviewReplyUpdate(parentRR_no);
	 * 
	 * int insert = dao.ReviewReplyInsert(map);
	 * 
	 * return update+insert;
	 * 
	 * 
	 * }
	 */
}
