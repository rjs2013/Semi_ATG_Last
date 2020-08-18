package com.atg.reviewReply.dao;

import java.util.List;
import java.util.Map;

import com.atg.reviewReply.dto.ReviewReplyDto;

public interface ReviewReplyDao{
	
	
	//list 전체 출력 
	public List<ReviewReplyDto> seleList(int rv_no);
	
	//detail 값 출력 
	public ReviewReplyDto selectOne(int rv_no);
	
	
	
	//글작성하기 
	//public int insert(Map<String, String> map);
	public int insert(ReviewReplyDto dto);
	
	
	//답글 수정하기 
	public int update(ReviewReplyDto dto);
	
	
	//답글 삭제하기 
	public int delete(int rr_no,String mb_id);
	
	
	//마지막 select문 돌리기 
	public ReviewReplyDto selectLastReply(Map<String, String> map);
	
	
	public int answerUpdate(int parentrr_no);
	public int answerInsert(ReviewReplyDto dto);


}
