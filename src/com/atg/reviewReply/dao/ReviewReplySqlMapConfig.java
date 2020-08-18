package com.atg.reviewReply.dao;

import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.atg.reviewReply.dto.ReviewReplyDto;

public class ReviewReplySqlMapConfig {
	
	private SqlSessionFactory SqlSessionFactory;
	
	public SqlSessionFactory getSqlSessionFactory() {
		
		String resource="com/atg/reviewReply/db/ReviewReplyConfig.xml";
		
		InputStream inputStream = null;
		
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		SqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		
		
		return SqlSessionFactory;
		
	}

	

}
