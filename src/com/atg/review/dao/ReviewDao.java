package com.atg.review.dao;

import java.util.List;

import com.atg.paging.dto.PagingDto;
import com.atg.review.dto.ReviewDto;

public interface ReviewDao {
	
	public List<ReviewDto> selectList(PagingDto pagingDto);
	public ReviewDto selectOne(int rv_no);
	public int insert(ReviewDto dto);
	public int update(ReviewDto dto);
	public int delete(int rv_no, String mb_id);
	public int countPage();
	public List<ReviewDto> selectlist();
}
