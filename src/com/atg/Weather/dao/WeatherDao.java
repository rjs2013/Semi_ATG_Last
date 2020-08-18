package com.atg.Weather.dao;

import java.util.List;

import com.atg.Weather.dto.WeatherDto;

public interface WeatherDao {
	
	public List<WeatherDto> searchlist(String search);
	public String search(String search);

}
