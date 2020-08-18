package com.atg.Basket.db;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class BasketSqlMapConfig {
	
private SqlSessionFactory sqlsessionFactory;
	
	
	public SqlSessionFactory getSqlSessionFactory() {
		
		String resource ="com/atg/Basket/db/Basketconfig.xml";
		
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
