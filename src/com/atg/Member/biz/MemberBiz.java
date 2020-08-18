package com.atg.Member.biz;

import java.util.List;

import com.atg.Member.dto.MemberDto;
import com.atg.paging.dto.PagingDto;

public interface MemberBiz {
	
	public List<MemberDto> selectList(PagingDto pagingDto);
	public MemberDto selectOne(int mb_no);
	public int update(MemberDto dto);
	public List<MemberDto> search(String search_op, String search);
	public MemberDto privarcy(int mb_no, String mb_pw);
	public int updateUser(MemberDto dto);
	public int delete(int mb_no);
	public int update_photo(MemberDto dto);
	public int countPage();
}
