package com.atg.Member.biz;

import java.util.List;

import com.atg.Member.dao.MemberDao;
import com.atg.Member.dao.MemberDaoImpl;
import com.atg.Member.dto.MemberDto;
import com.atg.paging.dto.PagingDto;

public class MemberBizImpl implements MemberBiz {
	
	private MemberDao dao = new MemberDaoImpl();
	
	public List<MemberDto> selectList(PagingDto pagingDto) {
		return dao.selectList(pagingDto);
	}
	
	public MemberDto selectOne(int mb_no) {
		return dao.selectOne(mb_no);
	}
	
	public int update(MemberDto dto) {
		return dao.update(dto);
	}
	
	public List<MemberDto> search(String search_op, String search) {
		return dao.search(search_op, search);
	}
	
	public MemberDto privarcy(int mb_no, String mb_pw) {
		return dao.privarcy(mb_no, mb_pw);
	}
	
	public int updateUser(MemberDto dto) {
		return dao.updateUser(dto);
	}
	
	public int delete(int mb_no) {
		return dao.delete(mb_no);
	}

	@Override
	public int update_photo(MemberDto dto) {
		// TODO Auto-generated method stub
		return dao.update_photo(dto);
	}

	

	@Override
	public int countPage() {
		// TODO Auto-generated method stub
		return dao.countPage();
	}

}
