package com.atg.Item.biz;

import java.util.List;

import com.atg.Item.dto.ItemDto;

public interface ItemBiz {
	
	
	
	public List<ItemDto> selectList();
	public ItemDto selectOne(int item_no);

}
