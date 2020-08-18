package com.atg.Inbody.biz;

import java.util.List;

import com.atg.Inbody.dto.InbodyDto;

public interface InbodyBiz {
	
	public List<InbodyDto> selectList(int mb_no);
	public int insertInbody(InbodyDto dto);
}
