package com.atg.Register.dao;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class RegisterSqlMapConfig {
private SqlSessionFactory sqlsessionFactory;
	
	
	public SqlSessionFactory getSqlSessionFactory() {
		
		String resource ="com/atg/Register/db/Registerconfig.xml";
		
		InputStream inputStream = null;
		
		try {
			inputStream =Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sqlsessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		
		
		return sqlsessionFactory;
	}

}
