package com.atg.Item.dao;

import java.util.List;

import com.atg.Item.dto.ItemDto;

public interface ItemDao {
	
	public List<ItemDto> selectList();
	public ItemDto selectOne(int item_no);

}
