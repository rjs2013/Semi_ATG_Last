package com.atg.Item.biz;

import java.util.List;

import com.atg.Item.dao.ItemDao;
import com.atg.Item.dao.ItemDaoImpl;
import com.atg.Item.dto.ItemDto;

public class ItemBizImpl implements ItemBiz {
	
	ItemDao dao = new ItemDaoImpl();
	
	public List<ItemDto> selectList(){
		return dao.selectList();
	}
	
	public ItemDto selectOne(int item_no) {
		return dao.selectOne(item_no);
	}



}
