package com.atg.Basket.dao;

import java.util.List;

import com.atg.Basket.dto.BasketDto;

public interface BasketDao {
	
	public List<BasketDto> isMember(int mb_no);
	
	public List<BasketDto> selectList(int mb_no);
	
	public int insert(BasketDto dto);
	
	public int multiDelete(String[] seq);

	public BasketDto selectPay(int mb_no, int bas_no);
	
	public int update(BasketDto dto);
}
