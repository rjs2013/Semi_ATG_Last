package com.atg.Cal.dao;

import java.sql.Date;
import java.util.List;

import com.atg.Cal.dto.CalDto;

public interface CalDao {
	
	public int insertCal(CalDto dto);
	public List<CalDto> getCalList(String mb_id, String yyyyMMdd);
	public CalDto selectOne(int mb_no);
	public int update(CalDto dto);
	
	public List<CalDto> getViewList(String mb_id, String yyyyMM);
	public int getViewCount(String mb_id, String yyyyMM);
	public int delete(int ca_no);
	public List<CalDto> getView(String mb_id);

}





