package com.atg.Weather.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.atg.Weather.dto.WeatherDto;

public class WeatherDaoImpl extends WeatherSqlMapConfig implements WeatherDao {
	private final String namespace="weather.";
	
	public List<WeatherDto> searchlist(String search) {
		SqlSession session = null;
		List<WeatherDto> list = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			
			list = session.selectList(namespace+"searchlist", search);
		} catch (Exception e) {
			e.printStackTrace();
		}	finally {
			session.close();
		}
		return list;
	}
	
	public String search(String search) {
		SqlSession session = null;
		String code = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			
			code = session.selectOne(namespace+"search", search);
		} catch (Exception e) {
			e.printStackTrace();
		}	finally {
			session.close();
		}
		return code;
	}
	
}
