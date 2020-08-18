package com.atg.Inbody.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.atg.Inbody.dto.InbodyDto;

public interface InbodyDao {

	public List<InbodyDto> selectList(int mb_no);
	public int insertInbody(InbodyDto dto);
		
}
	
