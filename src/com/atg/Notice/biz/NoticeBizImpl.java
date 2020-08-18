package com.atg.Notice.biz;

import java.util.List;

import com.atg.Notice.dao.NoticeDao;
import com.atg.Notice.dao.NoticeDaoImpl;
import com.atg.Notice.dto.NoticeDto;
import com.atg.paging.dto.PagingDto;

public class NoticeBizImpl implements NoticeBiz {
	
	private NoticeDao dao = new NoticeDaoImpl();
	
	public List<NoticeDto> selectList(PagingDto pagingDto) {
		return dao.selectList(pagingDto);
	}
	
	public NoticeDto selectOne(int nt_no) {
		return dao.selectOne(nt_no);
	}
	
	public int insert(NoticeDto dto) {
		return dao.insert(dto);
	}
	
	public int update(NoticeDto dto) {
		return dao.update(dto);
	}
	
	public int delete(int nt_no) {
		return dao.delete(nt_no);
	}
	
	public List<NoticeDto> search(String search_op, String search) {
		return dao.search(search_op, search);
	}

	@Override
	public int countPage() {
		// TODO Auto-generated method stub
		return dao.countPage();
	}
	
	public List<NoticeDto> selectlist() {
		return dao.selectlist();
	}
	
}
