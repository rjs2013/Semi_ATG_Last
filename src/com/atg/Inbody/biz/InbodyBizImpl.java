package com.atg.Inbody.biz;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.atg.Inbody.dao.InbodyDaoImpl;
import com.atg.Inbody.dao.InbodyDao;
import com.atg.Inbody.dto.InbodyDto;

public class InbodyBizImpl implements InbodyBiz {

	InbodyDao dao = new InbodyDaoImpl();
	@Override
	public List<InbodyDto> selectList(int mb_no) {
		
		return dao.selectList(mb_no);
	}
	
	public int insertInbody(InbodyDto dto) {
		//dto.setBmi(dto.getWeight()/(dto.getHeight()*dto.getHeight()));
		return dao.insertInbody(dto);
	}
	

}
