package com.atg.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import com.atg.Cal.dto.CalDto;

public class Utils {
	
	private String toDates;
	
	public String getToDates() {
		return toDates;
	}
	
	public void setToDates(String mdate) {
		// yyyy-MM-dd hh:mm:00 -> Timestamp가 이런 형식의 문자열을 밀리세컨드 까지 표시해주는(나노 초 까지 가능) date 타입으로 바꿔준다
		String m = mdate.substring(0, 4) + "-"
				 + mdate.substring(4, 6) + "-"
				 + mdate.substring(6, 8) + " "
				 + mdate.substring(8, 10) + ":"
				 + mdate.substring(10) + ":00";
		
		// SimpleDateFormat = 시간을 내가 원하는 방식으로 표시(y는 년도, M은 월(1~12), d는 일(해당 월의 일 1~31), H는 시간(0~23), m은 분
		// D는 해당 연도의 일을 표시(0~366), h는 시간(1~12)
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일 HH시mm분");

		// Timestamp.valueOf = String 객체를 Timestamp객체로 변환(나노초 까지 표시 가능)
		Timestamp tm = Timestamp.valueOf(m);
		
		// tm을 sdf의 시간형식처럼 바꿔서 toDates에 담아준다
		toDates = sdf.format(tm);
						 
	}
	
	public static String isTwo(String msg) {
		
		return (msg.length()<2)? "0"+msg : msg;
	}
	
	public static String fontColor(int date, int dayOfWeek) {
		String color = "";
		
		if((dayOfWeek-1+date)%7 == 0 || (dayOfWeek-1+date)%7 == 1) {
			color="red";
		} else color="black";
		return color;
	}
	
	public static String getViewTitle(int i, List<CalDto> clist) {
		
		String date = isTwo(i+"");
		String res = "";
		
		for(CalDto dto : clist) {
			// yyyyMMddHH
			if(dto.getCa_mdate().substring(6, 8).equals(date)) {
				res += "<p>"
					 + ((dto.getCa_title().length() > 6)? dto.getCa_title().substring(0, 6)+"..." : dto.getCa_title())
					 + "</p>";
			}
		}
		
		return res;
	}
	
}
