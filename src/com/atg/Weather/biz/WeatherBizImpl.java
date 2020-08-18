package com.atg.Weather.biz;

import java.util.List;

import com.atg.Weather.dao.WeatherDao;
import com.atg.Weather.dao.WeatherDaoImpl;
import com.atg.Weather.dto.WeatherDto;

public class WeatherBizImpl implements WeatherBiz{

	private WeatherDao dao = new WeatherDaoImpl();
	
	public List<WeatherDto> searchlist(String search) {
		return dao.searchlist(search);
	}
	
	public String search(String search) {
		return dao.search(search);
	}
	
}
