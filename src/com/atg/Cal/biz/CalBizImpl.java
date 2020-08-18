package com.atg.Cal.biz;

import java.util.List;

import com.atg.Cal.dao.CalDao;
import com.atg.Cal.dao.CalDaoImpl;
import com.atg.Cal.dto.CalDto;

public class CalBizImpl implements CalBiz {

	private CalDao dao = new CalDaoImpl();
	
	public int insertCal(CalDto dto) {
		return dao.insertCal(dto);
	}
	
	public List<CalDto> getCalList(String mb_id, String yyyyMMdd) {
		return dao.getCalList(mb_id, yyyyMMdd);
	}
	
	public CalDto selectOne(int mb_no) {
		return dao.selectOne(mb_no);
	}
	
	public int update(CalDto dto) {
		return dao.update(dto);
	}
	
	
	public List<CalDto> getViewList(String mb_id, String yyyyMM) {
		return dao.getViewList(mb_id, yyyyMM);
	}
	
	public int getViewCount(String mb_id, String yyyyMM) {
		return dao.getViewCount(mb_id, yyyyMM);
	}
	
	public int delete(int ca_no) {
		return dao.delete(ca_no);
	}
	
	public List<CalDto> getView(String mb_id) {
		return dao.getView(mb_id);
	}
	
}
