package com.atg.Weather.biz;

import java.util.List;

import com.atg.Weather.dto.WeatherDto;

public interface WeatherBiz {
	
	public List<WeatherDto> searchlist(String search);
	public String search(String search);

}
