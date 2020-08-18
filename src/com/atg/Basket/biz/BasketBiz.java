package com.atg.Basket.biz;

import java.util.List;

import com.atg.Basket.dao.BasketDao;
import com.atg.Basket.dao.BasketDaoImpl;
import com.atg.Basket.dto.BasketDto;

public interface BasketBiz {
	
	public List<BasketDto> selectList(int mb_no);
	
	public int insert(BasketDto dto);
	
	public int multiDelete(String[] seq);
	
	public BasketDto selectPay(int mb_no, int bas_no);
	
	public int update(BasketDto dto);

}
