package com.atg.Item.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.atg.Item.dto.ItemDto;

public class ItemDaoImpl extends ItemSqlMapConfig implements ItemDao {
	
	private String namespace = "Item.";

	@Override
	public List<ItemDto> selectList() {
		SqlSession session = null;
		List<ItemDto> list = null;
		
		
		session = getSqlSessionFactory().openSession(false);
		list = session.selectList(namespace+"selectList");
		session.close();
		
		return list;
	}

	@Override
	public ItemDto selectOne(int item_no) {
		SqlSession session = null;
		ItemDto dto = null;
		
		try {
			//true : autocommit해주겠다.
			session = getSqlSessionFactory().openSession(false);
			//
			dto = session.selectOne(namespace+"selectOne",item_no);
		} catch (Exception e) {
			System.out.println("[error] selectOne");
			e.printStackTrace();
		}
		return dto;
	}

}
